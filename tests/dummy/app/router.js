import Ember from 'ember';
import config from './config/environment';

const Router = Ember.Router.extend({
  location: config.locationType,
  rootURL: config.rootURL
});

Router.map(function() {
  this.route('download');
  this.route('component');
  this.route('options');
  this.route('events');
});

export default Router;
