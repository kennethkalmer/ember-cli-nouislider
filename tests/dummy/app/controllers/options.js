import { A } from '@ember/array';
import { computed } from '@ember/object';
import Controller from '@ember/controller';

export default Controller.extend({
  marginMin: computed('model.margins.[]', function() {
    let margins = A(this.get('model.margins'));
    return margins.get('firstObject');
  }),

  marginMax: computed('model.margins.[]', function() {
    let margins = A(this.get('model.margins'));
    return margins.get('lastObject');
  }),

  limitMin: computed('model.limits.[]', function() {
    let limits = A(this.get('model.limits'));
    return limits.get('firstObject');
  }),

  limitMax: computed('model.limits.[]', function() {
    let limits = A(this.get('model.limits'));
    return limits.get('lastObject');
  })
});
