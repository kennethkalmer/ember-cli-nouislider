import Ember from 'ember';
import noUiSlider from 'noUiSlider';

export default Ember.Component.extend({
  slider:       null,

  start:        undefined,
  step:         undefined,
  margin:       undefined,
  limit:        undefined,
  connect:      false,
  orientation:  "horizontal",
  direction:    "ltr",
  behaviour:    "tap",
  animate:      true,

  min: 0,
  max: 100,
  range: Ember.computed("min", "max", function() {
    return {
      min: this.get('min'),
      max: this.get('max')
    };
  }),

  didInsertElement: function() {
    let $this = this.$().get(0);

    noUiSlider.create($this, {
      start:       this.get('start'),
      step:        this.get('step'),
      margin:      this.get('margin'),
      limit:       this.get('limit'),
      range:       this.get('range'),
      connect:     this.get('connect'),
      orientation: this.get('orientation'),
      direction:   this.get('direction'),
      behaviour:   this.get('behaviour'),
      animate:     this.get('animate')
    });

    let slider = $this.noUiSlider;
    this.set('slider', slider);

    slider.on("change", () => {
      Ember.run(this, function () {
        this.sendAction('change', this.get('slider').get());
      });
    });

    if ( !Ember.isEmpty(this.get('slide')) ) {
      slider.on("slide", () => {
        Ember.run(this, function () {
          this.sendAction('slide', this.get('slider').get());
        });
      });
    }
  },

  willDestroyElement: function() {
    this.get('slider').destroy();
  },

  setVal: Ember.observer('start', function() {
    let slider = this.get('slider');

    if (slider) {
      var val = this.get('start');
      slider.set( val );
    }
  })
});
