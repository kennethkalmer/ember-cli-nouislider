/* jshint node: true */
'use strict';

module.exports = {
  name: 'ember-cli-nouislider',

  included: function(app) {
    this._super.included(app);
    if(!process.env.EMBER_CLI_FASTBOOT) {
      app.import({
        development: app.bowerDirectory + '/nouislider/distribute/nouislider.js',
        production:  app.bowerDirectory + '/nouislider/distribute/nouislider.min.js'
      });
      app.import(app.bowerDirectory + '/nouislider/distribute/nouislider.min.css');

      app.import('vendor/nouislider/shim.js', {
        exports: { 'noUiSlider': ['default'] }
      });
    }
  }
};
