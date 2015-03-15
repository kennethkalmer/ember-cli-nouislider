import Ember from 'ember';
/* global Prism */

export default Ember.Component.extend({
  tagName: "pre",

  didInsertElement: function() {
    var code = this.element.children[0];
    Prism.highlightElement(code);
  }

});
