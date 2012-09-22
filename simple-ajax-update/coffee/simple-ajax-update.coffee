$(document).ready ->

    read_data = (target) ->
        $.ajax
            url: "#{target}"
            type: 'GET'
            dataType: 'text'
            cache: false
            error: (jqXHR, textStatus, errorThrown) ->
            success: (data, textStatus, jqXHR) ->

    update_data = (data, holder) ->

    show_error = (error, holder) ->
        $("#{holder}").text "Error: #{error}"

    # setInterval read_data, 3000
    show_error  "hello", ".debug"
