(function() {
  function vendorModule() {
    'use strict';

    return { 'default': self['noUiSlider'] };
  }

  define('noUiSlider', [], vendorModule);
})();
