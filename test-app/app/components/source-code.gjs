import Component from '@glimmer/component';
import { modifier } from 'ember-modifier';
import Prism from 'prismjs';

const highlight = modifier((element) => {
  Prism.highlightElement(element);
});

export default class SourceCode extends Component {
  get lang() {
    return this.args.lang || 'javascript';
  }

  get className() {
    return `language-${this.lang}`;
  }

  <template>
    <pre class={{this.className}}><code
        class={{this.className}}
        {{highlight}}
      >{{@code}}</code></pre>
  </template>
}
