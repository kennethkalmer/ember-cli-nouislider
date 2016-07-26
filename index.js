/* jshint node: true */
'use strict';

module.exports = {
  name: 'ember-cli-nouislider',

  included: function(app) {
    this._super.included(app);
    if (!process.env.EMBER_CLI_FASTBOOT) {
      var bowerDirectory = app.bowerDirectory || 'bower_components';

      this.import({
        development: bowerDirectory + '/nouislider/distribute/nouislider.js',
        production: bowerDirectory + '/nouislider/distribute/nouislider.min.js'
      });
      this.import(bowerDirectory + '/nouislider/distribute/nouislider.min.css');

      this.import('vendor/nouislider/shim.js', {
        exports: { 'noUiSlider': ['default'] }
      });
    }
  }
};
