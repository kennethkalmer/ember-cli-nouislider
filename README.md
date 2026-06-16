# ember-cli-nouislider

Ember range-slider component powered by [noUiSlider](https://refreshless.com/nouislider/).

Version 2.x is a [v2 Embroider addon](https://github.com/embroider-build/embroider/blob/main/docs/v2-faq.md), rewritten for modern Octane/Polaris Ember.

## Compatibility

* Ember.js v6.12 LTS or above
* Ember CLI v6.12 or above
* Node.js v20.19 or above

For older Ember versions (Classic / pre-Octane), use the v1.x line.

## Installation

```
ember install ember-cli-nouislider
```

Then import the noUiSlider stylesheet wherever you load your app's CSS — for example in `app/app.js`:

```js
import 'nouislider/dist/nouislider.css';
```

## Usage

```gjs
import RangeSlider from 'ember-cli-nouislider/components/range-slider';
import { hash } from '@ember/helper';

<template>
  <RangeSlider
    @start={{40}}
    @range={{hash min=0 max=100}}
    @connect="lower"
    @onChange={{this.handleChange}}
  />
</template>
```

Or in a classic `.hbs` template after re-exporting:

```js
// app/components/range-slider.js
export { default } from 'ember-cli-nouislider/components/range-slider';
```

```hbs
<RangeSlider @start={{this.value}} @onChange={{this.handleChange}} />
```

## Arguments

All [noUiSlider options](https://refreshless.com/nouislider/slider-options/) are accepted as `@`-prefixed component arguments:

`@start`, `@step`, `@margin`, `@padding`, `@limit`, `@range`, `@connect`,
`@orientation`, `@direction`, `@behaviour`, `@animate`, `@snap`, `@pips`,
`@format`, `@tooltips`, `@keyboardSupport`, `@cssPrefix`, `@cssClasses`,
`@disabled`.

Convenience shortcuts:

* `@min` / `@max` — produces `range: { min, max }` when `@range` is not passed.
* `@formatTo` / `@formatFrom` — produces a `format` object when `@format` is not passed.

## Events

Pass functions for any noUiSlider event:

* `@onChange`
* `@onSet`
* `@onSlide`
* `@onUpdate`
* `@onStart`
* `@onEnd`

Each callback receives the slider's current value (`slider.get()`).

### Event timing during render

noUiSlider fires `set` and `update` events synchronously when the
slider is created or when its options change. Because the addon's
modifier manipulates the slider during the consuming component's
render, those events can otherwise fire mid-render and trip Ember's
autotracking assertion ("you attempted to update X after using it in
the same computation").

To keep handlers safe, the addon defers every event callback via
`queueMicrotask`, so by the time your handler runs the current render
frame has closed. You can mutate `@tracked` state directly:

```js
@action
handleChange(value) {
  this.value = value; // always safe
}
```

The one-microtask delay is invisible to users for normal interactions
(drag, tap, keyboard) but means handlers run "next tick" rather than
synchronously.

## Upgrading from 1.x

Breaking changes:

* Now a v2 Embroider addon. Consumers need ember-auto-import 2 (already standard).
* Arguments use `@` prefix syntax (`@start` instead of `start`).
* Event handlers use camelCase named arguments (`@onChange` instead of `on-change`). String action names (`sendAction`) are no longer supported.
* You must import `nouislider/dist/nouislider.css` yourself; the addon no longer auto-injects it.
* jQuery is no longer assumed.
* `multitouch` option dropped (no longer exists in noUiSlider 15).

## License

[MIT](LICENSE.md)
