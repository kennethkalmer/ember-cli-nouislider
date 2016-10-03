import Ember from 'ember';

export default Ember.Route.extend({
  model: function() {
    return Ember.Object.create({
      defaultRange: { min: 0, max: 100 },
      defaultStart: [ 20, 80 ],

      margins: [ 20, 80 ],
      limits: [ 20, 60 ],
      steps: [ 20, 80 ],
      direction: 20,
      animate: 20,
      disabled: false
    });
  },

  actions: {
    marginChanged: function(val) {
      var model = this.modelFor("options");
      model.set("margins", val);
    },

    limitsChanged: function(val) {
      var model = this.modelFor("options");
      model.set("limits", val);
    },

    directionChanged: function(val) {
      var model = this.modelFor("options");
      model.set("direction", val);
    },

    animateValues: function() {
      var model = this.modelFor("options");
      model.set('animate', 60);
    },

    disableSlider: function() {
      var model = this.modelFor("options");
      model.toggleProperty("disabled");
    }
  }
});
