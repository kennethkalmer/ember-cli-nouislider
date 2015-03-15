import Ember from 'ember';

export default Ember.Route.extend({
  model: function() {
    return Ember.Object.create({
      defaultRange: { min: 0, max: 100 },

      startOne: [ 20, 80 ],

      startMargin: [ 20, 80 ],

      limitStart: [ 20, 120 ],

      stepStart: [ 20, 80 ],

      animateStart: 20,
    });
  },

  actions: {
    animateValues: function() {
      var model = this.modelFor("options");
      model.set('animateStart', 60);
    }
  }
});
