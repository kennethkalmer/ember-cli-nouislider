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

function buildFormat(args) {
  if (args.format !== undefined) return args.format;
  if (args.formatTo || args.formatFrom) {
    return {
      to: args.formatTo ?? ((value) => value),
      from: args.formatFrom ?? ((value) => +value),
    };
  }
  return undefined;
}

function buildRange(args) {
  if (args.range !== undefined) return args.range;
  if (args.min !== undefined || args.max !== undefined) {
    return { min: args.min ?? 0, max: args.max ?? 100 };
  }
  return undefined;
}

// noUiSlider returns a string scalar or array-of-strings; consumer @start may
// be number or array. Coerce both sides to numbers for comparison so we only
// call slider.set() when the value would actually move.
function sameValue(a, b) {
  if (Array.isArray(a) || Array.isArray(b)) {
    const aArr = Array.isArray(a) ? a : [a];
    const bArr = Array.isArray(b) ? b : [b];
    if (aArr.length !== bArr.length) return false;
    return aArr.every((v, i) => Number(v) === Number(bArr[i]));
  }
  return Number(a) === Number(b);
}

export default class RangeSliderModifier extends Modifier {
  slider = null;
  sliding = false;
  failed = false;
  lastArgs = null;

  modify(element, _positional, named) {
    this.lastArgs = named;
    if (this.failed) return;
    if (!this.slider) {
      this.#setup(element, named);
    } else {
      this.#update(named);
    }
  }

  #setup(element, args) {
    const options = pick(args, CREATE_OPTIONS);

    // noUiSlider requires a range; default to 0-100 if the consumer hasn't
    // passed one explicitly.
    options.range = buildRange(args) ?? { min: 0, max: 100 };

    const format = buildFormat(args);
    if (format !== undefined) options.format = format;

    try {
      this.slider = noUiSlider.create(element, options, true);
    } catch (err) {
      this.failed = true;
      console.warn(`[ember-cli-nouislider]: ${err}`);
      return;
    }

    for (const event of EVENTS) {
      this.slider.on(event, (values, handle, unencoded, tap, positions) =>
        this.#dispatch(event, values, handle, unencoded, tap, positions),
      );
    }

    registerDestructor(this, () => {
      if (this.slider) {
        this.slider.off();
        this.slider.destroy();
        this.slider = null;
      }
    });
  }

  #update(args) {
    // Read every reactive arg the modifier cares about up-front so Glimmer's
    // autotracking re-invokes modify() when any of them change. Without this
    // an arg that's only read inside a conditional branch (e.g. `start`)
    // won't register as a dep on the run that took the other branch.
    const start = args.start;
    const updates = pick(args, UPDATEABLE_OPTIONS);

    const range = buildRange(args);
    if (range !== undefined && updates.range === undefined) {
      updates.range = range;
    }

    const format = buildFormat(args);
    if (format !== undefined && updates.format === undefined) {
      updates.format = format;
    }

    if (Object.keys(updates).length > 0) {
      this.slider.updateOptions(updates, false);
    }

    if (!this.sliding && start !== undefined) {
      // Use the unencoded values (slider.get(true)) so a non-numeric custom
      // @formatTo doesn't confuse the comparison and trigger a redundant
      // set() on every render.
      const current = this.slider.get(true);
      if (!sameValue(start, current)) {
        this.slider.set(start);
      }
    }
  }

  #dispatch(event, values, handle, unencoded, tap, positions) {
    if (event === 'start') this.sliding = true;
    if (event === 'end') this.sliding = false;

    const callback = callbackFor(this.lastArgs, event);
    if (typeof callback !== 'function') return;

    const value = this.slider.get();

    queueMicrotask(() =>
      callback(value, { values, handle, unencoded, tap, positions }),
    );
  }
}
