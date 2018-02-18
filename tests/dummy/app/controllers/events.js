import Controller from '@ember/controller';

export default Controller.extend({
  actions: {
    update(value) {
      this.send("showEffect", "updating", value);
    },

    change(value) {
      this.send("showEffect", "changed", value);
    },

    setValue(value) {
      this.send("showEffect", "beenSet", value);
    },

    slide(value) {
      this.send("showEffect", "sliding", value);
    },

    started(value) {
      this.send("showEffect", "started", value);
    },

    ended(value) {
      this.send("showEffect", "ended", value);
    }
  }
});
