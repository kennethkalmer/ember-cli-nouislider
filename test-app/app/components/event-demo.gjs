import Component from '@glimmer/component';
import { action } from '@ember/object';
import { tracked } from '@glimmer/tracking';
import { hash } from '@ember/helper';
import RangeSlider from 'ember-cli-nouislider/components/range-slider';

export default class EventDemo extends Component {
  @tracked log = [];

  @action
  record(eventName, value) {
    const entry = {
      event: eventName,
      value: JSON.stringify(value),
      at: new Date().toLocaleTimeString(),
    };
    this.log = [entry, ...this.log].slice(0, 10);
  }

  change = (value) => this.record('change', value);
  set = (value) => this.record('set', value);
  slide = (value) => this.record('slide', value);
  update = (value) => this.record('update', value);
  start = (value) => this.record('start', value);
  end = (value) => this.record('end', value);

  <template>
    <RangeSlider
      @start={{50}}
      @range={{hash min=0 max=100}}
      @onChange={{this.change}}
      @onSet={{this.set}}
      @onSlide={{this.slide}}
      @onUpdate={{this.update}}
      @onStart={{this.start}}
      @onEnd={{this.end}}
    />

    <h3>Recent events</h3>
    <ul>
      {{#each this.log as |entry|}}
        <li>
          <strong>{{entry.event}}</strong>
          &rarr;
          <code>{{entry.value}}</code>
          <small>({{entry.at}})</small>
        </li>
      {{/each}}
    </ul>
  </template>
}
