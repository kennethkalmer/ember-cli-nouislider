import Ember from 'ember';

export default Ember.Component.extend({

  start: 50,
  step: 10,
  margin: undefined,
  limit: undefined,
  connect: false,
  orientation: "horizontal",
  direction: "ltr",
  behaviour: "tap",

  min: 0,
  max: 100,
  range: function() {
    return {
      min: this.get('min'),
      max: this.get('max')
    }
  }.property("min", "max"),

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
      behaviour:   this.get('behaviour')
    });

    var _this = this;
    this.$().on("change", function() {
      _this.sendAction("change", _this.slider.val());
    });
  },

  willDestroyElement: function() {
    this.slider[0].destroy();
  }
});
