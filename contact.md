---
layout: default
title: "Contact"
permalink: /contact/
alternate_urls:
  ru: "/ru/contact/"
description: "Get in touch with Scanlytic team. Contact us for questions about QR code analytics, enterprise solutions, partnerships, or technical support."
---

{% assign i18n = site.data.i18n[page.lang] %}
{% assign contact_i18n = i18n.contact %}
{% assign waitlist_i18n = i18n.waitlist %}

<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "ContactPage",
  "name": "{{ contact_i18n.seo_name }}",
  "description": "{{ contact_i18n.seo_description }}",
  "inLanguage": "{{ page.lang }}",
  "isPartOf": {
    "@type": "WebSite",
    "name": "{{ site.title }}",
    "url": "{{ site.url }}"
  }
}
</script>

<div class="container mx-auto px-4 lg:px-8 py-8 sm:py-12 md:py-16">
  <!-- Hero section with gradient background -->
  <div class="hero bg-gradient-to-r from-primary/10 to-secondary/10 rounded-box mb-8 sm:mb-12 py-10 sm:py-16">
    <div class="hero-content text-center">
      <div class="max-w-2xl">
        <h1 class="text-3xl sm:text-4xl md:text-5xl font-bold mb-4 sm:mb-6">{{ waitlist_i18n.title }}</h1>
        <p class="text-base sm:text-lg opacity-80 mb-6 sm:mb-8">{{ waitlist_i18n.subtitle }}</p>
        <a href="https://forms.gle/MoJ3yz7AmMFo9Fq66" class="btn btn-accent btn-lg pulse-cta">{{ waitlist_i18n.cta_button }}</a>
      </div>
    </div>
  </div>

  <!-- Key benefits -->
  <div class="grid gap-6 md:grid-cols-2 lg:grid-cols-3 mb-10 sm:mb-16">
    <div class="card bg-base-200/50 hover:shadow-lg transition-all">
      <div class="card-body text-center p-6">
        <div class="flex justify-center mb-4">
          <div class="bg-primary/10 p-4 rounded-full">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-8 w-8 text-primary" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 15v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2zm10-10V7a4 4 0 00-8 0v4h8z" />
            </svg>
          </div>
        </div>
        <h2 class="text-xl font-bold mb-2">{{ waitlist_i18n.key_benefits.benefit1_title }}</h2>
        <p>{{ waitlist_i18n.key_benefits.benefit1_text }}</p>
      </div>
    </div>
    
    <div class="card bg-base-200/50 hover:shadow-lg transition-all">
      <div class="card-body text-center p-6">
        <div class="flex justify-center mb-4">
          <div class="bg-primary/10 p-4 rounded-full">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-8 w-8 text-primary" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8c-1.657 0-3 .895-3 2s1.343 2 3 2 3 .895 3 2-1.343 2-3 2m0-8c1.11 0 2.08.402 2.599 1M12 8V7m0 1v8m0 0v1m0-1c-1.11 0-2.08-.402-2.599-1M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
            </svg>
          </div>
        </div>
        <h2 class="text-xl font-bold mb-2">{{ waitlist_i18n.key_benefits.benefit2_title }}</h2>
        <p>{{ waitlist_i18n.key_benefits.benefit2_text }}</p>
      </div>
    </div>
    
    <div class="card bg-base-200/50 hover:shadow-lg transition-all md:col-span-2 lg:col-span-1">
      <div class="card-body text-center p-6">
        <div class="flex justify-center mb-4">
          <div class="bg-primary/10 p-4 rounded-full">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-8 w-8 text-primary" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5.882V19.24a1.76 1.76 0 01-3.417.592l-2.147-6.15M18 13a3 3 0 100-6M5.436 13.683A4.001 4.001 0 017 6h1.832c4.1 0 7.625-1.234 9.168-3v14c-1.543-1.766-5.067-3-9.168-3H7a3.988 3.988 0 01-1.564-.317z" />
            </svg>
          </div>
        </div>
        <h2 class="text-xl font-bold mb-2">{{ waitlist_i18n.key_benefits.benefit3_title }}</h2>
        <p>{{ waitlist_i18n.key_benefits.benefit3_text }}</p>
      </div>
    </div>
  </div>
  
  <!-- CTA section -->
  <div class="card glass shadow-xl bg-gradient-to-r from-primary/5 to-secondary/5 mb-10 sm:mb-16">
    <div class="card-body text-center py-8 sm:py-12">
      <h2 class="text-2xl sm:text-3xl font-bold mb-4 sm:mb-6">{{ waitlist_i18n.cta_section_title }}</h2>
      <p class="text-base sm:text-lg mb-6 sm:mb-8">{{ waitlist_i18n.cta_section_subtitle }}</p>
      <div class="flex justify-center">
        <a href="https://forms.gle/MoJ3yz7AmMFo9Fq66" class="btn btn-accent btn-lg pulse-cta">{{ waitlist_i18n.cta_section_button }}</a>
      </div>
      <p class="mt-4 sm:mt-6 opacity-70">{{ waitlist_i18n.cta_section_note }}</p>
    </div>
  </div>
  
  <!-- FAQ -->
  <div class="mb-8 sm:mb-12">
    <h2 class="text-2xl font-bold text-center mb-6 sm:mb-8">{{ waitlist_i18n.faq_title }}</h2>
    <div class="grid gap-4">
      <div class="collapse collapse-plus bg-base-200/50">
        <input type="radio" name="faq-accordion" checked="checked" /> 
        <div class="collapse-title font-medium">
          {{ waitlist_i18n.faq1_question }}
        </div>
        <div class="collapse-content"> 
          <p>{{ waitlist_i18n.faq1_answer }}</p>
        </div>
      </div>
      <div class="collapse collapse-plus bg-base-200/50">
        <input type="radio" name="faq-accordion" /> 
        <div class="collapse-title font-medium">
          {{ waitlist_i18n.faq2_question }}
        </div>
        <div class="collapse-content"> 
          <p>{{ waitlist_i18n.faq2_answer }}</p>
        </div>
      </div>
      <div class="collapse collapse-plus bg-base-200/50">
        <input type="radio" name="faq-accordion" /> 
        <div class="collapse-title font-medium">
          {{ waitlist_i18n.faq3_question }}
        </div>
        <div class="collapse-content"> 
          <p>{{ waitlist_i18n.faq3_answer }}</p>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- Анимации для кнопок с призывом к действию -->
<style>
@keyframes pulse-animation {
  0% {
    box-shadow: 0 0 0 0px rgba(79, 70, 229, 0.2);
  }
  100% {
    box-shadow: 0 0 0 16px rgba(79, 70, 229, 0);
  }
}

.pulse-cta {
  animation: pulse-animation 2s infinite;
}

@media (max-width: 640px) {
  .pulse-cta {
    animation: none; /* Отключаем анимацию на мобильных для экономии ресурсов */
  }
}
</style>
