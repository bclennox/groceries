import DS from 'ember-data';

export default DS.Model.extend({
  date: DS.attr('date'),
  people: DS.hasMany('people'),
  items: DS.hasMany('items')
});
