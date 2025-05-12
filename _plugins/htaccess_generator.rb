module Jekyll
  module HtaccessCopyHook
    # Using a post_write hook to ensure it runs after site generation
    Jekyll::Hooks.register :site, :post_write do |site|
      # Read the existing .htaccess file
      htaccess_path = File.join(site.source, ".htaccess")
      
      if File.exist?(htaccess_path)
        htaccess_content = File.read(htaccess_path)
        
        # Directly write the content to the output directory
        htaccess_dest_path = File.join(site.dest, ".htaccess")
        FileUtils.mkdir_p(File.dirname(htaccess_dest_path))
        File.write(htaccess_dest_path, htaccess_content)
        
        Jekyll.logger.info "HtaccessCopyHook:", "Successfully copied .htaccess content to site output"
      else
        Jekyll.logger.warn "HtaccessCopyHook:", ".htaccess file not found in source directory"
      end
    end
  end
end
