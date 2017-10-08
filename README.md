# ember-cli-nouislider

[![Build Status](https://travis-ci.org/kennethkalmer/ember-cli-nouislider.png)](https://travis-ci.org/kennethkalmer/ember-cli-nouislider)
[![npm version](https://badge.fury.io/js/ember-cli-nouislider.svg)](http://badge.fury.io/js/ember-cli-nouislider)
[![Code Climate](https://codeclimate.com/github/kennethkalmer/ember-cli-nouislider/badges/gpa.svg)](https://codeclimate.com/github/kennethkalmer/ember-cli-nouislider)
[![Ember Observer Score](http://emberobserver.com/badges/ember-cli-nouislider.svg)](http://emberobserver.com/addons/ember-cli-nouislider)

This ember-cli addon provides you with a range-slider component, based on
[noUiSlider](http://refreshless.com/nouislider). It includes everything you need,
and adds no extra dependencies other than noUiSlider itself (which has no external dependencies).

To get started simply install the addon:

```
$ ember install ember-cli-nouislider
```

(This addon supports Ember 1.13 and up. It might work on older versions, but this is guaranteed.)


This will install `nouislider` via Bower, and will include it into your application's
mergetree, so you don't need to worry about anything there.

## Demo & documentation

Have a look around then [demo and documentation](http://kennethkalmer.github.com/ember-cli-nouislider)
to get a feel for how to use it.

## Component

You have the opportunity to customize if needed.

To do this, generate your own component and re-export
the one provided:

```
$ ember g component range-slider
```

```js
// app/components/range-slider.js
import RangeSlider from 'ember-cli-nouislider/components/range-slider';

export default RangeSlider;
```

Include the slider into your views like this:

```handlebars
{{range-slider start=someValue on-change="changedAction"}}
```

And setup an action handler in your route:

```js
// app/routes/my-route.js
import Ember from 'ember';

export default Ember.Route.extend({
  // ...
  actions: {
    // ...
    changedAction: function(value) {
      Ember.debug( "New slider value: %@".fmt( value ) );
    }
  }
});
```

See the [documentation](https://kennethkalmer.github.com/ember-cli-nouislider/)
for more actions.

## Configuration

The component has a lot of configurable options, most of them mapping directly
to the [original options](http://refreshless.com/nouislider/slider-options/).
To see how the slider is initialized internally, please have a look at
`app/components/range-slider.js` in this project, or browse through the
[documentation](https://kennethkalmer.github.com/ember-cli-nouislider).

## Contributing or running locally

This section outlines the details of collaborating on this Ember addon.

### Installing dependencies

* `git clone https://github.com/kennethkalmer/ember-cli-nouislider`
* `cd ember-cli-nouislider`
* `npm install`

## Running

* `ember serve`
* Visit your app at [http://localhost:4200](http://localhost:4200).

## Running Tests

* `npm test` (Runs `ember try:each` to test your addon against multiple Ember versions)
* `ember test`
* `ember test --server`

## Building

* `ember build`

For more information on using ember-cli, visit [https://ember-cli.com/](https://ember-cli.com/).
