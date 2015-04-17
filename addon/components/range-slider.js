import Ember from 'ember';

export default Ember.Component.extend({

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
    this.slider = this.$().noUiSlider({
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

    var _this = this;
    this.$().on("change", function() {
      _this.sendAction("change", _this.slider.val());
    });
  },

  willDestroyElement: function() {
    this.slider[0].destroy();
  },

  setVal: Ember.observer('start', function() {
    if (this.slider) {
      var val = this.get('start');
      this.slider.val( val );
    }
  })
});
