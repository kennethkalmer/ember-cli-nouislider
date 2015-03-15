import Ember from 'ember';

export default Ember.Route.extend({
  model: function() {
    return {
      value: [20, 80]
    };
  },

  actions: {
    sliderChanged: function(value) {
      this.set("model.value", value);
      Ember.debug("Slider value changed to %@".fmt(value));
    }
  }
});
