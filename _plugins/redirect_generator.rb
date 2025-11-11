require 'set'

module Jekyll
  class RedirectGenerator < Generator
    safe true
    priority :low

    def generate(site)
      Jekyll.logger.info "RedirectGenerator:", "Skipping redirect generation - using .htaccess redirects instead"
      
      # ОТКЛЮЧЕНО: HTML редиректы больше не создаются
      # Все редиректы теперь обрабатываются через .htaccess с 301 кодом
      # Это правильный способ для SEO и избегает проблем с noindex тегами
      
      # Собираем все перенаправления
      redirects = []

      # Перенаправления на локализованные версии страниц
      # Так как оригинальные страницы удаляются из сборки, перенаправляем на версию с языком по умолчанию
      default_lang = site.config['default_lang'] || 'en'
      
      # Перенаправление с корня на английскую версию создаётся через index_redirect.html
      # redirects << { "from" => "/", "to" => "/en/" }
      
      # ОТКЛЮЧЕНО: Перенаправления теперь в .htaccess
      # redirects << { "from" => "/product", "to" => "/en/product/" }
      # redirects << { "from" => "/product/", "to" => "/en/product/" }
      # redirects << { "from" => "/contact", "to" => "/en/contact/" }
      # redirects << { "from" => "/contact/", "to" => "/en/contact/" }
      # redirects << { "from" => "/blog", "to" => "/en/blog/" }
      # redirects << { "from" => "/blog/", "to" => "/en/blog/" }
      # redirects << { "from" => "/qr-generator", "to" => "/en/qr-generator/" }
      # redirects << { "from" => "/qr-generator/", "to" => "/en/qr-generator/" }
      # redirects << { "from" => "/about", "to" => "/en/about/" }
      # redirects << { "from" => "/about/", "to" => "/en/about/" }
      # redirects << { "from" => "/tags", "to" => "/en/tags/" }
      # redirects << { "from" => "/tags/", "to" => "/en/tags/" }
      # redirects << { "from" => "/categories", "to" => "/en/categories/" }
      # redirects << { "from" => "/categories/", "to" => "/en/categories/" }

      # Оставляем логику для специальных случаев перенаправления
      # ОТКЛЮЧЕНО - используем .htaccess
      # site.config['languages'].each do |lang|
      #   next if lang == site.config['default_lang']
      #   # Здесь могут быть другие специальные перенаправления для конкретных языков
      # end

      # ОТКЛЮЧЕНО - HTML редиректы не создаются
      # Все редиректы обрабатываются через .htaccess
      # Это избегает проблем с noindex тегами в Google Search Console
      
      Jekyll.logger.info "RedirectGenerator:", "All redirects are handled by .htaccess file"
      
      # Собираем все существующие пути генерируемых страниц
      # existing_paths = Set.new
      # site.pages.each do |page|
      #   if page.path.end_with?('.md') && !page.data['permalink'].nil?
      #     existing_paths << page.data['permalink'].gsub(/\/$/, '')
      #     Jekyll.logger.debug "RedirectGenerator:", "Existing path from permalink: #{page.data['permalink']}"
      #   elsif !page.url.nil?
      #     existing_paths << page.url.gsub(/\/$/, '')
      #     Jekyll.logger.debug "RedirectGenerator:", "Existing path from url: #{page.url}"
      #   end
      # end

      # ОТКЛЮЧЕНО - не создаем HTML редирект-страницы
      # redirects.each do |redirect|
      #   from = redirect["from"]
      #   to = redirect["to"]
      #   if existing_paths.include?(from)
      #     Jekyll.logger.info "RedirectGenerator:", "Skipping redirect from #{from} to #{to} - path already exists"
      #     next
      #   end
      #   redirect_page = RedirectPage.new(site, site.source, from, to)
      #   site.pages << redirect_page
      #   Jekyll.logger.info "RedirectGenerator:", "Created redirect from #{from} to #{to}, dir: '#{redirect_page.dir}', name: '#{redirect_page.name}'"
      # end
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