$(document).ready ->

    read_data = (target) ->
        $.ajax
            url: target
            type: 'GET'
            dataType: 'text'
            cache: false
            error: (jqXHR, textStatus, errorThrown) ->
                $("#{holder}").text "Error: #{error}"
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
            if $("#{holder} p").length > 7
                $("#{holder} p:first-child").hide('slow', -> $(this).remove())

    id = 0

    $("#start").click ->
        read_data('data/test')
        id = setInterval ( ->
            read_data('data/test')
        ), 3000

    $("#stop").click -> clearInterval(id)
