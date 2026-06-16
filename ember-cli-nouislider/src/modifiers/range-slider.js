import Modifier from 'ember-modifier';
import { registerDestructor } from '@ember/destroyable';
import noUiSlider from 'nouislider';

const CREATE_OPTIONS = [
  'start',
  'step',
  'margin',
  'padding',
  'limit',
  'range',
  'connect',
  'orientation',
  'direction',
  'behaviour',
  'animate',
  'snap',
  'pips',
  'format',
  'tooltips',
  'keyboardSupport',
  'cssPrefix',
  'cssClasses',
];

const UPDATEABLE_OPTIONS = [
  'margin',
  'limit',
  'padding',
  'range',
  'animate',
  'snap',
  'step',
  'format',
];

const EVENTS = ['change', 'set', 'slide', 'update', 'start', 'end'];

function pick(args, keys) {
  const out = {};
  for (const key of keys) {
    if (args[key] !== undefined) out[key] = args[key];
  }
  return out;
}

function callbackFor(args, event) {
  const camel = `on${event[0].toUpperCase()}${event.slice(1)}`;
  return args[camel];
}

export default class RangeSliderModifier extends Modifier {
  slider = null;
  sliding = false;
  lastStart = undefined;
  lastArgs = null;

  modify(element, _positional, named) {
    this.lastArgs = named;
    if (!this.slider) {
      this.#setup(element, named);
    } else {
      this.#update(named);
    }
  }

  #setup(element, args) {
    const options = pick(args, CREATE_OPTIONS);

    if (options.range === undefined) {
      options.range = { min: args.min ?? 0, max: args.max ?? 100 };
    }

    if (options.format === undefined && (args.formatTo || args.formatFrom)) {
      options.format = {
        to: args.formatTo ?? ((value) => value),
        from: args.formatFrom ?? ((value) => +value),
      };
    }

    try {
      this.slider = noUiSlider.create(element, options, true);
    } catch (err) {
      console.warn(`[ember-cli-nouislider]: ${err}`);
      return;
    }

    for (const event of EVENTS) {
      this.slider.on(event, () => this.#dispatch(event));
    }

    this.lastStart = args.start;

    registerDestructor(this, () => {
      if (this.slider) {
        this.slider.off();
        this.slider.destroy();
        this.slider = null;
      }
    });
  }

  #update(args) {
    const updates = pick(args, UPDATEABLE_OPTIONS);

    if (
      updates.range === undefined &&
      (args.min !== undefined || args.max !== undefined)
    ) {
      updates.range = { min: args.min ?? 0, max: args.max ?? 100 };
    }

    if (Object.keys(updates).length > 0) {
      this.slider.updateOptions(updates, false);
    }

    if (
      !this.sliding &&
      args.start !== undefined &&
      args.start !== this.lastStart
    ) {
      this.slider.set(args.start);
      this.lastStart = args.start;
    }
  }

  #dispatch(event) {
    if (event === 'start') this.sliding = true;
    if (event === 'end') this.sliding = false;

    const callback = callbackFor(this.lastArgs, event);
    if (typeof callback !== 'function') return;

    const value = this.slider.get();

    queueMicrotask(() => callback(value));
  }
}
