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
                $("#{holder}").append "<p style='display:none'>#{item_value}</p>"
                $("#{holder} p:last").delay(delay_time).show('slow')
                delay_time = delay_time + 1000
                if $("#{holder} p").length > 3
                    $("#{holder} p:first").delay(delay_time).hide(5000).remove()
                    console.dir(this)

    show_error = (error, holder) ->
        $("#{holder}").text "Error: #{error}"

    setInterval ( ->
        read_data('data/test')
    ), 5000
