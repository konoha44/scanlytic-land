require 'set'

module Jekyll
  class RedirectGenerator < Generator
    safe true
    priority :low

    def generate(site)
      Jekyll.logger.info "RedirectGenerator:", "Starting redirect generation"
      
      # Собираем все перенаправления
      redirects = []

      # Перенаправления с URL без завершающего слеша
      redirects << { "from" => "/about", "to" => "/about/" }
      redirects << { "from" => "/product", "to" => "/product/" }
      redirects << { "from" => "/contact", "to" => "/contact/" }
      redirects << { "from" => "/blog", "to" => "/blog/" }
      redirects << { "from" => "/qr-generator", "to" => "/qr-generator/" }

      # Перенаправления для языковых версий
      site.config['languages'].each do |lang|
        next if lang == site.config['default_lang']
        
        redirects << { "from" => "/#{lang}", "to" => "/#{lang}/" }
        redirects << { "from" => "/#{lang}/about", "to" => "/#{lang}/about/" }
        redirects << { "from" => "/#{lang}/product", "to" => "/#{lang}/product/" }
        redirects << { "from" => "/#{lang}/contact", "to" => "/#{lang}/contact/" }
        redirects << { "from" => "/#{lang}/blog", "to" => "/#{lang}/blog/" }
        redirects << { "from" => "/#{lang}/qr-generator", "to" => "/#{lang}/qr-generator/" }
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
        Jekyll.logger.info "RedirectGenerator:", "Created redirect from #{from} to #{to}"
      end
    end
  end

  class RedirectPage < Page
    def initialize(site, base, from, to)
      @site = site
      @base = base

      # Путь без ведущего слеша для построения файловой структуры
      path = from[1..-1]
      @dir = File.dirname(path) if path.include?('/')
      @dir = "" if path == "" || !path.include?('/')

      # Имя файла
      @name = path.include?('/') ? File.basename(path) + '.html' : path + '.html'
      @name = 'index.html' if @name == '.html'

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'redirect.html')
      self.data['redirect_to'] = to
      self.data['sitemap'] = false
    end
  end
end
