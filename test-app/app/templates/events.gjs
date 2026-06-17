import EventDemo from 'test-app/components/event-demo';
import SourceCode from 'test-app/components/source-code';

const intro = `<RangeSlider
  @start={{this.value}}
  @onChange={{this.handleChange}}
  @onSlide={{this.handleSlide}}
  @onUpdate={{this.handleUpdate}}
  @onSet={{this.handleSet}}
  @onStart={{this.handleStart}}
  @onEnd={{this.handleEnd}}
/>`;

const introJs = `// app/components/slider-widget.js
import Component from '@glimmer/component';
import { action } from '@ember/object';
import { tracked } from '@glimmer/tracking';

export default class SliderWidget extends Component {
  @tracked value = 50;

  @action handleChange(value) { /* released after drag */ }
  @action handleSlide(value)  { /* sliding */ }
  @action handleUpdate(value) { /* any value change */ }
  @action handleSet(value)    { /* slider.set() / tap */ }
  @action handleStart()       { /* user grabbed handle */ }
  @action handleEnd()         { /* user released handle */ }
}`;

const changeCode = `<RangeSlider
  @start={{this.value}}
  @onChange={{this.handleChange}}
/>`;

const slideCode = `<RangeSlider
  @start={{this.value}}
  @onSlide={{this.handleSlide}}
/>`;

const setCode = `<RangeSlider
  @start={{this.value}}
  @onSet={{this.handleSet}}
/>`;

const updateCode = `<RangeSlider
  @start={{this.value}}
  @onUpdate={{this.handleUpdate}}
/>`;

const startEndCode = `<RangeSlider
  @start={{this.value}}
  @onStart={{this.handleStart}}
  @onEnd={{this.handleEnd}}
/>`;

<template>
  <div class="page">
    <h1>Events</h1>
    <p>
      <code>RangeSlider</code>
      forwards every noUiSlider event as a camelCased argument:
      <code>@onChange</code>,
      <code>@onSet</code>,
      <code>@onSlide</code>,
      <code>@onUpdate</code>,
      <code>@onStart</code>,
      <code>@onEnd</code>. Each callback receives the slider's current value.
    </p>

    <div class="doc-row">
      <div class="doc-prose">
        <EventDemo />
        <p>Drag the handle to watch which events fire.</p>
      </div>
      <div class="doc-code">
        <SourceCode @lang="handlebars" @code={{intro}} />
      </div>
    </div>

    <h3>Component class</h3>
    <SourceCode @lang="javascript" @code={{introJs}} />

    <h3>When do events fire?</h3>
    <table class="events-table">
      <thead>
        <tr>
          <th>&nbsp;</th>
          <th>onUpdate</th>
          <th>onSlide</th>
          <th>onSet</th>
          <th>onChange</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>Handle <strong>released</strong> after drag</td>
          <td class="yes">yes</td>
          <td class="no">no</td>
          <td class="yes">yes</td>
          <td class="yes">yes</td>
        </tr>
        <tr>
          <td>Slider moved by <strong>tap</strong></td>
          <td class="yes">yes</td>
          <td class="yes">yes</td>
          <td class="yes">yes</td>
          <td class="yes">yes</td>
        </tr>
        <tr>
          <td>Handle moves while <strong>dragging</strong></td>
          <td class="yes">yes</td>
          <td class="yes">yes</td>
          <td class="no">no</td>
          <td class="no">no</td>
        </tr>
        <tr>
          <td><code>slider.set()</code> called</td>
          <td class="yes">yes</td>
          <td class="no">no</td>
          <td class="yes">yes</td>
          <td class="no">no</td>
        </tr>
      </tbody>
    </table>

    <section class="option-section">
      <h2 id="change">
        <a href="#change" class="anchor">§</a>
        Change
      </h2>
      <div class="doc-row">
        <div class="doc-prose">
          <p>Fires after a handle is released or the slider is tapped. Use this
            when you treat the slider as just-another-input-type and only care
            about the committed value.</p>
        </div>
        <div class="doc-code">
          <SourceCode @lang="handlebars" @code={{changeCode}} />
        </div>
      </div>
    </section>

    <section class="option-section">
      <h2 id="slide">
        <a href="#slide" class="anchor">§</a>
        Slide
      </h2>
      <div class="doc-row">
        <div class="doc-prose">
          <p>Fires repeatedly while the user drags a handle (and once on tap).
            Useful for live previews — e.g. updating a chart while the user is
            still sliding.</p>
        </div>
        <div class="doc-code">
          <SourceCode @lang="handlebars" @code={{slideCode}} />
        </div>
      </div>
    </section>

    <section class="option-section">
      <h2 id="set">
        <a href="#set" class="anchor">§</a>
        Set
      </h2>
      <div class="doc-row">
        <div class="doc-prose">
          <p>Fires when the value is set — by user interaction or by calling
            <code>slider.set()</code>
            programmatically. Does not fire while dragging.</p>
        </div>
        <div class="doc-code">
          <SourceCode @lang="handlebars" @code={{setCode}} />
        </div>
      </div>
    </section>

    <section class="option-section">
      <h2 id="update">
        <a href="#update" class="anchor">§</a>
        Update
      </h2>
      <div class="doc-row">
        <div class="doc-prose">
          <p>Fires for every value change — drag, tap, set, options change. Best
            when you want to mirror the slider value into other UI.</p>
        </div>
        <div class="doc-code">
          <SourceCode @lang="handlebars" @code={{updateCode}} />
        </div>
      </div>
    </section>

    <section class="option-section">
      <h2 id="start-end">
        <a href="#start-end" class="anchor">§</a>
        Start &amp; End
      </h2>
      <div class="doc-row">
        <div class="doc-prose">
          <p><code>onStart</code>
            fires when the user first grabs a handle;
            <code>onEnd</code>
            fires when they release it. Handy for "is the user actively
            sliding?" UI states.</p>
        </div>
        <div class="doc-code">
          <SourceCode @lang="handlebars" @code={{startEndCode}} />
        </div>
      </div>
    </section>
  </div>
</template>
