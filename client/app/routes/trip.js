import Ember from 'ember';

export default Ember.Route.extend({
  model(params) {
    return this.get('store').findRecord('trip', params.trip_id);
  },

  renderTemplate() {
    this.render("masthead", { outlet: "masthead", into: "application" });
    this.render();
  }
});
