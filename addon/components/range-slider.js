/* eslint ember/closure-actions: 0 */

import { A } from '@ember/array';
import Component from '@ember/component';
import { run } from '@ember/runloop';
import { isEmpty } from '@ember/utils';
import { observer, computed } from '@ember/object';
import Ember from 'ember';
import noUiSlider from 'noUiSlider';

const {
  Logger: { warn }
} = Ember;

export default Component.extend({
  attributeBindings: ['disabledOrUndefined:disabled'],
  slider:       null,
  start:        undefined,
  step:         undefined,
  margin:       undefined,
  limit:        undefined,
  pips:         undefined,
  animate:      true,
  snap:         false,
  connect:      false,
  disabled:     false,
  orientation:  'horizontal',
  direction:    'ltr',
  behaviour:    'tap',
  tooltips:     false,
  multitouch:   false,

  min: 0,
  max: 100,

  range: computed('min', 'max', function() {
    return {
      min: this.get('min'),
      max: this.get('max')
    };
  }),

  formatTo(value) {
    return value;
  },

  formatFrom(value) {
    return +value;
  },

  format: computed('formatTo', 'formatFrom', function() {
    return {
      to: this.get('formatTo'),
      from: this.get('formatFrom')
    };
  }),

  didInsertElement() {
    this.setup();
  },

  setup() {
    let element = this.get('element');
    let { noUiSlider: slider } = element;
    let properties = this.getProperties(
      'start', 'step', 'margin',
      'limit', 'range', 'connect',
      'orientation', 'direction',
      'behaviour', 'animate', 'snap',
      'pips', 'format', 'tooltips',
      'multitouch', 'cssPrefix', 'cssClasses'
    );
    let sliderEvents = A(['change', 'set', 'slide', 'update', 'start', 'end']);

    // We first check if the element has a slider already created
    if (slider && slider.destroy) {
      slider.destroy();
    }

    try {
      slider = noUiSlider.create(element, properties, true);
    } catch (err) {
      warn(`[ember-cli-nouislider]: ${err}`);
    }

    this.slider = slider;

    sliderEvents.forEach(event => {
      const eventActionName = `on-${event}`;

      if (!isEmpty(this.get(eventActionName))) {
        slider.on(event, () => {
          run(this, function() {
            const val = this.get('slider').get();
            const action = this.get(eventActionName);

            if (typeof(action) === 'string') {
              // Note that `sendAction` is deprecated and this will trigger a deprecation message.
              this.sendAction(eventActionName, val);
            } else if (typeof(action) === 'function') {
              action(val);
            }
          });
        });
      }
    });
  },

  optionsChanged: observer('margin', 'limit', 'padding','range', 'animate', 'snap', 'step', 'format', function() {
    let { slider } = this;
    let properties = this.getProperties(
      'margin', 'limit', 'padding',
      'range', 'animate', 'snap',
      'step', 'format'
    );

    if (slider) {
      slider.updateOptions(properties);
    }
  }),

  willDestroyElement() {
    this.teardown();
  },

  teardown() {
    let { slider } = this;

    // Remove all event listeners
    slider.off();

    slider.destroy();
  },

  setValue: observer('start', function() {
    let { slider } = this;

    if (slider) {
      let value = this.get('start');
      slider.set(value);
    }
  }),

  // disabled can't be just `false` - this leads to an attribute of disabled="false"
  disabledOrUndefined: computed('disabled', function() {
    if (this.get('disabled')) {
      return true;
    }
    return undefined;
  })
});
