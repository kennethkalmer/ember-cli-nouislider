'use strict';

const EmberApp = require('ember-cli/lib/broccoli/ember-app');
const { compatBuild } = require('@embroider/compat');
const { Webpack } = require('@embroider/webpack');

module.exports = function (defaults) {
  const app = new EmberApp(defaults, {
    autoImport: {
      watchDependencies: ['ember-cli-nouislider'],
    },
  });

  return compatBuild(app, Webpack, {
    staticInvokables: true,
    splitAtRoutes: [],
  });
};
