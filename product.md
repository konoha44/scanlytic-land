---
layout: default
title: "Product"
permalink: /product/
alternate_urls:
  ru: "/ru/product/"
description: "Discover Scanlytic's advanced QR code analytics platform. Track scans, analyze user behavior, create dynamic QR codes, and optimize your marketing campaigns with real-time insights."
---

{% assign i18n = site.data.i18n[page.lang] %}
{% assign product_page = i18n.product_page %}

<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "WebPage",
  "name": "{{ product_page.seo_name }}",
  "description": "{{ product_page.seo_description }}",
  "inLanguage": "{{ page.lang }}",
  "isPartOf": {
    "@type": "WebSite",
    "name": "{{ site.title }}",
    "url": "{{ site.url }}"
  }
}
</script>

<div class="container mx-auto px-4 lg:px-8 py-12 animate-fadeIn">
  <!-- Hero section -->
  <div class="hero bg-gradient-to-b from-base-300/70 to-base-200 rounded-box mb-16 py-20">
    <div class="hero-content text-center">
      <div class="max-w-2xl">
        <h1 class="text-4xl font-bold mb-6">{{ product_page.hero_title }}</h1>
        <p class="text-lg opacity-80 mb-6">{{ product_page.hero_subtitle }}</p>
        <a href="https://forms.gle/MoJ3yz7AmMFo9Fq66" class="btn btn-accent btn-lg pulse-cta">{{ product_page.hero_cta }}</a>
      </div>
    </div>
  </div>

  <!-- Current features section -->
  <section class="mb-16">
    <h2 class="text-3xl font-bold text-center mb-8">{{ product_page.current_features_title }}</h2>
    <div class="grid gap-8 sm:grid-cols-2 lg:grid-cols-3">
      <div class="card glass shadow-lg hover:-translate-y-1 transition-transform duration-300">
        <figure class="px-6 pt-6">
          <img src="/img/create-step.jpg" alt="QR Code Generator" class="rounded-xl shadow-lg object-cover w-full h-48">
        </figure>
        <div class="card-body">
          <h3 class="card-title">{{ product_page.feature1_title }}</h3>
          <p>{{ product_page.feature1_text }}</p>
        </div>
      </div>
      <div class="card glass shadow-lg hover:-translate-y-1 transition-transform duration-300">
        <figure class="px-6 pt-6">
          <img src="/img/share-step.jpg" alt="Branded Links" class="rounded-xl shadow-lg object-cover w-full h-48">
        </figure>
        <div class="card-body">
          <h3 class="card-title">{{ product_page.feature2_title }}</h3>
          <p>{{ product_page.feature2_text }}</p>
        </div>
      </div>
      <div class="card glass shadow-lg hover:-translate-y-1 transition-transform duration-300">
        <figure class="px-6 pt-6">
          <img src="/img/improve-step.jpg" alt="Analytics Dashboard" class="rounded-xl shadow-lg object-cover w-full h-48">
        </figure>
        <div class="card-body">
          <h3 class="card-title">{{ product_page.feature3_title }}</h3>
          <p>{{ product_page.feature3_text }}</p>
        </div>
      </div>
    </div>
  </section>

  <!-- Coming soon features -->
  <section class="mb-16 bg-base-200/50 py-16 px-4 rounded-box">
    <h2 class="text-3xl font-bold text-center mb-8">{{ product_page.coming_soon_title }}</h2>
    <div class="grid gap-8 sm:grid-cols-2 lg:grid-cols-3">
      <div class="card glass shadow-lg hover:-translate-y-1 transition-transform duration-300">
        <figure class="px-6 pt-6">
          <div class="bg-gradient-to-br from-primary/20 to-secondary/20 rounded-xl h-48 flex items-center justify-center">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-24 w-24 opacity-60" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M4 4v5h.582m15.356 2A8.001 8.001 0 004.582 9m0 0H9m11 11v-5h-.581m0 0a8.003 8.003 0 01-15.357-2m15.357 2H15" />
            </svg>
          </div>
        </figure>
        <div class="card-body">
          <h3 class="card-title">{{ product_page.future_feature1_title }}</h3>
          <p>{{ product_page.future_feature1_text }}</p>
        </div>
      </div>
      <div class="card glass shadow-lg hover:-translate-y-1 transition-transform duration-300">
        <figure class="px-6 pt-6">
          <div class="bg-gradient-to-br from-secondary/20 to-accent/20 rounded-xl h-48 flex items-center justify-center">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-24 w-24 opacity-60" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M8 7h12m0 0l-4-4m4 4l-4 4m0 6H4m0 0l4 4m-4-4l4-4" />
            </svg>
          </div>
        </figure>
        <div class="card-body">
          <h3 class="card-title">{{ product_page.future_feature2_title }}</h3>
          <p>{{ product_page.future_feature2_text }}</p>
        </div>
      </div>
      <div class="card glass shadow-lg hover:-translate-y-1 transition-transform duration-300">
        <figure class="px-6 pt-6">
          <div class="bg-gradient-to-br from-accent/20 to-primary/20 rounded-xl h-48 flex items-center justify-center">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-24 w-24 opacity-60" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M9 17v-2m3 2v-4m3 4v-6m2 10H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z" />
            </svg>
          </div>
        </figure>
        <div class="card-body">
          <h3 class="card-title">{{ product_page.future_feature3_title }}</h3>
          <p>{{ product_page.future_feature3_text }}</p>
        </div>
      </div>
      <div class="card glass shadow-lg hover:-translate-y-1 transition-transform duration-300 sm:col-span-2 lg:col-span-1">
        <figure class="px-6 pt-6">
          <div class="bg-gradient-to-br from-primary/20 to-accent/20 rounded-xl h-48 flex items-center justify-center">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-24 w-24 opacity-60" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M9.75 17L9 20l-1 1h8l-1-1-.75-3M3 13h18M5 17h14a2 2 0 002-2V5a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z" />
            </svg>
          </div>
        </figure>
        <div class="card-body">
          <h3 class="card-title">{{ product_page.future_feature4_title }}</h3>
          <p>{{ product_page.future_feature4_text }}</p>
        </div>
      </div>
    </div>
  </section>

  <!-- CTA section -->
  <section class="py-20 text-center bg-gradient-to-b from-secondary/10 via-primary/5 to-base-100 rounded-box">
    <h2 class="text-3xl font-bold mb-6">{{ product_page.cta_title }}</h2>
    <p class="max-w-lg mx-auto mb-10">{{ product_page.cta_subtitle }}</p>
    <div class="text-center">
      <a href="https://forms.gle/MoJ3yz7AmMFo9Fq66" class="btn btn-accent btn-lg shadow-lg hover:shadow-xl transition-all pulse-cta">{{ product_page.cta_button }}</a>
    </div>
    <p class="mt-6 text-sm opacity-70">{{ product_page.cta_note }}</p>
  </section>
</div>

<script>
/* fade-in animation */
document.addEventListener('DOMContentLoaded', function() {
  const io = new IntersectionObserver(entries => entries.forEach(entry => {
    if (entry.isIntersecting) {
      entry.target.classList.add('animate-fadeIn');
      io.unobserve(entry.target);
    }
  }), {threshold: 0.2});
  
  document.querySelectorAll('.card, section h2').forEach(el => io.observe(el));
});
</script>
