import Route from "@ember/routing/route";
import { debug } from '@ember/debug';

export default Route.extend({
  model: function() {
    return {
      value: [20, 80]
    };
  },

  actions: {
    sliderChanged: function(value) {
      this.set("model.value", value);
      debug("Slider value changed to %@".fmt(value));
    }
  }
});
