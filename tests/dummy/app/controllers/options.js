import Ember from 'ember';

export default Ember.ObjectController.extend({
  marginMin: function() {
    var model = this.get('model');
    return model.get('margins.firstObject');
  }.property('model.margins.[]'),

  marginMax: function() {
    var model = this.get('model');
    return model.get('margins.lastObject');
  }.property('model.margins.[]'),

  limitMin: function() {
    var model = this.get('model');
    return model.get('limits.firstObject');
  }.property('model.limits.[]'),

  limitMax: function() {
    var model = this.get('model');
    return model.get('limits.lastObject');
  }.property('model.limits.[]')
});
