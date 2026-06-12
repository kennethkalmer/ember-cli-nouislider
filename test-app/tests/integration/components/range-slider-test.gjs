import { module, test } from 'qunit';
import { array, hash } from '@ember/helper';
import { render, settled } from '@ember/test-helpers';
import { tracked } from '@glimmer/tracking';
import { setupRenderingTest } from 'test-app/tests/helpers';
import RangeSlider from 'ember-cli-nouislider/components/range-slider';

class State {
  @tracked value = 20;
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
});
