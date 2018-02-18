import Route from '@ember/routing/route';
import EmberObject from '@ember/object';
import { later } from '@ember/runloop';

export default Route.extend({
  model: function() {
    return EmberObject.create({
      start: [ 5, 15 ],
      range: { min: 0, max: 20 },

      changed: false,
      sliding: false,
      updating: false,
      beenSet: false,
      started: false,
      ended: false,

      value: [ 5, 15 ]
    });
  },

  actions: {
    showEffect(property, val) {
      var model = this.modelFor("events");
      model.set('value', val);
      model.set(property, true);

      later(model, function() {
        this.set(property, false);
      }, 500);
    }
  }
});
