import Component from '@ember/component';
import { computed } from '@ember/object';
/* global Prism */

export default Component.extend({
  tagName: "pre",
  language: undefined,
  codeClass: computed(function() {
    let lang = this.get("language");
    return "language-" + lang;
  }),

  didInsertElement() {
    var code = this.element.children[0];
    Prism.highlightElement(code);
  }
});
