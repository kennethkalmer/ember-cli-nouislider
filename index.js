/* jshint node: true */
'use strict';

module.exports = {
  name: 'ember-cli-nouislider',

  included: function(app) {
    this._super.included(app);

    app.import(app.bowerDirectory + '/nouislider/distribute/jquery.nouislider.min.js');
    app.import(app.bowerDirectory + '/nouislider/distribute/jquery.nouislider.min.css');
  }
};
