'use strict';

module.exports = async function () {
  return {
    usePnpm: true,
    scenarios: [
      {
        name: 'ember-release',
        npm: {
          devDependencies: {
            'ember-source': '~7.0.0',
          },
        },
      },
    ],
  };
};
