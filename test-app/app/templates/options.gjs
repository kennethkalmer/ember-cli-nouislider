import { array, hash } from '@ember/helper';
import RangeSlider from 'ember-cli-nouislider/components/range-slider';
import Example from 'test-app/components/example';

const startRangeCode = `<RangeSlider @start={{40}} @range={{hash min=0 max=100}} />`;

const twoHandleCode = `<RangeSlider
  @start={{array 20 80}}
  @range={{hash min=0 max=100}}
  @connect={{true}}
/>`;

const stepCode = `<RangeSlider
  @start={{30}}
  @range={{hash min=0 max=100}}
  @step={{10}}
/>`;

const verticalCode = `<RangeSlider
  class="vertical-slider"
  @start={{40}}
  @range={{hash min=0 max=100}}
  @orientation="vertical"
/>`;

const tooltipsCode = `<RangeSlider
  @start={{50}}
  @range={{hash min=0 max=100}}
  @tooltips={{true}}
/>`;

const disabledCode = `<RangeSlider
  @start={{40}}
  @range={{hash min=0 max=100}}
  @disabled={{true}}
/>`;

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
    <Example @code={{startRangeCode}}>
      <RangeSlider @start={{40}} @range={{hash min=0 max=100}} />
    </Example>

    <h3>Two handles + connect</h3>
    <Example @code={{twoHandleCode}}>
      <RangeSlider
        @start={{array 20 80}}
        @range={{hash min=0 max=100}}
        @connect={{true}}
      />
    </Example>

    <h3>Step</h3>
    <Example @code={{stepCode}}>
      <RangeSlider @start={{30}} @range={{hash min=0 max=100}} @step={{10}} />
    </Example>

    <h3>Vertical orientation</h3>
    <Example @code={{verticalCode}}>
      <RangeSlider
        class="vertical-slider"
        @start={{40}}
        @range={{hash min=0 max=100}}
        @orientation="vertical"
      />
    </Example>

    <h3>Tooltips</h3>
    <Example @code={{tooltipsCode}}>
      <RangeSlider
        @start={{50}}
        @range={{hash min=0 max=100}}
        @tooltips={{true}}
      />
    </Example>

    <h3>Disabled</h3>
    <Example @code={{disabledCode}}>
      <RangeSlider
        @start={{40}}
        @range={{hash min=0 max=100}}
        @disabled={{true}}
      />
    </Example>
  </section>
</template>
