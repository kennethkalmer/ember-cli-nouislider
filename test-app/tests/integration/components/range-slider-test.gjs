import { module, test } from 'qunit';
import { array, hash } from '@ember/helper';
import { render, settled } from '@ember/test-helpers';
import { tracked } from '@glimmer/tracking';
import { setupRenderingTest } from 'test-app/tests/helpers';
import RangeSlider from 'ember-cli-nouislider/components/range-slider';

class State {
  @tracked value = 20;
}

class TwoHandleState {
  @tracked value = [20, 80];
  @tracked counter = 0;
}

class FormatState {
  @tracked value = 50;
  @tracked formatter = (v) => `A${Math.round(v)}`;
  formatFrom = (v) => Number(v);
}

class CustomFormatRerenderState {
  @tracked counter = 0;
  setCalls = 0;
  formatTo = (v) => `value: ${Math.round(v)}`;
  formatFrom = (v) => Number(String(v).replace('value: ', ''));
  onSet = () => {
    this.setCalls += 1;
  };
}

class FailState {
  @tracked counter = 0;
}

function handlePositions() {
  return Array.from(document.querySelectorAll('.noUi-handle')).map((h) =>
    h.getAttribute('aria-valuenow'),
  );
}

module('Integration | Component | range-slider', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders the noUiSlider DOM', async function (assert) {
    await render(<template><RangeSlider @start={{20}} /></template>);
    assert.dom('.noUi-base').exists();
    assert.dom('.noUi-handle').exists({ count: 1 });
  });

  test('it accepts a range and renders two handles', async function (assert) {
    await render(
      <template>
        <RangeSlider
          @start={{array 10 90}}
          @range={{hash min=0 max=100}}
          @connect={{true}}
        />
      </template>,
    );
    assert.dom('.noUi-handle').exists({ count: 2 });
    assert.dom('.noUi-connect').exists();
  });

  test('it reflects updates to @start without re-creating the slider', async function (assert) {
    const state = new State();
    await render(<template><RangeSlider @start={{state.value}} /></template>);

    const handle = document.querySelector('.noUi-handle');
    state.value = 80;
    await settled();
    assert
      .dom('.noUi-handle')
      .exists('handle still present after value update');
    assert.strictEqual(
      document.querySelector('.noUi-handle'),
      handle,
      'same handle element — slider not re-created',
    );
  });

  test('it sets disabled attribute when @disabled is true', async function (assert) {
    await render(
      <template><RangeSlider @start={{20}} @disabled={{true}} /></template>,
    );
    assert.dom('[disabled]').exists();
  });

  test('it omits disabled attribute when @disabled is false', async function (assert) {
    await render(
      <template><RangeSlider @start={{20}} @disabled={{false}} /></template>,
    );
    assert.dom('[disabled]').doesNotExist();
  });

  // Regression: a two-handle @start whose array identity changes on every
  // re-render must not reset the slider to its initial @start value. The
  // modifier compares against the slider's current value, not the arg ref.
  test('two-handle slider keeps position when an unrelated arg changes', async function (assert) {
    const state = new TwoHandleState();
    await render(
      <template>
        <div data-counter={{state.counter}}>
          <RangeSlider @start={{state.value}} @range={{hash min=0 max=100}} />
        </div>
      </template>,
    );

    const initial = handlePositions();
    assert.strictEqual(initial.length, 2, 'two handles rendered');

    // Force a re-render of the template without changing @start. The modifier
    // should not call slider.set() because the value already matches.
    state.counter = state.counter + 1;
    await settled();

    assert.deepEqual(
      handlePositions(),
      initial,
      'handle positions unchanged after unrelated re-render',
    );

    // And a real @start change should still move handles.
    state.value = [40, 60];
    await settled();

    assert.notDeepEqual(
      handlePositions(),
      initial,
      'handle positions updated when @start actually changes',
    );
  });

  // Regression: @formatTo / @formatFrom synthesised into a `format` option
  // must rebuild on @update so changing the formatter is reflected in the
  // slider's output. Tooltip is the easiest observable.
  test('it picks up @formatTo changes after the initial render', async function (assert) {
    const state = new FormatState();
    await render(
      <template>
        <RangeSlider
          @start={{state.value}}
          @range={{hash min=0 max=100}}
          @tooltips={{true}}
          @formatTo={{state.formatter}}
          @formatFrom={{state.formatFrom}}
        />
      </template>,
    );

    const initialTooltip = document
      .querySelector('.noUi-tooltip')
      ?.textContent?.trim();
    assert.strictEqual(
      initialTooltip,
      'A50',
      'tooltip uses the initial formatter',
    );

    state.formatter = (v) => `B${Math.round(v)}`;
    await settled();

    const nextTooltip = document
      .querySelector('.noUi-tooltip')
      ?.textContent?.trim();
    assert.strictEqual(
      nextTooltip,
      'B50',
      'tooltip reflects the updated formatter',
    );
  });

  // Regression: a non-numeric @formatTo would make slider.get() return
  // strings like "value: 50". Comparing Number("value: 50") to a numeric
  // start always yielded NaN !== number, so the modifier kept calling
  // slider.set() on every unrelated re-render — re-firing set/update
  // callbacks. Comparing against the unencoded value (slider.get(true))
  // avoids that.
  test('custom @formatTo does not retrigger slider.set on re-render', async function (assert) {
    const state = new CustomFormatRerenderState();
    await render(
      <template>
        <div data-counter={{state.counter}}>
          <RangeSlider
            @start={{50}}
            @range={{hash min=0 max=100}}
            @formatTo={{state.formatTo}}
            @formatFrom={{state.formatFrom}}
            @onSet={{state.onSet}}
          />
        </div>
      </template>,
    );

    // queueMicrotask defers the initial onSet from noUiSlider create();
    // drain it before snapshotting the count.
    await new Promise((resolve) => setTimeout(resolve, 0));
    const baseline = state.setCalls;

    state.counter = state.counter + 1;
    await settled();
    await new Promise((resolve) => setTimeout(resolve, 0));

    state.counter = state.counter + 1;
    await settled();
    await new Promise((resolve) => setTimeout(resolve, 0));

    assert.strictEqual(
      state.setCalls,
      baseline,
      'onSet not re-fired across unrelated re-renders with a non-numeric formatter',
    );
  });

  // Regression: if noUiSlider.create throws (bad options), the modifier must
  // not retry on every subsequent render. It warns once and stays inert.
  test('it does not retry setup after noUiSlider.create throws', async function (assert) {
    const state = new FailState();
    const original = console.warn;
    let warnings = 0;
    console.warn = function (...args) {
      if (
        typeof args[0] === 'string' &&
        args[0].includes('[ember-cli-nouislider]')
      ) {
        warnings += 1;
      }
    };

    try {
      // Omitting @start makes noUiSlider throw at create time
      // ("'start' is required"), which the modifier should catch.
      await render(
        <template>
          <div data-counter={{state.counter}}>
            <RangeSlider @range={{hash min=0 max=100}} />
          </div>
        </template>,
      );

      const afterFirst = warnings;
      assert.ok(afterFirst >= 1, 'first render warned at least once');

      state.counter = state.counter + 1;
      await settled();
      state.counter = state.counter + 1;
      await settled();

      assert.strictEqual(
        warnings,
        afterFirst,
        'no additional warnings on re-renders — setup not retried',
      );
    } finally {
      console.warn = original;
    }
  });
});
