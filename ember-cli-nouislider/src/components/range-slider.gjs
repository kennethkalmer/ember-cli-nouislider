import Component from '@glimmer/component';
import RangeSliderModifier from '../modifiers/range-slider.js';

export default class RangeSlider extends Component {
  get disabled() {
    return this.args.disabled ? true : undefined;
  }

  <template>
    <div
      disabled={{this.disabled}}
      ...attributes
      {{RangeSliderModifier
        start=@start
        step=@step
        margin=@margin
        padding=@padding
        limit=@limit
        range=@range
        min=@min
        max=@max
        connect=@connect
        orientation=@orientation
        direction=@direction
        behaviour=@behaviour
        animate=@animate
        snap=@snap
        pips=@pips
        format=@format
        formatTo=@formatTo
        formatFrom=@formatFrom
        tooltips=@tooltips
        keyboardSupport=@keyboardSupport
        cssPrefix=@cssPrefix
        cssClasses=@cssClasses
        onChange=@onChange
        onSet=@onSet
        onSlide=@onSlide
        onUpdate=@onUpdate
        onStart=@onStart
        onEnd=@onEnd
      }}
    >
      {{yield}}
    </div>
  </template>
}
