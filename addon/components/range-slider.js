import Ember from 'ember';
import noUiSlider from 'noUiSlider';

const {
  on,
  run,
  isEmpty,
  computed,
  observer
} = Ember;

export default Ember.Component.extend({
  slider:       null,
  start:        undefined,
  step:         undefined,
  margin:       undefined,
  limit:        undefined,
  pips:         undefined,
  animate:      true,
  snap:         false,
  connect:      false,
  orientation:  'horizontal',
  direction:    'ltr',
  behaviour:    'tap',

  min: 0,
  max: 100,

  range: computed('min', 'max', function() {
    return {
      min: this.get('min'),
      max: this.get('max')
    };
  }),

  formatTo(value) { return value; },
  formatFrom(value) { return value; },

  format: computed('formatTo', 'formatFrom', function() {
    return {
      to: this.get('formatTo'),
      from: this.get('formatFrom')
    };
  }),

  setup: on('didInsertElement', function() {
    let $this = this.$().get(0);
    let properties = this.getProperties(
      'start', 'step', 'margin',
      'limit', 'range', 'connect',
      'orientation', 'direction',
      'behaviour', 'animate', 'snap',
      'pips'
    );

    noUiSlider.create($this, properties);

    let slider = $this.noUiSlider;
    this.set('slider', slider);

    slider.on('change', () => {
      run(this, function () {
        this.sendAction('change', this.get('slider').get());
      });
    });

    if (!isEmpty(this.get('slide'))) {
      slider.on('slide', () => {
        run(this, function () {
          this.sendAction('slide', this.get('slider').get());
        });
      });
    }
  }),

  teardown: on('willDestroyElement', function() {
    var slider = this.get('slider');

    slider.off('change');
    slider.off('slide');

    slider.destroy();
  }),

  setVal: observer('start', function() {
    let slider = this.get('slider');

    if (slider) {
      var val = this.get('start');
      slider.set(val);
    }
  })
});
