/*  qr.js – QR code SVG generator + badge  */

document.addEventListener('DOMContentLoaded', function() {
  // Get correct elements by their IDs from HTML
  const input = document.getElementById("qrContent");
  const make = document.getElementById("genBtn");
  const dl = document.getElementById("dlBtn");
  const prev = document.getElementById("qrPreview");
  
  // Get customization options
  const colorPicker = document.getElementById("qrColor");
  const bgColorPicker = document.getElementById("qrBgColor");
  const errorLevelSelect = document.getElementById("qrErrorLevel");
  const paddingRange = document.getElementById("qrPadding");

  // Load QR code library dynamically
  const script = document.createElement('script');
  script.src = "https://cdn.jsdelivr.net/npm/qrcode-svg@1.1.0/lib/qrcode.min.js";
  document.head.appendChild(script);
  
  script.onload = function() {
    // Initialize the generator once the library is loaded
    if (make) {
      make.addEventListener("click", generateQR);
      
      // Enable live preview on option changes
      if (colorPicker) colorPicker.addEventListener("input", debounce(generateQR, 300));
      if (bgColorPicker) bgColorPicker.addEventListener("input", debounce(generateQR, 300));
      if (errorLevelSelect) errorLevelSelect.addEventListener("change", generateQR);
      if (paddingRange) paddingRange.addEventListener("input", debounce(generateQR, 300));
    }
  };

  // Simple debounce function to avoid excessive QR generation
  function debounce(func, wait) {
    let timeout;
    return function() {
      const context = this, args = arguments;
      clearTimeout(timeout);
      timeout = setTimeout(() => func.apply(context, args), wait);
    };
  }

  function decorate(svg) {
    /* Add clickable badge */
    const badge = `
      <a xlink:href="https://scanlytic.co?ref=qrgen"
         target="_blank" rel="noopener">
        <text x="50%" y="98%" font-size="6"
              text-anchor="middle" fill="#7c3aed"
              font-family="Inter,Arial,sans-serif">
          Powered by Scanlytic
        </text>
      </a>`;
    return svg.replace("</svg>", `${badge}</svg>`);
  }

  function generateQR() {
    const url = input.value.trim();
    if (!url) { 
      // Don't show alert, just keep the preview placeholder
      return; 
    }

    /* Get customization options */
    const color = colorPicker ? colorPicker.value : "#000000";
    const bgColor = bgColorPicker ? bgColorPicker.value : "#FFFFFF";
    const ecl = errorLevelSelect ? errorLevelSelect.value : "M";
    const padding = paddingRange ? parseInt(paddingRange.value) : 4;

    /* Generate SVG */
    if (typeof QRCode !== 'undefined') {
      const qr = new QRCode({
        content: url,
        padding: padding,
        color: color,
        background: bgColor,
        ecl: ecl,
        width: 256,
        height: 256
      }).svg();

      const fullSVG = decorate(qr);
      prev.innerHTML = fullSVG;            // Show preview
      dl.href = URL.createObjectURL(new Blob([fullSVG], {type:"image/svg+xml"}));
      dl.classList.remove("pointer-events-none","opacity-50");
      
      // Enable copy button if it exists
      const copyQrBtn = document.getElementById("copyQrBtn");
      if (copyQrBtn) {
        copyQrBtn.classList.remove("pointer-events-none", "opacity-50");
      }
      
      // Add animation effect to the preview
      const qrPreview = document.getElementById('qrPreview');
      if (qrPreview) {
        qrPreview.classList.add('fade-in');
        setTimeout(() => qrPreview.classList.remove('fade-in'), 500);
      }
    } else {
      prev.innerHTML = '<div class="alert alert-error shadow-lg"><div><svg xmlns="http://www.w3.org/2000/svg" class="stroke-current flex-shrink-0 h-6 w-6" fill="none" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 14l2-2m0 0l2-2m-2 2l-2-2m2 2l2 2m7-2a9 9 0 11-18 0 9 9 0 0118 0z" /></svg><span>Error loading QR library. Please try refreshing the page.</span></div></div>';
    }
  }
  
  // Add a listener for Enter key press
  if (input) {
    input.addEventListener("keypress", function(event) {
      if (event.key === "Enter") {
        event.preventDefault();
        if (make) make.click();
      }
    });
  }
});

/*
  Client-side translator script
  - Fetches translations based on current language.
  - Translates elements with data-translate attribute.
  - Handles dynamic content updates.
*/

(function() {
  let currentTranslations = {};
  let currentLang = '';

  // Function to get translations from window.siteTranslations
  function getTranslations(lang) {
    if (window.siteTranslations && window.siteTranslations[lang]) {
      return window.siteTranslations[lang];
    } else {
      console.error(`Translations not found for ${lang} in window.siteTranslations.`);
      if (lang !== window.siteConfigLang && window.siteTranslations && window.siteTranslations[window.siteConfigLang]) {
        console.warn(`Falling back to default language: ${window.siteConfigLang}`);
        return window.siteTranslations[window.siteConfigLang];
      }
      return {};
    }
  }

  // Function to get a nested value from an object using a string path
  function getNestedValue(obj, path) {
    return path.split('.').reduce((acc, part) => acc && acc[part], obj);
  }

  // Function to translate all elements with data-translate attribute
  function translatePage() {
    document.querySelectorAll('[data-translate]').forEach(element => {
      const key = element.getAttribute('data-translate');
      const translation = getNestedValue(currentTranslations, key);
      if (translation) {
        // Preserve existing child elements if the element has data-translate-preserve
        if (element.hasAttribute('data-translate-preserve')) {
          let firstChild = element.firstChild;
          while(firstChild && firstChild.nodeType !== Node.TEXT_NODE) {
            firstChild = firstChild.nextSibling;
          }
          if (firstChild && firstChild.nodeType === Node.TEXT_NODE) {
            firstChild.nodeValue = translation + (element.dataset.translateSuffix || '');
          }
        } else {
          element.textContent = translation + (element.dataset.translateSuffix || '');
        }
      } else {
        // console.warn(`Translation not found for key: ${key}`);
      }
    });
  }

  // Function to update language-specific UI elements (switcher display, active classes)
  function updateLangUI(lang) {
    const langDisplayElement = document.getElementById('current-lang-display');
    if (langDisplayElement) {
      langDisplayElement.textContent = lang.toUpperCase();
    }

    const langLinks = {
      en: document.getElementById('lang-switcher-en'),
      ru: document.getElementById('lang-switcher-ru')
      // Add other languages if configured
    };

    for (const langCode in langLinks) {
      if (langLinks[langCode]) {
        if (langCode === lang) {
          langLinks[langCode].classList.add('active');
        } else {
          langLinks[langCode].classList.remove('active');
        }
      }
    }
  }

  // Function to initialize and handle language changes
  function initTranslator(lang) { // Made synchronous
    if (!lang || lang === currentLang) return;
    currentLang = lang;
    currentTranslations = getTranslations(lang);
    translatePage();
    updateLangUI(lang); // Update UI elements related to language
  }

  // Listen for the custom event dispatched by i18n-handler.html
  document.addEventListener('languageChanged', function(event) {
    initTranslator(event.detail.lang);
  });

  // Initial translation based on language set by i18n-handler.html
  if (window.currentLanguage) {
    initTranslator(window.currentLanguage);
  } else {
    document.addEventListener('DOMContentLoaded', () => {
      initTranslator(window.currentLanguage || window.siteConfigLang);
    });
  }

  // Expose a function to re-translate dynamic content if needed
  window.translateDynamicContent = translatePage;

})();