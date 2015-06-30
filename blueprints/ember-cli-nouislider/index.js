module.exports = {
  normalizeEntityName: function() {}, // no-op since we're just adding dependencies

  afterInstall: function(options) {
    return this.addBowerPackageToProject('nouislider', '^8.0.1'); // is a promise
  }
};
