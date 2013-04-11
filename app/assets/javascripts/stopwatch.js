//= require underscore.inflection/lib/underscore.js
//= require underscore.inflection/src/underscore.inflection.js

(function($)
{
  /**
   * Convert a time into a humanized format
   *
   * For example...
   *
   *     1060  => 17 minutes and 40 seconds
   *     100   => 1 minute and 40 seconds
   *     10053 => 2 hours, 47 minutes and 33 seconds
   *
   * @param  {Integer} seconds The total number of seconds
   * @return {String}          A
   */
  var humanize_time = function(seconds)
  {
    var increments = [[60, 'second'], [60, 'minute'], [10000, 'hour']]

    return $.map(increments, function(increment)
    {
      if (seconds <= 0) return;

      remains = seconds % increment[0]
      seconds = Math.floor(seconds / increment[0]);

      if (remains > 0)
      {
        return remains + " " + _.pluralize(increment[1], remains)
      }
    }).reverse().join(', ').replace(/,\s([^,]+)$/, ' and $1');
  }

  /**
   * Replace the contents of an element every second with an incremented,
   * humanized time. If the data-stopwatch attribute is set to an initial
   * seconds value the stopwatch will start from that
   *
   * @return {[type]} [description]
   */
  $.fn.stopwatch = function()
  {
    element   = this
    startTime = this.data('stopwatch') + 1 || 1

    setInterval(function()
    {
      element.text(humanize_time(startTime++))
    }, 1000)
  };

}(jQuery))
