import Component from '@ember/component';
import noUiSlider from 'noUiSlider';
import { run } from '@ember/runloop';
import { computed, observer } from '@ember/object';

const SLIDER_EVENTS = ['change', 'set', 'slide', 'update', 'start', 'end'];
const SLIDER_CREATE_PROPERTIES = [
  'start',
  'step',
  'margin',
  'limit',
  'range',
  'connect',
  'orientation',
  'direction',
  'behaviour',
  'animate',
  'snap',
  'pips',
  'format',
  'tooltips',
  'multitouch'
];
const SLIDER_UPDATE_PROPERTIES = [
  'margin',
  'limit',
  'step',
  'range',
  'animate',
  'snap',
  'start'
];

export default Component.extend({
  attributeBindings: ['disabledOrUndefined:disabled'],
  slider: null,
  start: undefined,
  step: undefined,
  margin: undefined,
  limit: undefined,
  pips: undefined,
  animate: true,
  snap: false,
  connect: false,
  disabled: false,
  orientation: 'horizontal',
  direction: 'ltr',
  behaviour: 'tap',
  tooltips: false,
  multitouch: false,

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
    let element = this.get('element');
    let { noUiSlider: slider } = element;
    let properties = this.getProperties(...SLIDER_CREATE_PROPERTIES);

    // We first check if the element has a slider already created
    if (slider && slider.destroy) {
      slider.destroy();
    }

    try {
      slider = noUiSlider.create(element, properties, true);
    } catch (err) {
      /* eslint no-console:0 */
      console.warn(`[ember-nouislider]: ${err}`);
    }

    this.slider = slider;

    for (let event of SLIDER_EVENTS) {
      let action = `on-${event}`;
      if (typeof this[action] === 'function') {
        slider.on(event, () => {
          run(this, function() {
            let value = this.slider.get();
            this[action](value);
          });
        });
      }
    }
  },

  didUpdateAttrs() {
    let { slider } = this;
    let properties = this.getProperties(SLIDER_UPDATE_PROPERTIES);

    if (slider) {
      slider.updateOptions(properties);
    }
  },

  willDestroyElement() {
    let { slider } = this;

    slider.off('change');
    slider.off('slide');
    slider.off('set');
    slider.off('update');
    slider.off('start');
    slider.off('end');

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
  })
});
