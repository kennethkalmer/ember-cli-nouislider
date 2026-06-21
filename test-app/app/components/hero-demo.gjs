import Component from '@glimmer/component';
import { action } from '@ember/object';
import { tracked } from '@glimmer/tracking';
import { hash } from '@ember/helper';
import RangeSlider from 'ember-cli-nouislider/components/range-slider';

export default class HeroDemo extends Component {
  @tracked value = 40;

  @action
  handleChange(value) {
    this.value = Math.round(Number(value));
  }

  <template>
    <RangeSlider
      @start={{this.value}}
      @range={{hash min=0 max=100}}
      @connect="lower"
      @onChange={{this.handleChange}}
    />
    <p class="hero-value">value: <strong>{{this.value}}</strong></p>
  </template>
}
