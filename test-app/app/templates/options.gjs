import { array, hash } from '@ember/helper';
import RangeSlider from 'ember-cli-nouislider/components/range-slider';
import OptionDoc from 'test-app/components/option-doc';
import SourceCode from 'test-app/components/source-code';

const startCode = `<RangeSlider
  @start={{40}}
  @range={{hash min=0 max=100}}
/>`;

const connectCode = `<RangeSlider
  @start={{40}}
  @connect="lower"
  @range={{hash min=0 max=100}}
/>`;

const marginCode = `<RangeSlider
  @start={{array 20 60}}
  @margin={{30}}
  @range={{hash min=0 max=100}}
/>`;

const limitCode = `<RangeSlider
  @start={{array 30 50}}
  @limit={{40}}
  @connect={{true}}
  @range={{hash min=0 max=100}}
/>`;

const paddingCode = `<RangeSlider
  @start={{40}}
  @padding={{10}}
  @range={{hash min=0 max=100}}
/>`;

const stepCode = `<RangeSlider
  @start={{30}}
  @step={{10}}
  @range={{hash min=0 max=100}}
/>`;

const disabledCode = `<RangeSlider
  @start={{40}}
  @disabled={{true}}
  @range={{hash min=0 max=100}}
/>`;

const verticalCode = `<RangeSlider
  class="vertical-slider"
  @start={{40}}
  @orientation="vertical"
  @range={{hash min=0 max=100}}
/>`;

const directionCode = `<RangeSlider
  @start={{30}}
  @direction="rtl"
  @range={{hash min=0 max=100}}
/>`;

const animateCode = `<RangeSlider
  @start={{40}}
  @animate={{true}}
  @range={{hash min=0 max=100}}
/>`;

const tooltipsCode = `<RangeSlider
  @start={{50}}
  @tooltips={{true}}
  @range={{hash min=0 max=100}}
/>`;

<template>
  <div class="page">
    <h1>Options</h1>
    <p>
      The range-slider component can be configured with the same options as the
      underlying noUiSlider library. See the
      <a href="https://refreshless.com/nouislider/slider-options/">noUiSlider
        docs</a>
      for the canonical reference. The most common ones are covered below.
    </p>

    <OptionDoc
      @anchor="start"
      @title="Start"
      @default="none"
      @accepted="number, array[number], array[number, number]"
    >
      <:prose>
        <p>The
          <code>start</code>
          option sets the number of handles and their initial positions,
          relative to
          <code>range</code>.</p>
      </:prose>
      <:example>
        <RangeSlider @start={{40}} @range={{hash min=0 max=100}} />
      </:example>
      <:code>
        <SourceCode @lang="handlebars" @code={{startCode}} />
      </:code>
    </OptionDoc>

    <OptionDoc
      @anchor="connect"
      @title="Connect"
      @default="false"
      @accepted='"lower", "upper", true, false'
    >
      <:prose>
        <p>Controls the bar between the handles, or the edges of the slider. Use
          <code>"lower"</code>
          /
          <code>"upper"</code>
          to connect to one side, or
          <code>true</code>
          to connect between handles.</p>
      </:prose>
      <:example>
        <RangeSlider
          @start={{40}}
          @connect="lower"
          @range={{hash min=0 max=100}}
        />
      </:example>
      <:code>
        <SourceCode @lang="handlebars" @code={{connectCode}} />
      </:code>
    </OptionDoc>

    <OptionDoc
      @anchor="margin"
      @title="Margin"
      @default="none"
      @accepted="number"
    >
      <:prose>
        <p>With two handles, the minimum distance between them. Relative to
          <code>range</code>. Linear sliders only.</p>
      </:prose>
      <:example>
        <RangeSlider
          @start={{array 20 60}}
          @margin={{30}}
          @range={{hash min=0 max=100}}
        />
      </:example>
      <:code>
        <SourceCode @lang="handlebars" @code={{marginCode}} />
      </:code>
    </OptionDoc>

    <OptionDoc
      @anchor="limit"
      @title="Limit"
      @default="none"
      @accepted="number"
    >
      <:prose>
        <p>Opposite of
          <code>margin</code>: the maximum distance between two handles. Linear
          sliders only.</p>
      </:prose>
      <:example>
        <RangeSlider
          @start={{array 30 50}}
          @limit={{40}}
          @connect={{true}}
          @range={{hash min=0 max=100}}
        />
      </:example>
      <:code>
        <SourceCode @lang="handlebars" @code={{limitCode}} />
      </:code>
    </OptionDoc>

    <OptionDoc
      @anchor="padding"
      @title="Padding"
      @default="none"
      @accepted="number, array[number], array[number, number]"
    >
      <:prose>
        <p>Limits how close to the slider edges handles can move.</p>
      </:prose>
      <:example>
        <RangeSlider
          @start={{40}}
          @padding={{10}}
          @range={{hash min=0 max=100}}
        />
      </:example>
      <:code>
        <SourceCode @lang="handlebars" @code={{paddingCode}} />
      </:code>
    </OptionDoc>

    <OptionDoc @anchor="step" @title="Step" @default="none" @accepted="number">
      <:prose>
        <p>By default the slider moves fluently. Setting
          <code>step</code>
          makes the handle snap to intervals, relative to
          <code>range</code>.</p>
      </:prose>
      <:example>
        <RangeSlider @start={{30}} @step={{10}} @range={{hash min=0 max=100}} />
      </:example>
      <:code>
        <SourceCode @lang="handlebars" @code={{stepCode}} />
      </:code>
    </OptionDoc>

    <OptionDoc
      @anchor="disabled"
      @title="Disabled"
      @default="false"
      @accepted="true, false"
    >
      <:prose>
        <p>Renders the slider in a non-interactive state and sets the host
          element's
          <code>disabled</code>
          attribute.</p>
      </:prose>
      <:example>
        <RangeSlider
          @start={{40}}
          @disabled={{true}}
          @range={{hash min=0 max=100}}
        />
      </:example>
      <:code>
        <SourceCode @lang="handlebars" @code={{disabledCode}} />
      </:code>
    </OptionDoc>

    <OptionDoc
      @anchor="orientation"
      @title="Orientation"
      @default='"horizontal"'
      @accepted='"horizontal", "vertical"'
    >
      <:prose>
        <p>Lays the slider out horizontally or vertically. Vertical sliders
          don't have a default height; set one yourself via a class or inline
          style.</p>
      </:prose>
      <:example>
        <RangeSlider
          class="vertical-slider"
          @start={{40}}
          @orientation="vertical"
          @range={{hash min=0 max=100}}
        />
      </:example>
      <:code>
        <SourceCode @lang="handlebars" @code={{verticalCode}} />
      </:code>
    </OptionDoc>

    <OptionDoc
      @anchor="direction"
      @title="Direction"
      @default='"ltr"'
      @accepted='"ltr", "rtl"'
    >
      <:prose>
        <p>Sliders default to top-to-bottom / left-to-right. Set
          <code>direction</code>
          to flip the upper side of the slider.</p>
      </:prose>
      <:example>
        <RangeSlider
          @start={{30}}
          @direction="rtl"
          @range={{hash min=0 max=100}}
        />
      </:example>
      <:code>
        <SourceCode @lang="handlebars" @code={{directionCode}} />
      </:code>
    </OptionDoc>

    <OptionDoc
      @anchor="animate"
      @title="Animate"
      @default="true"
      @accepted="true, false"
    >
      <:prose>
        <p>Whether the slider animates to a new value when set programmatically.
          Disable for an instant jump.</p>
      </:prose>
      <:example>
        <RangeSlider
          @start={{40}}
          @animate={{true}}
          @range={{hash min=0 max=100}}
        />
      </:example>
      <:code>
        <SourceCode @lang="handlebars" @code={{animateCode}} />
      </:code>
    </OptionDoc>

    <OptionDoc
      @anchor="tooltips"
      @title="Tooltips"
      @default="false"
      @accepted="true, false, formatter, array"
    >
      <:prose>
        <p>Toggles per-handle tooltips. Pass
          <code>true</code>
          for the default, a formatter object or an array of formatters for
          per-handle control.</p>
      </:prose>
      <:example>
        <RangeSlider
          @start={{50}}
          @tooltips={{true}}
          @range={{hash min=0 max=100}}
        />
      </:example>
      <:code>
        <SourceCode @lang="handlebars" @code={{tooltipsCode}} />
      </:code>
    </OptionDoc>
  </div>
</template>
