import EventDemo from 'test-app/components/event-demo';
import SourceCode from 'test-app/components/source-code';

const templateCode = `<RangeSlider
  @start={{50}}
  @range={{hash min=0 max=100}}
  @onChange={{this.handleChange}}
  @onSet={{this.handleSet}}
  @onSlide={{this.handleSlide}}
  @onUpdate={{this.handleUpdate}}
  @onStart={{this.handleStart}}
  @onEnd={{this.handleEnd}}
/>`;

const jsCode = `import Component from '@glimmer/component';
import { action } from '@ember/object';
import { tracked } from '@glimmer/tracking';

export default class SliderWidget extends Component {
  @tracked value = 50;

  @action
  handleChange(value) {
    this.value = value;
  }
}`;

<template>
  <section>
    <h2>Events</h2>
    <p>
      noUiSlider fires
      <code>change</code>,
      <code>set</code>,
      <code>slide</code>,
      <code>update</code>,
      <code>start</code>,
      <code>end</code>. Pass callbacks via
      <code>@onChange</code>,
      <code>@onSet</code>, etc.
    </p>

    <EventDemo />

    <h3>Template</h3>
    <SourceCode @lang="handlebars" @code={{templateCode}} />

    <h3>Component class</h3>
    <SourceCode @lang="javascript" @code={{jsCode}} />
  </section>
</template>
