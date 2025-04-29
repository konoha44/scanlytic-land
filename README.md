# Scanlytic Landing

Static landing page for **Scanlytic** (dynamic QR codes + branded links).

## Local preview
```bash
npx serve .
# or
python3 -m http.server 3000
```

## Deploy
Push to `main` branch — GitHub Pages (via workflow) will publish automatically.

### Structure
```
.
├─ index.html
├─ robots.txt
├─ sitemap.xml
├─ .nojekyll
└─ .github/workflows/pages.yml
```
Edit `robots.txt` and `sitemap.xml` replacing `<USERNAME>` with your GitHub username (or custom domain).