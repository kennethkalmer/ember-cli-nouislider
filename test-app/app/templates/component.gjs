import { LinkTo } from '@ember/routing';
import SourceCode from 'test-app/components/source-code';

const installCode = `# add to your Ember app
ember install ember-cli-nouislider

# v2 addons are auto-detected; no extra build wiring needed.`;

const importCssCode = `// app/app.js
import 'nouislider/dist/nouislider.css';`;

const renderCode = `<RangeSlider
  @start={{this.value}}
  @range={{hash min=0 max=100}}
  @onChange={{this.handleChange}}
/>`;

const reexportCode = `// app/components/range-slider.js
export { default } from 'ember-cli-nouislider/components/range-slider';

// then in templates:
<RangeSlider @start={{this.value}} />`;

const actionCode = `// app/components/my-form.js
import Component from '@glimmer/component';
import { action } from '@ember/object';
import { tracked } from '@glimmer/tracking';

export default class MyForm extends Component {
  @tracked value = 40;

  @action
  handleChange(value) {
    this.value = Number(value);
  }
}`;

<template>
  <div class="page">
    <h1>Create your component</h1>
    <p>
      <code>ember-cli-nouislider</code>
      ships
      <code>RangeSlider</code>
      as a Glimmer component. Import it directly, or re-export it from your own
      app so consumers can configure defaults in one place.
    </p>

    <section>
      <h2 id="install">
        <a href="#install" class="anchor">§</a>
        Install
      </h2>
      <div class="doc-row">
        <div class="doc-prose">
          <p>Install the addon, then load the noUiSlider stylesheet wherever you
            load your app's CSS (typically
            <code>app/app.js</code>).</p>
        </div>
        <div class="doc-code">
          <SourceCode @lang="bash" @code={{installCode}} />
          <SourceCode @lang="javascript" @code={{importCssCode}} />
        </div>
      </div>
    </section>

    <section>
      <h2 id="render">
        <a href="#render" class="anchor">§</a>
        Render
      </h2>
      <div class="doc-row">
        <div class="doc-prose">
          <p>Render the slider where you need it. All
            <a
              href="https://refreshless.com/nouislider/slider-options/"
            >noUiSlider options</a>
            are accepted as
            <code>@</code>-prefixed arguments.</p>
          <p>If you want a customised default in your app, re-export the
            component:</p>
        </div>
        <div class="doc-code">
          <SourceCode @lang="handlebars" @code={{renderCode}} />
          <SourceCode @lang="javascript" @code={{reexportCode}} />
        </div>
      </div>
    </section>

    <section>
      <h2 id="action">
        <a href="#action" class="anchor">§</a>
        Action
      </h2>
      <div class="doc-row">
        <div class="doc-prose">
          <p>Set up an action handler on your component or controller to react
            to slider changes. Use
            <code>@onChange</code>
            (fires after release),
            <code>@onSlide</code>
            (fires while dragging) or any other supported event.</p>
          <p>You can mutate
            <code>@tracked</code>
            state directly — the addon defers callbacks past the current render
            frame to keep autotracking happy.</p>
        </div>
        <div class="doc-code">
          <SourceCode @lang="javascript" @code={{actionCode}} />
        </div>
      </div>
    </section>

    <section class="doc-next">
      <h2>Next</h2>
      <p>Review the
        <LinkTo @route="options">available options</LinkTo>
        or the
        <LinkTo @route="events">event reference</LinkTo>.</p>
    </section>
  </div>
</template>
