# Scanlytic – Jekyll Source

This repository contains the static site for **scanlytic.co** built with Jekyll and ready for GitHub Pages.

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

## Structure

* **index.html** & **qr-generator.html** – landing pages (keep HTML as‑is).  
* **/about**, **/product**, **/contact** – Markdown pages.  
* **/blog** + `_posts/` – Markdown posts.  
* **CNAME** – custom domain for GitHub Pages.  
* **analytics** code lives in `_includes/analytics.html`.  
* **_data/texts.yml** – add translations here and reference with Liquid to localise later.

## Deployment

Push to the `main` branch. GitHub Pages (built‑in GitHub Actions for `github-pages` gem) will build and publish automatically.
