module.exports = {
  normalizeEntityName: function() {}, // no-op since we're just adding dependencies

  afterInstall: function(options) {
    return this.addBowerPackageToProject('nouislider', '^7.0.10'); // is a promise
  }
};
