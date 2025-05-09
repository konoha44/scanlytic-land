---
layout: default
permalink: /
alternate_urls:
  en: "/en/"
  ru: "/ru/"
---

{% assign i18n = site.data.i18n[page.lang] %}
{% assign home = i18n.home %}

<!-- progress bar -->
<div id="progressBar"></div>

<!-- desktop ribbon -->
<div id="desktopRibbon" class="hidden md:flex items-center justify-center gap-3 sticky top-10 z-[1020] bg-base-100/70 backdrop-blur border-b border-base-200 px-4 py-2 transition-all duration-300">
  <span class="font-medium tracking-wide">{{ home.ribbon_text }}</span>
  <a href="https://forms.gle/MoJ3yz7AmMFo9Fq66" id="cta-ribbon" class="btn btn-accent btn-sm pulse-cta">{{ home.ribbon_cta }}</a>
  <label class="swap swap-rotate ml-auto cursor-pointer" aria-label="Toggle dark mode">
    <input type="checkbox" id="themeToggle">
    <svg class="swap-on w-5 h-5 fill-current" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M5.64 17.657A9 9 0 1118 6.343 7 7 0 005.64 17.657z"/></svg>
    <svg class="swap-off w-5 h-5 fill-current" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M12 2a1 1 0 011 1v1.055a9.001 9.001 0 010 17.89V21a1 1 0 01-2 0v-1.055a9.001 9.001 0 010-17.89V3a1 1 0 011-1z"/></svg>
  </label>
</div>

<!-- HERO -->
<header class="hero min-h-[80vh] md:min-h-[90vh]" style="background-image:url('/img/hero-bg.jpg'); background-position: center; background-size: cover;">
  <div class="hero-overlay bg-gradient-to-b from-primary-dark/70 via-secondary/60 to-base-100/80"></div>
  <div class="hero-content text-center text-neutral-content max-w-2xl px-4 py-12 animate-fadeIn">
    <div>
      <h1 class="mb-6 text-3xl sm:text-4xl lg:text-6xl leading-tight font-bold">{{ home.hero_title_main }}</h1>
      <p class="mb-10 opacity-90 text-base sm:text-lg">{{ home.hero_subtitle_main }}</p>
      <a href="https://forms.gle/MoJ3yz7AmMFo9Fq66" id="cta-hero" class="btn btn-accent btn-md md:btn-lg shadow-xl hover:shadow-2xl transition-transform duration-300 pulse-cta">{{ home.hero_cta_main }}</a>
    </div>
  </div>
</header>

<!-- mobile sticky CTA -->
<div class="md:hidden fixed bottom-4 inset-x-0 flex justify-center z-[1010]">
  <a href="https://forms.gle/MoJ3yz7AmMFo9Fq66" id="cta-mobile" class="btn btn-accent btn-lg w-11/12 max-w-sm pulse-cta shadow-lg">{{ home.hero_cta_main }}</a>
</div>

<main class="container mx-auto px-4 lg:px-8">
  <!-- value -->
  <section id="value" class="py-12 md:py-20">
    <h2 class="text-2xl md:text-3xl font-bold text-center">{{ home.value_prop_title }}</h2>
    <p class="max-w-xl mx-auto mt-4 mb-8 md:mb-12 text-center text-sm md:text-base">{{ home.value_prop_subtitle }}</p>

    <div class="grid gap-4 md:gap-8 sm:grid-cols-2 lg:grid-cols-3">
      <article class="card glass shadow-lg hover:-translate-y-1 transition-transform duration-300">
        <div class="card-body p-4 md:p-8"><h3 class="card-title text-lg md:text-xl">{{ home.pain_title }}</h3><p class="text-sm md:text-base">{{ home.pain_text }}</p></div>
      </article>
      <article class="card glass shadow-lg hover:-translate-y-1 transition-transform duration-300">
        <div class="card-body p-4 md:p-8"><h3 class="card-title text-lg md:text-xl">{{ home.gain_title }}</h3><p class="text-sm md:text-base">{{ home.gain_text }}</p></div>
      </article>
      <article class="card glass shadow-lg hover:-translate-y-1 transition-transform duration-300 sm:col-span-2 lg:col-span-1">
        <div class="card-body p-4 md:p-8"><h3 class="card-title text-lg md:text-xl">{{ home.hook_title }}</h3><p class="text-sm md:text-base">{{ home.hook_text }}</p></div>
      </article>
    </div>
  </section>

  <!-- features -->
  <section id="features" class="py-12 md:py-20">
    <h2 class="text-2xl md:text-3xl font-bold text-center">{{ home.features_title_main }}</h2>
    <p class="max-w-xl mx-auto mt-4 mb-8 md:mb-12 text-center text-sm md:text-base">{{ home.features_subtitle_main }}</p>

    <div class="grid gap-4 md:gap-8 sm:grid-cols-2 lg:grid-cols-3">
      <article class="card glass shadow-md hover:shadow-xl transition-shadow"><div class="card-body p-4 md:p-6"><h3 class="card-title text-lg md:text-xl">{{ home.feature1_title }}</h3><p class="text-sm md:text-base">{{ home.feature1_text }}</p></div></article>
      <article class="card glass shadow-md hover:shadow-xl transition-shadow"><div class="card-body p-4 md:p-6"><h3 class="card-title text-lg md:text-xl">{{ home.feature2_title }}</h3><p class="text-sm md:text-base">{{ home.feature2_text }}</p></div></article>
      <article class="card glass shadow-md hover:shadow-xl transition-shadow"><div class="card-body p-4 md:p-6"><h3 class="card-title text-lg md:text-xl">{{ home.feature3_title }}</h3><p class="text-sm md:text-base">{{ home.feature3_text }}</p></div></article>
      <article class="card glass shadow-md hover:shadow-xl transition-shadow"><div class="card-body p-4 md:p-6"><h3 class="card-title text-lg md:text-xl">{{ home.feature4_title }}</h3><p class="text-sm md:text-base">{{ home.feature4_text }}</p></div></article>
      <article class="card glass shadow-md hover:shadow-xl transition-shadow"><div class="card-body p-4 md:p-6"><h3 class="card-title text-lg md:text-xl">{{ home.feature5_title }}</h3><p class="text-sm md:text-base">{{ home.feature5_text }}</p></div></article>
      <article class="card glass shadow-md hover:shadow-xl transition-shadow"><div class="card-body p-4 md:p-6"><h3 class="card-title text-lg md:text-xl">{{ home.feature6_title }}</h3><p class="text-sm md:text-base">{{ home.feature6_text }}</p></div></article>
    </div>
  </section>

  <!-- free QR generator (beta) -->
  <section id="qr-generator" class="py-12 md:py-20 bg-base-200/50 rounded-box">
    <h2 class="text-2xl md:text-3xl font-bold text-center">{{ home.qr_generator_title_main }}</h2>
    <p class="max-w-xl mx-auto mt-4 mb-8 md:mb-10 text-center text-sm md:text-base">
      {{ home.qr_generator_subtitle_main }}
    </p>
    <div class="text-center">
      <a href="{{ site.baseurl }}/{{ page.lang | default: site.default_lang }}/qr-generator/" class="btn btn-accent btn-md md:btn-lg pulse-cta mx-auto">{{ home.qr_generator_cta_main }}</a>
    </div>
    <p class="text-xs text-center mt-4 opacity-70">{{ home.qr_generator_note_main }}</p>
  </section>

  <!-- how -->
  <section id="how" class="py-12 md:py-20">
    <h2 class="text-2xl md:text-3xl font-bold text-center">{{ home.how_it_works_title }}</h2>
    <div class="grid gap-4 md:gap-8 sm:grid-cols-2 lg:grid-cols-3 mt-8 md:mt-12">
      <article class="card glass shadow-lg hover:-translate-y-1 transition-transform duration-300">
        <figure class="px-4 md:px-6 pt-4 md:pt-6">
          <img src="{{ site.baseurl }}/img/create-step.jpg" alt="Stylized QR code illustration" loading="lazy" class="rounded-xl shadow-lg">
        </figure>
        <div class="card-body p-4 md:p-6">
          <h3 class="card-title text-lg md:text-xl">{{ home.step1_title }}</h3>
          <p class="text-sm md:text-base">{{ home.step1_text }}</p>
        </div>
      </article>
      <article class="card glass shadow-lg hover:-translate-y-1 transition-transform duration-300">
        <figure class="px-4 md:px-6 pt-4 md:pt-6">
          <img src="{{ site.baseurl }}/img/share-step.jpg" alt="Person scanning and sharing a QR code" loading="lazy" class="rounded-xl shadow-lg object-cover w-full h-auto aspect-[4/3]">
        </figure>
        <div class="card-body p-4 md:p-6">
          <h3 class="card-title text-lg md:text-xl">{{ home.step2_title }}</h3>
          <p class="text-sm md:text-base">{{ home.step2_text }}</p>
        </div>
      </article>
      <article class="card glass shadow-lg hover:-translate-y-1 transition-transform duration-300 sm:col-span-2 lg:col-span-1">
        <figure class="px-4 md:px-6 pt-4 md:pt-6">
          <img src="{{ site.baseurl }}/img/improve-step.jpg" alt="Dashboard showing QR analytics and ROI" loading="lazy" class="rounded-xl shadow-lg object-cover w-full h-auto aspect-[4/3]">
        </figure>
        <div class="card-body p-4 md:p-6">
          <h3 class="card-title text-lg md:text-xl">{{ home.step3_title }}</h3>
          <p class="text-sm md:text-base">{{ home.step3_text }}</p>
        </div>
      </article>
    </div>
  </section>

  <!-- waitlist -->
  <section id="waitlist" class="py-12 md:py-24 text-center bg-gradient-to-b from-secondary/10 to-base-100 rounded-box">
    <h2 class="text-3xl md:text-4xl font-bold mb-4">{{ home.waitlist_title_bottom }}</h2>
    <p class="max-w-lg mx-auto mb-8 px-4 text-sm md:text-base">{{ home.waitlist_subtitle_bottom }}</p>
    <div class="text-center">
      <a href="https://forms.gle/MoJ3yz7AmMFo9Fq66" id="cta-waitlist" class="btn btn-accent btn-md md:btn-lg pulse-cta">{{ home.waitlist_cta_bottom }}</a>
    </div>
  </section>

  <!-- FAQ -->
  <section id="faq" class="py-12 md:py-20 flex flex-col items-center">
    <h2 class="text-2xl md:text-3xl font-bold text-center mb-6 md:mb-8">{{ home.faq_title_main }}</h2>
    <div class="join join-vertical w-full max-w-3xl">
      <div class="collapse collapse-plus join-item bg-base-200/60 backdrop-blur border border-base-300">
        <input type="checkbox" class="peer" checked>
        <div class="collapse-title text-base md:text-lg font-medium">{{ home.faq1_question_main }}</div>
        <div class="collapse-content text-sm md:text-base peer-checked:max-h-screen"><p>{{ home.faq1_answer_main }}</p></div>
      </div>
      <div class="collapse collapse-plus join-item bg-base-200/60 backdrop-blur border border-base-300">
        <input type="checkbox" class="peer">
        <div class="collapse-title text-base md:text-lg font-medium">{{ home.faq2_question_main }}</div>
        <div class="collapse-content text-sm md:text-base peer-checked:max-h-screen"><p>{{ home.faq2_answer_main }}</p></div>
      </div>
      <div class="collapse collapse-plus join-item bg-base-200/60 backdrop-blur border border-base-300">
        <input type="checkbox" class="peer">
        <div class="collapse-title text-base md:text-lg font-medium">{{ home.faq3_question_main }}</div>
        <div class="collapse-content text-sm md:text-base peer-checked:max-h-screen"><p>{{ home.faq3_answer_main }}</p></div>
      </div>
      <div class="collapse collapse-plus join-item bg-base-200/60 backdrop-blur border border-base-300">
        <input type="checkbox" class="peer">
        <div class="collapse-title text-base md:text-lg font-medium">{{ home.faq4_question_main }}</div>
        <div class="collapse-content text-sm md:text-base peer-checked:max-h-screen"><p>{{ home.faq4_answer_main }}</p></div>
      </div>
    </div>
  </section>
</main>

<!-- scroll-top button -->
<button id="scrollTopBtn" aria-label="Back to top" class="btn btn-circle btn-accent fixed bottom-24 right-4 hidden md:flex opacity-0 pointer-events-none transition-opacity duration-300">
  <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 15l7-7 7 7"/></svg>
</button>

<!-- JS -->
<script defer>
  /* progress */
  const progress=document.getElementById('progressBar');
  addEventListener('scroll',()=>{progress.style.width=`${100*scrollY/(document.body.scrollHeight-innerHeight)}%`;});

  /* fade-in */
  const io=new IntersectionObserver(es=>es.forEach(e=>{if(e.isIntersecting){e.target.classList.add('animate-fadeIn');io.unobserve(e.target);}}),{threshold:.2});
  document.querySelectorAll('.card,section h2').forEach(el=>io.observe(el));

  /* scroll-top btn */
  const topBtn=document.getElementById('scrollTopBtn');
  addEventListener('scroll',()=>{if(scrollY>600){topBtn.classList.remove('opacity-0','pointer-events-none');}else{topBtn.classList.add('opacity-0','pointer-events-none');}});
  topBtn.addEventListener('click',()=>scrollTo({top:0,behavior:'smooth'}));

  /* theme toggle */
  const toggle=document.getElementById('themeToggle'), stored=localStorage.getItem('theme');
  if(stored){document.documentElement.setAttribute('data-theme',stored);toggle.checked=stored==='night';}
  toggle.addEventListener('change',()=>{const t=toggle.checked?'night':'business';document.documentElement.setAttribute('data-theme',t);localStorage.setItem('theme',t);});
</script>

<style>
  /* Custom palette / анимации */
  :root{
    /* фиолетово-индиговая гамма + золотой акцент */
    --primary:#7c3aed;           /* violet-600  */
    --primary-dark:#4c1d95;      /* violet-900  */
    --secondary:#6366f1;         /* indigo-500  */
    --accent:#fbbf24;            /* amber-400   */
  }

  /* Center all content */
  .container, main {
    max-width: 1200px;
    margin-left: auto;
    margin-right: auto;
  }
  
  /* Aspect ratios for images */
  .aspect-[4\/3] {
    aspect-ratio: 4/3;
    object-fit: cover;
  }
  
  /* Language dropdown spacer for ribbon */
  .ribbon-spacer {
    height: 40px; /* Уменьшил с 48px до 40px */
    width: 100%;
  }
  .lang-dropdown {
    margin-top: 45px; /* Уменьшил с 55px до 45px */
    padding: 0.5rem !important; /* Уменьшенные внутренние отступы */
  }
  .lang-dropdown a {
    padding: 0.5rem !important; /* Меньшие отступы для ссылок */
  }

  /* На главной странице фиксированное позиционирование для языкового меню */
  .home-page .dropdown-content.lang-dropdown {
    position: absolute;
    top: 36px; /* Уменьшил с 40px до 36px */
  }
  
  /* Keyframes */
  @keyframes fadeIn{from{opacity:0;transform:translateY(24px)}to{opacity:1;transform:none}}
  .animate-fadeIn{animation:fadeIn .65s cubic-bezier(.25,.8,.25,1) forwards}

  @keyframes pulseRing{
    0%{box-shadow:0 0 0 0 rgba(251,191,36,.55)}
    70%{box-shadow:0 0 0 24px rgba(251,191,36,0)}
    100%{box-shadow:0 0 0 0 rgba(251,191,36,0)}
  }
  .pulse-cta{animation:pulseRing 2.8s infinite}

  /* Scroll progress line */
  #progressBar{position:fixed;top:0;left:0;height:4px;width:0;background:var(--accent);z-index:1030}
  
  /* Media queries for orientation handling */
  @media screen and (orientation: landscape) and (max-width: 1024px) {
    .hero {
      min-height: 100vh; /* Full height for landscape on mobile */
    }
    
    .hero-content {
      padding-top: 2rem;
      padding-bottom: 2rem;
    }
    
    section {
      padding-top: 1.5rem;
      padding-bottom: 1.5rem;
    }
  }
  
  /* Additional responsive adjustments */
  @media (max-width: 480px) {
    .card-body {
      padding: 1rem;
    }
    
    figure {
      padding: 0.75rem 0.75rem 0 0.75rem;
    }
  }
</style>

