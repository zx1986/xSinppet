(function() {

  $(document).ready(function() {
    var read_data, show_error, update_data;
    read_data = function(target) {
      return $.ajax({
        url: "" + target,
        type: 'GET',
        dataType: 'text',
        cache: false,
        error: function(jqXHR, textStatus, errorThrown) {},
        success: function(data, textStatus, jqXHR) {}
      });
    };
    update_data = function(data, holder) {};
    show_error = function(error, holder) {
      return $("" + holder).text("Error: " + error);
    };
    return show_error("hello", ".debug");
  });

}).call(this);
