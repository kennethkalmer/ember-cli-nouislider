import { array, hash } from '@ember/helper';
import RangeSlider from 'ember-cli-nouislider/components/range-slider';

<template>
  <section>
    <h2>Options</h2>
    <p>
      A small tour of the most common configuration options. See the
      <a href="https://refreshless.com/nouislider/slider-options/">noUiSlider
        docs</a>
      for the full list.
    </p>

    <h3>Start &amp; range</h3>
    <RangeSlider @start={{40}} @range={{hash min=0 max=100}} />

    <h3>Two handles + connect</h3>
    <RangeSlider
      @start={{array 20 80}}
      @range={{hash min=0 max=100}}
      @connect={{true}}
    />

    <h3>Step</h3>
    <RangeSlider @start={{30}} @range={{hash min=0 max=100}} @step={{10}} />

    <h3>Vertical orientation</h3>
    <div class="vertical-slider">
      <RangeSlider
        @start={{40}}
        @range={{hash min=0 max=100}}
        @orientation="vertical"
      />
    </div>

    <h3>Tooltips</h3>
    <RangeSlider
      @start={{50}}
      @range={{hash min=0 max=100}}
      @tooltips={{true}}
    />

    <h3>Disabled</h3>
    <RangeSlider
      @start={{40}}
      @range={{hash min=0 max=100}}
      @disabled={{true}}
    />
  </section>
</template>
