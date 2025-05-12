module Jekyll
  class RedirectsJsonGenerator < Generator
    safe true
    priority :highest # Выполнить в самом начале

    def generate(site)
      # Находим файл redirects.json в исходниках
      redirects_file = site.pages.find { |page| page.name == "redirects.json" }
      
      if redirects_file
        # Добавляем свойство, чтобы его не обрабатывал LanguageGenerator
        # Используем 'skip_localization' вместо 'none', чтобы избежать ошибки '/none/' not found
        redirects_file.data['skip_localization'] = true
        
        # Убедимся, что он не будет перемещен в языковой субдиректории
        redirects_file.instance_variable_set(:@dir, "")
        redirects_file.data['permalink'] = "/redirects.json"
      end
    end
  end

  # Обработчик для гарантированного копирования redirects.json в выходную директорию
  class RedirectsJsonPostWriter < Jekyll::Generator
    safe true
    priority :lowest # Выполнить в самом конце процесса

    def generate(site)
      # После обработки всего сайта, мы проверяем, был ли сгенерирован redirects.json
      redirects_content = nil

      # Проверяем, есть ли файл redirects.json в исходниках
      redirects_file_path = File.join(site.source, "redirects.json")
      
      if File.exist?(redirects_file_path)
        # Составляем переменные Jekyll для использования в шаблоне
        frontmatter = File.read(redirects_file_path).match(/---(.+?)---/m)
        
        # Получаем содержимое файла после front matter
        file_content = File.read(redirects_file_path).sub(/---(.+?)---/m, '')

        # Обрабатываем шаблонные переменные Jekyll
        redirects_content = file_content
        
        # Замена переменных Jekyll
        redirects_content.gsub!(/\{\{\s*site\.url\s*\}\}/, site.config['url'] || '')
        
        # Замена циклов и условий Jekyll - это сложнее, но для простого json достаточно базовой замены

        # Запись файла в выходную директорию
        output_path = File.join(site.dest, "redirects.json")
        FileUtils.mkdir_p(File.dirname(output_path))
        File.write(output_path, redirects_content)
      end
    end
  end
end
