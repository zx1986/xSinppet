(function() {

  $(document).ready(function() {
    var id, read_data, update_data;
    read_data = function(target) {
      return $.ajax({
        url: target,
        type: 'GET',
        dataType: 'text',
        cache: false,
        error: function(jqXHR, textStatus, errorThrown) {
          return console.log(textStatus);
        },
        success: function(data, textStatus, jqXHR) {
          return update_data(data, '.content');
        }
      });
    };
    update_data = function(data, holder) {
      var delay_time, i, items, _results;
      delay_time = 0;
      items = data.split('\n');
      $(items).each(function(item_num, item_value) {
        var item;
        if (item_value) {
          item = "<p style='display:none'>" + item_value + "</p>";
          $("" + holder).append($(item).delay(delay_time).show('normal'));
          return delay_time = delay_time + 1000;
        }
      });
      if ($("" + holder + " p").length > 20) {
        i = 1;
        _results = [];
        while (i <= $("" + holder + " p").length - 20) {
          $("" + holder + " p:nth-child(" + i + ")").hide('slow', function() {
            return $(this).remove();
          });
          _results.push(i++);
        }
        return _results;
      }
    };
    id = 0;
    $("#start").click(function() {
      read_data('data/test');
      return id = setInterval((function() {
        return read_data('data/test');
      }), 5000);
    });
    return $("#stop").click(function() {
      return clearInterval(id);
    });
  });

}).call(this);
