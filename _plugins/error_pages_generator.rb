require 'jekyll'

module Jekyll
  class ErrorPage < Page
    def initialize(site, base, lang, content, data)
      @site = site
      @base = base
      @dir = lang # Output will be in language directory
      @name = "404.html"
      
      self.process(@name)
      self.content = content
      self.data = data.dup
      self.data['lang'] = lang
      self.data['permalink'] = "/#{lang}/404.html"
    end
  end

  class ErrorPagesGenerator < Generator
    safe true
    priority :normal  # Run after language_generator

    def generate(site)
      Jekyll.logger.info "ErrorPagesGenerator:", "Starting 404 pages generation"
      
      # Get core 404 page
      core_404_page = site.pages.find { |p| p.path.end_with?('404.md') }
      
      if core_404_page
        Jekyll.logger.info "ErrorPagesGenerator:", "Found core 404.md page"
        
        # Generate language-specific 404 pages
        languages = site.config['languages'] || []
        default_lang = site.config['default_lang'] || languages.first
        
        languages.each do |lang|
          # Create language-specific 404 page
          error_page = ErrorPage.new(
            site,
            site.source,
            lang,
            core_404_page.content,
            core_404_page.data
          )
          
          # Add the page to the site
          site.pages << error_page
          Jekyll.logger.info "ErrorPagesGenerator:", "Created 404 page for language '#{lang}'"
        end
      else
        Jekyll.logger.warn "ErrorPagesGenerator:", "Couldn't find 404.md in the site source"
      end
    end
  end
end
