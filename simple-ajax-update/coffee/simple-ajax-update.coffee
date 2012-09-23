$(document).ready ->

    read_data = (target) ->
        $.ajax
            url: target
            type: 'GET'
            dataType: 'text'
            cache: false
            error: (jqXHR, textStatus, errorThrown) ->
                show_error textStatus, '.debug'
            success: (data, textStatus, jqXHR) ->
                update_data data, '.content'

    update_data = (data, holder) ->
        delay_time = 0
        items = data.split('\n')

        $(items).each (item_num, item_value) ->
            if item_value
                item = "<p style='display:none'>#{item_value}</p>"
                $("#{holder}").append $(item).delay(delay_time).show('slow')
                delay_time = delay_time + 1000
            $("#{holder} p:first").hide('slow', -> $(this).remove()) while $("#{holder} p").length > 5

    show_error = (error, holder) ->
        $("#{holder}").text "Error: #{error}"

    setInterval ( ->
        read_data('data/test')
    ), 5000
