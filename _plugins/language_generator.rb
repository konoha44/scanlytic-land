# _plugins/language_generator.rb
require 'jekyll'
require 'set'

module Jekyll
  class LanguagePage < Page
    def initialize(site, base_dir_of_source_file, dir_of_source_file_within_base, name_of_source_file, lang, source_item)
      @site = site
      @base = site.source # Correct base path for Jekyll::Page

      # Determine the directory and name for the new page in the output
      path_parts = source_item.url.split('/').reject(&:empty?)
      
      if source_item.url == "/" # Specifically for main_index.md with permalink: /
        @name = "index.html"
        @dir = lang # Output will be /lang/index.html
      elsif name_of_source_file.end_with?('.html', '.md', '.markdown') && source_item.url.end_with?('/')
        # This handles cases like /blog/ (blog/index.html) or /some-page/ (some-page/index.md)
        @name = "index.html" # or source_item.basename if it's not index.html implicitly
        @dir = File.join(lang, *path_parts)
      elsif path_parts.last&.include?('.') # Ends with a filename like page.html
        @name = path_parts.last
        @dir = File.join(lang, *path_parts[0...-1])
      else # Ends with a directory but should be treated as such (e.g. /page/ -> /lang/page/index.html)
        @name = "index.html"
        @dir = File.join(lang, *path_parts)
      end
      
      # Ensure the directory structure is /lang/path/
      @dir = "#{lang}/" if @dir == lang 
      @dir = @dir.gsub(%r{^/*#{lang}/*}, "#{lang}/").chomp('/') # Normalize, ensure it starts with lang/ and remove trailing slash for File.join
      @dir += '/' unless @dir.end_with?('/') # Ensure @dir ends with a slash for Jekyll processing


      self.process(@name) # Process the source file name

      self.content = source_item.content
      self.data = source_item.data.dup

      self.data['lang'] = lang
      self.data['source_item_url'] = source_item.url 
      self.data['original_path'] = source_item.path

      # Construct the new permalink
      new_permalink_base = source_item.url.sub(%r{^/*}, '') # Remove leading slashes
      if new_permalink_base.empty? || new_permalink_base == "index.html" # Root index.html from main_index.md or similar
        self.data['permalink'] = "/#{lang}/"
      elsif new_permalink_base == "404.html" # Special handling for 404 pages
        self.data['permalink'] = "/#{lang}/404.html"
      else
        self.data['permalink'] = "/#{lang}/#{new_permalink_base}"
      end

      # Ensure permalinks for index.html files end with a slash
      if @name == "index.html" && !self.data['permalink'].end_with?('/')
        self.data['permalink'] += '/'
      end
      
      # Carry over date for posts if they were accidentally processed as pages (should not happen with new logic)
      if source_item.is_a?(Jekyll::Document) && source_item.collection.label == "posts"
        self.data['date'] = source_item.data['date'] if source_item.data['date']
      end

      self.data.delete('canonical_url') # Avoid conflicts with SEO tag
    end
  end

  class LanguageGenerator < Generator
    safe true
    priority :low # Run after most other generators

    def generate(site)
      puts "[LanguageGenerator] Starting plugin execution."
      # Создаем множество для отслеживания уже созданных URL
      @generated_permalinks = Set.new
      
      languages = site.config['languages'] || []
      if languages.empty?
        puts "[LanguageGenerator] No languages configured. Exiting."
        return
      end
      default_lang = site.config['default_lang'] || languages.first
      puts "[LanguageGenerator] Configured languages: #{languages.join(', ')}. Default: #{default_lang}"

      originals_to_remove_from_site_pages = []

      # --- Process Regular Pages ---
      puts "[LanguageGenerator] Processing regular pages. Initial count: #{site.pages.length}"
      site.pages.dup.each_with_index do |page, index|
        # puts "[LanguageGenerator] Checking page ##{index + 1}: #{page.relative_path} (URL: #{page.url})"
        unless is_source_for_localization?(page, site, languages, default_lang)
          next
        end
        # Пропускаем страницы, отмеченные флагом skip_localization
        if page.data['skip_localization'] && page.name != '404.md'
          puts "[LanguageGenerator]     Skipping '#{page.relative_path}': skip_localization flag is set"
          next
        end
        # Старый вариант проверки для обратной совместимости
        if page.data['lang'] == 'none' && page.name != '404.md'
          puts "[LanguageGenerator]     Skipping '#{page.relative_path}': lang=none is set (deprecated)"
          next
        end
        puts "[LanguageGenerator] ==> Localizing page: #{page.relative_path}"
        
        languages.each do |lang|
          # Use page.dir and page.name which are relative to site.source for LanguagePage
          lang_page = LanguagePage.new(site, site.source, page.dir, page.name, lang, page)
          
          # Проверяем, был ли уже создан такой URL
          permalink = lang_page.data['permalink']
          if @generated_permalinks.include?(permalink)
            puts "[LanguageGenerator]     Skipping '#{lang}' version for page '#{page.relative_path}' - permalink '#{permalink}' already exists"
            next
          end
          
          @generated_permalinks.add(permalink)
          site.pages << lang_page
          puts "[LanguageGenerator]     Generated '#{lang}' version for page '#{page.relative_path}'. Permalink: '#{permalink}'"
        end
        originals_to_remove_from_site_pages << page
        puts "[LanguageGenerator]     Marked original page '#{page.relative_path}' for removal from output."
      end
      site.pages.reject! { |p| originals_to_remove_from_site_pages.include?(p) }
      puts "[LanguageGenerator] Regular pages processing finished. Current page count: #{site.pages.length}"

      # --- Process Posts ---
      puts "[LanguageGenerator] Processing posts. Initial count: #{site.posts.docs.length}"
      
      newly_generated_post_docs = []
      original_posts_localized = []

      site.posts.docs.each do |post| # Iterate over a copy if modifying collection during iteration
        # puts "[LanguageGenerator] Checking post: #{post.relative_path} (URL: #{post.url})"
        unless is_source_for_localization?(post, site, languages, default_lang)
          newly_generated_post_docs << post # Keep non-localized posts
          # puts "[LanguageGenerator]     Kept original post '#{post.relative_path}' as it's not a source for localization."
          next
        end
        puts "[LanguageGenerator] ==> Localizing post: #{post.relative_path}"

        languages.each do |lang|
          # Create a new Document for each language
          new_post = Jekyll::Document.new(
            post.path, # Absolute path to the source file
            { site: site, collection: site.collections['posts'] }
          )
          new_post.read # Read content and frontmatter, this populates new_post.data

          # Modify the existing new_post.data hash
          new_post.data['lang'] = lang
          
          # Construct permalink: /lang/original_post_url
          original_url_cleaned = post.url.sub(%r{^/*}, '') # Remove leading slash from original URL
          new_permalink = "/#{lang}/#{original_url_cleaned}"
          new_post.data['permalink'] = new_permalink
          
          # Проверяем, был ли уже создан такой URL
          if @generated_permalinks.include?(new_permalink)
            puts "[LanguageGenerator]     Skipping '#{lang}' version for post '#{post.relative_path}' - permalink '#{new_permalink}' already exists"
            next
          end
          @generated_permalinks.add(new_permalink)
          
          # Ensure essential post attributes are present
          # new_post.read should have populated 'date' from front matter.
          # If not, or to ensure it matches the original post object's date:
          new_post.data['date'] ||= post.date # Carry over date if not in front matter

          newly_generated_post_docs << new_post
          puts "[LanguageGenerator]     Generated '#{lang}' version for post '#{post.relative_path}'. Permalink: '#{new_permalink}'"
        end
        original_posts_localized << post # Mark this original as having been localized
      end

      # Replace the posts collection with the new set of documents
      site.posts.docs = newly_generated_post_docs
      puts "[LanguageGenerator] Posts processing finished. New site.posts.docs count: #{site.posts.docs.length}"
      
      puts "[LanguageGenerator] Plugin execution finished. Final page count: #{site.pages.length}, Final post count: #{site.posts.docs.length}"
    end

    private

    def is_source_for_localization?(item, site, languages_config, default_lang)
      # puts "[LanguageGenerator]   is_source_for_localization? checking '#{item.relative_path}' (URL: '#{item.url}')"
      if item.data['skip_localization']
        # puts "[LanguageGenerator]     Skipping '#{item.relative_path}': skip_localization flag is set."
        return false
      end
      
      if item.data['lang']
        # puts "[LanguageGenerator]     Skipping '#{item.relative_path}': Already has lang '#{item.data['lang']}'."
        return false
      end

      # Skip assets, specific files, and excluded files (common logic)
      if item.url&.start_with?("/assets/") || item.url&.start_with?("/img/")
        # puts "[LanguageGenerator]     Skipping '#{item.relative_path}': Is an asset."
        return false
      end
      
      # Files that should never be localized or duplicated
      # Note: sitemap.xml might need language versions if not handled by jekyll-seo-tag correctly for multilingual
      special_files = ['CNAME', 'favicon.ico', 'robots.txt', 'sitemap.xml', 'Gemfile', 'Gemfile.lock', '_config.yml', 'feed.xml']
      if item.is_a?(Jekyll::Page) && item.name == 'index.html' && item.dir == '/' && item.data['layout'] == 'none' # Root redirector
        # puts "[LanguageGenerator]     Skipping '#{item.relative_path}': Is the root redirector index.html."
        return false
      end

      excluded_by_config = (site.config['exclude'] || []).any? do |pattern|
        File.fnmatch(pattern, item.relative_path, File::FNM_PATHNAME | File::FNM_DOTMATCH)
      end
      if excluded_by_config
        # puts "[LanguageGenerator]     Skipping '#{item.relative_path}': Excluded by site.config.exclude."
        return false
      end
      
      if special_files.include?(File.basename(item.path)) && item.relative_path == File.basename(item.path)
        # puts "[LanguageGenerator]     Skipping '#{item.relative_path}': Matched special_files list at root."
        return false
      end
      
      # Check if item is already in a language-specific path
      # For pages: item.dir starts with /lang/
      # For posts: item.relative_path starts with _posts/lang/ (if posts are organized in lang subfolders)
      #            or if their URL is already /lang/...
      
      path_segments = item.dir.split('/').reject(&:empty?) if item.respond_to?(:dir) && item.dir
      path_segments ||= []
      
      # For posts, their dir might be _posts. Check their URL structure if available.
      # This check is primarily for pages not to re-process /en/somepage.html
      if languages_config.include?(path_segments.first)
         # puts "[LanguageGenerator]     Skipping '#{item.relative_path}': Already in a language directory '#{path_segments.first}'."
         return false
      end

      # For posts, if they are in _posts/en/foo.md, their collection path might handle this.
      # The current logic assumes posts are in _posts/foo.md and get lang from generator.
      # If a post was from _posts/en/foo.md, it should ideally have `lang: en` in FM.

      # puts "[LanguageGenerator]   ==> Including '#{item.relative_path}' for localization."
      true
    end
  end
end
