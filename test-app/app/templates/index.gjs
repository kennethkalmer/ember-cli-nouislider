import HeroDemo from 'test-app/components/hero-demo';
import SourceCode from 'test-app/components/source-code';

const heroCode = `<RangeSlider
  @start={{this.value}}
  @range={{hash min=0 max=100}}
  @connect="lower"
  @onChange={{this.handleChange}}
/>`;

<template>
  <section class="hero">
    <div class="hero-inner">
      <h1 class="hero-title">&lt;range-slider&gt;</h1>
      <p class="hero-subtitle">noUiSlider Range Slider Component for Ember.js</p>

      <div class="hero-slider">
        <HeroDemo />
      </div>

      <div class="hero-code">
        <SourceCode @lang="handlebars" @code={{heroCode}} />
      </div>
    </div>
  </section>
</template>
