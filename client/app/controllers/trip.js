import Ember from 'ember';

export default Ember.Controller.extend({
  peopleSort: ['name'],
  people: Ember.computed.sort('model.people', 'peopleSort'),

  itemsSort: ['numericId:desc'],
  items: Ember.computed.sort('model.items', 'itemsSort')
});
