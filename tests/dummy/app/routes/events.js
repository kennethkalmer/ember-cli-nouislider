import Ember from 'ember';

export default Ember.Route.extend({
  model: function() {
    return Ember.Object.create({
      start: [ 5, 15 ],
      range: { min: 0, max: 20 },

      changed: false,
      sliding: false,

      value: [ 5, 15 ]
    });
  },

  actions: {
    change: function(val) {
      var model = this.modelFor("events");
      model.set('value', val);
      model.set('changed', true);

      Ember.run.later(model, function() {
        this.set('changed', false);
      }, 500);
    },

    slide: function(val) {
      var model = this.modelFor("events");
      model.set('value', val);
      model.set('sliding', true);

      Ember.run.later(model, function() {
        this.set('sliding', false);
      }, 500);
    }
  }
});
