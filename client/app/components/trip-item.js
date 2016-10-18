import Ember from 'ember';

export default Ember.Component.extend({
  store: Ember.inject.service(),

  actions: {
    destroy() {
      this.get('store').findRecord('item', this.get('item').get('id'), { backgroundReload: false }).then(function (item){
        item.destroyRecord();
      });
    }
  }
});
