import EmberObject from '@ember/object';
import Route from '@ember/routing/route';

export default Route.extend({
  model() {
    return EmberObject.create({
      defaultRange: { min: 0, max: 100 },
      defaultStart: [ 20, 80 ],

      margins: [ 20, 80 ],
      padding: [ 20, 80 ],
      limits: [ 20, 60 ],
      steps: [ 20, 80 ],
      direction: 20,
      animate: 20,
      disabled: false,
      tooltips: [
        false,
        {
          to: num => {
            return Math.floor(num);
          }
        }
      ]
    });
  },

  actions: {
    marginChanged(val) {
      let model = this.modelFor("options");
      model.set("margins", val);
    },

    limitsChanged(val) {
      let model = this.modelFor("options");
      model.set("limits", val);
    },

    paddingChanged(val) {
      let model = this.modelFor("options");
      model.set("padding", val);
    },

    directionChanged(val) {
      let model = this.modelFor("options");
      model.set("direction", val);
    },

    animateValues() {
      let model = this.modelFor("options");
      model.set("animate", 60);
    },

    disableSlider() {
      let model = this.modelFor("options");
      model.toggleProperty("disabled");
    }
  }
});
