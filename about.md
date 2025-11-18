---
layout: default
title: About Us
description: Learn more about Scanlytic - advanced QR code generator and analytics platform
permalink: /about/
sitemap: true
disable_seo: true
---

{% assign i18n = site.data.i18n[page.lang] %}
{% assign about = i18n.about %}

<div class="container mx-auto px-4 py-8">
  <div class="max-w-4xl mx-auto">
    <h1 class="text-3xl md:text-4xl font-bold mb-8 text-center">{{ about.title }}</h1>
    
    <div class="prose prose-lg max-w-none">
      <p class="text-xl mb-6">{{ about.intro }}</p>
      
      <h2 class="text-2xl font-semibold mb-4">{{ about.mission_title }}</h2>
      <p class="mb-6">{{ about.mission_text }}</p>
      
      <h2 class="text-2xl font-semibold mb-4">{{ about.features_title }}</h2>
      <ul class="list-disc list-inside mb-6">
        <li>{{ about.feature_1 }}</li>
        <li>{{ about.feature_2 }}</li>
        <li>{{ about.feature_3 }}</li>
        <li>{{ about.feature_4 }}</li>
      </ul>
      
      <h2 class="text-2xl font-semibold mb-4">{{ about.contact_title }}</h2>
      <p class="mb-6">{{ about.contact_text }}</p>
      
      <div class="text-center">
        <a href="{{ site.baseurl }}/{{ page.lang | default: site.default_lang }}/contact/" class="btn btn-primary">{{ about.contact_cta }}</a>
      </div>
    </div>
  </div>
</div>
