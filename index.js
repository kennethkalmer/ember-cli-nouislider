/* jshint node: true */
'use strict';

module.exports = {
  name: 'ember-cli-nouislider',

  included: function(app) {
    this._super.included(app);
    if (!process.env.EMBER_CLI_FASTBOOT) {
      // In nested addons, app.bowerDirectory might not be available
      var bowerDirectory = app.bowerDirectory || 'bower_components';
      // In ember-cli < 2.7, this.import is not available, so fall back to use app.import
      var importShim = typeof this.import !== 'undefined' ? this : app;

      importShim.import({
        development: bowerDirectory + '/nouislider/distribute/nouislider.js',
        production: bowerDirectory + '/nouislider/distribute/nouislider.min.js'
      });
      importShim.import(bowerDirectory + '/nouislider/distribute/nouislider.min.css');

      importShim.import('vendor/nouislider/shim.js', {
        exports: { 'noUiSlider': ['default'] }
      });
    }
  }
};
