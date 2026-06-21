import Component from '@glimmer/component';
import RangeSliderModifier from '../modifiers/range-slider.js';
import { precompileTemplate } from '@ember/template-compilation';
import { setComponentTemplate } from '@ember/component';

class RangeSlider extends Component {
  get disabled() {
    return this.args.disabled ? true : undefined;
  }
  static {
    setComponentTemplate(precompileTemplate("<div disabled={{this.disabled}} ...attributes {{RangeSliderModifier start=@start step=@step margin=@margin padding=@padding limit=@limit range=@range min=@min max=@max connect=@connect orientation=@orientation direction=@direction behaviour=@behaviour animate=@animate snap=@snap pips=@pips format=@format formatTo=@formatTo formatFrom=@formatFrom tooltips=@tooltips keyboardSupport=@keyboardSupport cssPrefix=@cssPrefix cssClasses=@cssClasses onChange=@onChange onSet=@onSet onSlide=@onSlide onUpdate=@onUpdate onStart=@onStart onEnd=@onEnd}}>\n  {{yield}}\n</div>", {
      strictMode: true,
      scope: () => ({
        RangeSliderModifier
      })
    }), this);
  }
}

export { RangeSlider as default };
//# sourceMappingURL=range-slider.js.map
