import Ember from 'ember';

export default Ember.Component.extend({
  store: Ember.inject.service(),

  actions: {
    personIdChanged(personId) {
      this.set('personId', personId);
    },

    add() {
      var self = this;
      self.get('store').findRecord('person', self.get('personId')).then(function (person){
        var item = self.get('store').createRecord('item', { trip: self.get('trip'), person: person, value: self.get('itemValue') });
        item.save();
        self.set('itemValue', null);
      });
    }
  }
});
