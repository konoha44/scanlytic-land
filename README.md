# Scanlytic – Jekyll Source

This repository contains the static si## Deployment

Push to the `main` branch. GitHub Pages (built‑in GitHub Actions for `github-pages` gem) will build and publish automatically.

## Maintenance Guidelines

### Добавление новой страницы

1. Создайте Markdown файл в корне проекта (например, `new-page.md`)
2. Добавьте frontmatter с необходимыми параметрами:
   ```yaml
   ---
   layout: default
   title: "Page Title"
   permalink: /new-page/
   redirect_from:
     - /new-page
   ---
   ```
3. Добавьте перевод заголовков и текстов в `_data/i18n/*.yml` файлы для каждого языка
4. При необходимости добавьте новый маршрут в `_plugins/redirect_generator.rb`

### Добавление нового языка

1. Добавьте код языка в массив `languages` в `_config.yml`
2. Создайте файл перевода `_data/i18n/[lang-code].yml`
3. Если требуется перевод блога, добавьте директорию `_data/blog/[lang-code]/`
4. Все остальное будет сгенерировано автоматически плагинами

### Избегание распространенных проблем

1. **Пустые директории не нужны**
   * Не создавайте пустые директории для языков (`/en/`, `/ru/` и т.д.) в исходном коде
   * Не создавайте пустые директории для страниц (`/about/`, `/product/` и т.д.)

2. **Избегайте дублирования файлов**
   * Не размещайте копии страниц в языковых каталогах - используйте систему локализации
   * Все страницы 404 генерируются из одного файла `404.md`

3. **При обновлении плагинов**
   * Тщательно тестируйте систему URL и перенаправлений
   * Убедитесь, что корректно обрабатываются многоязычные URLfor **scanlytic.co** built with Jekyll and ready for GitHub Pages.

## Local development

```bash
# macOS (with Homebrew)
brew install ruby chruby ruby-install  # if Ruby not installed

# Clone repo
git clone https://github.com/<your_username>/<repo>.git
cd <repo>

# Install dependencies
gem install bundler
bundle install

# Run locally
bundle exec jekyll serve
```

Site will be available at <http://localhost:4000>.

## Project Structure

### Key Files and Directories

* **Core Content Files**
  * `main_index.md` - Главная страница (перенаправляется на языковые версии)
  * `about.md`, `product.md`, `contact.md` - Основные страницы сайта в формате Markdown
  * `blog/index.html` - Шаблон для блога с интеграцией пагинации
  * `404.md` - Единая страница для обработки 404 ошибок, автоматически локализуется

* **Configuration**
  * `_config.yml` - Основная конфигурация Jekyll с настройками многоязычности
  * `.htaccess` - Правила Apache для перенаправлений и URL-обработки
  * `redirects.json` - Файл с правилами перенаправления для JavaScript

* **Локализация**
  * `_data/i18n/*.yml` - YAML файлы с переводами для каждого языка
  * `_data/blog/` - Локализованный контент для блога

* **Инфраструктура**
  * `_plugins/` - Плагины Jekyll для многоязычности и URL-обработки:
    * `language_generator.rb` - Создает языковые версии всех страниц
    * `error_pages_generator.rb` - Генерирует 404 страницы для каждого языка
    * `redirect_generator.rb` - Создает страницы перенаправления для URL без слешей
    * `htaccess_generator.rb` - Копирует .htaccess в выходную директорию
    * `redirects_json_handler.rb` - Обрабатывает JSON файл с перенаправлениями

### Принципы многоязычности

1. **Структура языков**
   * Все URL начинаются с кода языка (`/en/`, `/ru/`, `/de/`, `/fr/`, `/es/`)
   * Основной язык (по умолчанию) доступен и без префикса (например, `/about/` и `/en/about/`)

2. **Генерация страниц**
   * Исходные файлы содержатся в корне проекта без языкового префикса
   * Плагин `language_generator.rb` создает языковые версии на этапе сборки
   * Языковые директории в исходном коде НЕ нужны, так как они создаются автоматически

3. **Обработка 404 ошибок**
   * Единый файл `404.md` является источником для всех языковых версий страницы 404
   * Плагин `error_pages_generator.rb` создает языковые версии страницы 404
   * Система определяет язык пользователя и показывает соответствующую версию

## Deployment

Push to the `main` branch. GitHub Pages (built‑in GitHub Actions for `github-pages` gem) will build and publish automatically.
