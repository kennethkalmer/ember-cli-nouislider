import Component from '@glimmer/component';
import SourceCode from 'test-app/components/source-code';

export default class Example extends Component {
  get lang() {
    return this.args.lang || 'handlebars';
  }

  <template>
    <div class="example">
      <div class="example-rendered">
        {{yield}}
      </div>
      <div class="example-code">
        <SourceCode @lang={{this.lang}} @code={{@code}} />
      </div>
    </div>
  </template>
}
