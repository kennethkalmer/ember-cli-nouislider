import { array, hash } from '@ember/helper';
import RangeSlider from 'ember-cli-nouislider/components/range-slider';

<template>
  <section>
    <h2>Single handle</h2>
    <RangeSlider @start={{40}} @range={{hash min=0 max=100}} @connect="lower" />
  </section>

  <section>
    <h2>Two handles</h2>
    <RangeSlider
      @start={{array 20 80}}
      @range={{hash min=0 max=100}}
      @connect={{true}}
      @tooltips={{true}}
    />
  </section>
</template>
