document.addEventListener('DOMContentLoaded', function () {
    // Extract language from URL or use default
    function detectLanguage() {
        const pathMatch = window.location.pathname.match(/^\/(en|ru)\//);
        return pathMatch ? pathMatch[1] : (window.siteConfigLang || 'en');
    }

    function getNestedTranslation(lang, key) {
        if (!window.siteTranslations || !window.siteTranslations[lang]) {
            console.warn(`Translations for language '${lang}' not found.`);
            return null;
        }
        
        const keys = key.split('.');
        let current = window.siteTranslations[lang];
        
        for (const k of keys) {
            if (current && typeof current === 'object' && k in current) {
                current = current[k];
            } else {
                return null; // Key path not found
            }
        }
        
        return typeof current === 'string' ? current : null;
    }

    function translatePage(language) {
        if (!language) {
            console.error('Language not provided for translation.');
            return;
        }

        // Store current language globally for reference
        window.currentLanguage = language;
        
        document.querySelectorAll('[data-translate]').forEach(function (element) {
            const key = element.getAttribute('data-translate');
            const translation = getNestedTranslation(language, key);

            if (translation !== null) {
                const targetAttribute = element.getAttribute('data-translate-target-attr');

                if (targetAttribute) {
                    element.setAttribute(targetAttribute, translation);
                } else if ((element.tagName === 'INPUT' || element.tagName === 'TEXTAREA') && 
                           element.type !== 'submit' && element.type !== 'button' && 
                           element.hasAttribute('placeholder')) {
                    element.placeholder = translation;
                } else if (element.tagName === 'INPUT' && (element.type === 'submit' || element.type === 'button')) {
                    element.value = translation; // For submit/button input values
                } else {
                    element.innerHTML = translation; // Default: update content using innerHTML
                }
            }
        });

        // Update html lang attribute
        document.documentElement.lang = language;

        // Update language display in switcher if it exists
        const langDisplay = document.getElementById('current-lang-display');
        if (langDisplay) {
            langDisplay.textContent = language.toUpperCase();
        }
    }

    // Initialize translation
    const currentLanguage = detectLanguage();
    translatePage(currentLanguage);
    
    // Listen for language change events triggered by our language switcher
    window.addEventListener('languageChanged', function(event) {
        if (event.detail && event.detail.lang) {
            translatePage(event.detail.lang);
        }
    });
});