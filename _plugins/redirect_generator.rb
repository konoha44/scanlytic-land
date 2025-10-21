require 'set'

module Jekyll
  class RedirectGenerator < Generator
    safe true
    priority :low

    def generate(site)
      Jekyll.logger.info "RedirectGenerator:", "Starting redirect generation"
      
      # Собираем все перенаправления
      redirects = []

      # Перенаправления на локализованные версии страниц
      # Так как оригинальные страницы удаляются из сборки, перенаправляем на версию с языком по умолчанию
      default_lang = site.config['default_lang'] || 'en'
      
      # Перенаправление с корня на английскую версию создаётся через index_redirect.html
      # redirects << { "from" => "/", "to" => "/en/" }
      
      # Перенаправления для подстраниц в корне на версии с языком по умолчанию
      redirects << { "from" => "/product", "to" => "/en/product/" }
      redirects << { "from" => "/product/", "to" => "/en/product/" }
      redirects << { "from" => "/contact", "to" => "/en/contact/" }
      redirects << { "from" => "/contact/", "to" => "/en/contact/" }
      redirects << { "from" => "/blog", "to" => "/en/blog/" }
      redirects << { "from" => "/blog/", "to" => "/en/blog/" }
      redirects << { "from" => "/qr-generator", "to" => "/en/qr-generator/" }
      redirects << { "from" => "/qr-generator/", "to" => "/en/qr-generator/" }
      redirects << { "from" => "/about", "to" => "/en/about/" }
      redirects << { "from" => "/about/", "to" => "/en/about/" }
      redirects << { "from" => "/tags", "to" => "/en/tags/" }
      redirects << { "from" => "/tags/", "to" => "/en/tags/" }
      redirects << { "from" => "/categories", "to" => "/en/categories/" }
      redirects << { "from" => "/categories/", "to" => "/en/categories/" }

      # Оставляем логику для специальных случаев перенаправления
      site.config['languages'].each do |lang|
        next if lang == site.config['default_lang']
        
        # Здесь могут быть другие специальные перенаправления для конкретных языков
        # Например:
        # redirects << { "from" => "/#{lang}/old-page", "to" => "/#{lang}/new-page/" }
      end

      # Собираем все существующие пути генерируемых страниц
      existing_paths = Set.new
      site.pages.each do |page|
        if page.path.end_with?('.md') && !page.data['permalink'].nil?
          # Добавляем путь из permalink в список существующих
          existing_paths << page.data['permalink'].gsub(/\/$/, '') # Удаляем завершающий слеш для сравнения
          Jekyll.logger.debug "RedirectGenerator:", "Existing path from permalink: #{page.data['permalink']}"
        elsif !page.url.nil?
          # Добавляем URL страницы в список существующих
          existing_paths << page.url.gsub(/\/$/, '') # Удаляем завершающий слеш для сравнения
          Jekyll.logger.debug "RedirectGenerator:", "Existing path from url: #{page.url}"
        end
      end

      # Создаем файлы перенаправления только для путей, которые не будут созданы другими плагинами
      redirects.each do |redirect|
        from = redirect["from"]
        to = redirect["to"]
        
        # Пропускаем создание редиректа, если страница с таким URL уже будет создана
        if existing_paths.include?(from)
          Jekyll.logger.info "RedirectGenerator:", "Skipping redirect from #{from} to #{to} - path already exists"
          next
        end
        
        redirect_page = RedirectPage.new(site, site.source, from, to)
        site.pages << redirect_page
        Jekyll.logger.info "RedirectGenerator:", "Created redirect from #{from} to #{to}, dir: '#{redirect_page.dir}', name: '#{redirect_page.name}'"
      end
    end
  end

  class RedirectPage < Page
    def initialize(site, base, from, to)
      @site = site
      @base = base

      # Путь без ведущего слеша для построения файловой структуры
      path = from[1..-1] || ""
      
      # Определяем директорию и имя файла
      if path.empty? || path == ""
        @dir = ""
        @name = 'index.html'
        Jekyll.logger.debug "RedirectGenerator:", "Root redirect: path='#{path}', @dir='#{@dir}', @name='#{@name}'"
      elsif path.end_with?('/')
        # Путь заканчивается на /, например /about/
        @dir = path.chomp('/')
        @name = 'index.html'
      elsif path.include?('/')
        # Путь содержит /, но не заканчивается на него
        @dir = File.dirname(path)
        @name = File.basename(path) + '.html'
      else
        # Простой путь без /, например 'about'
        @dir = ""
        @name = path + '.html'
      end

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'redirect.html')
      self.data['redirect_to'] = to
      self.data['sitemap'] = false
    end
  end
end