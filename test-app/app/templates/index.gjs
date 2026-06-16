import { array, hash } from '@ember/helper';
import RangeSlider from 'ember-cli-nouislider/components/range-slider';
import Example from 'test-app/components/example';

const singleCode = `<RangeSlider
  @start={{40}}
  @range={{hash min=0 max=100}}
  @connect="lower"
/>`;

const twoHandleCode = `<RangeSlider
  @start={{array 20 80}}
  @range={{hash min=0 max=100}}
  @connect={{true}}
  @tooltips={{true}}
/>`;

<template>
  <section>
    <h2>Single handle</h2>
    <Example @code={{singleCode}}>
      <RangeSlider
        @start={{40}}
        @range={{hash min=0 max=100}}
        @connect="lower"
      />
    </Example>
  </section>

  <section>
    <h2>Two handles</h2>
    <Example @code={{twoHandleCode}}>
      <RangeSlider
        @start={{array 20 80}}
        @range={{hash min=0 max=100}}
        @connect={{true}}
        @tooltips={{true}}
      />
    </Example>
  </section>
</template>
