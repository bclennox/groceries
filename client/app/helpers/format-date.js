import Ember from 'ember';

export function formatDate(datetime){
  var date = new Date(datetime);

  var dayNames = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
  var monthNames = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];

  var day = dayNames[date.getUTCDay()];
  var mday = date.getUTCDate();
  var month = monthNames[date.getUTCMonth()];
  var year = date.getUTCFullYear();

  return `${day} ${mday} ${month} ${year}`;
}

export default Ember.Helper.helper(formatDate);
