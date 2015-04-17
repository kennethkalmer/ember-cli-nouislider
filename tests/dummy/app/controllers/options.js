import Ember from 'ember';

export default Ember.Controller.extend({
  marginMin: Ember.computed('model.margins.[]', function() {
    var margins = Ember.A(this.get('model.margins'));
    return margins.get('firstObject');
  }),

  marginMax: Ember.computed('model.margins.[]', function() {
    var margins = Ember.A(this.get('model.margins'));
    return margins.get('lastObject');
  }),

  limitMin: Ember.computed('model.limits.[]', function() {
    var limits = Ember.A(this.get('model.limits'));
    return limits.get('firstObject');
  }),

  limitMax: Ember.computed('model.limits.[]', function() {
    var limits = Ember.A(this.get('model.limits'));
    return limits.get('lastObject');
  })
});
