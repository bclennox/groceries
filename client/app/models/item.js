import Ember from 'ember';
import DS from 'ember-data';

export default DS.Model.extend({
  trip: DS.belongsTo('trip'),
  person: DS.belongsTo('person'),
  value: DS.attr('string'),
  editable: DS.attr('boolean'),

  numericId: Ember.computed('id', function (){
    return +this.get('id');
  })
});
