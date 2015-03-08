import {
  moduleForComponent,
  test
} from 'ember-qunit';

moduleForComponent('range-slider', {
  // specify the other units that are required for this test
  // needs: ['component:foo', 'helper:bar']
});

test('it renders', function(assert) {
  assert.expect(2);

  // creates the component instance
  var component = this.subject();
  assert.equal(component._state, 'preRender');

  // renders the component to the page
  this.render();
  assert.equal(component._state, 'inDOM');
});

test('it added a slider', function(assert) {
  assert.expect(1);

  // create and render the component
  var component = this.subject();
  this.render();

  assert.ok(!this.$().empty(), "component is not empty");
});
