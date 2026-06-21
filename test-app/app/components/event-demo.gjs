import Component from '@glimmer/component';
import { action } from '@ember/object';
import { tracked } from '@glimmer/tracking';
import { hash } from '@ember/helper';
import RangeSlider from 'ember-cli-nouislider/components/range-slider';

const EVENTS = ['update', 'slide', 'set', 'change', 'start', 'end'];

export default class EventDemo extends Component {
  @tracked displayValue = 50;
  @tracked fired = {};

  flash(event, value) {
    if (value !== undefined) this.displayValue = value;
    const stamp = Date.now();
    this.fired = { ...this.fired, [event]: stamp };
    setTimeout(() => {
      if (this.fired[event] === stamp) {
        const next = { ...this.fired };
        delete next[event];
        this.fired = next;
      }
    }, 600);
  }

  isActive = (event) => Boolean(this.fired[event]);

  @action
  onChange(value) {
    this.flash('change', value);
  }
  @action
  onSet(value) {
    this.flash('set', value);
  }
  @action
  onSlide(value) {
    this.flash('slide', value);
  }
  @action
  onUpdate(value) {
    this.flash('update', value);
  }
  @action
  onStart() {
    this.flash('start');
  }
  @action
  onEnd() {
    this.flash('end');
  }

  <template>
    <RangeSlider
      @start={{50}}
      @range={{hash min=0 max=100}}
      @connect="lower"
      @onChange={{this.onChange}}
      @onSet={{this.onSet}}
      @onSlide={{this.onSlide}}
      @onUpdate={{this.onUpdate}}
      @onStart={{this.onStart}}
      @onEnd={{this.onEnd}}
    />

    <div class="event-badges">
      {{#each EVENTS as |event|}}
        <span
          class="event-badge {{if (this.isActive event) 'event-badge-active'}}"
        >
          {{event}}
        </span>
      {{/each}}
    </div>

    <p class="event-value">value:
      <strong>{{this.displayValue}}</strong>
    </p>
  </template>
}
