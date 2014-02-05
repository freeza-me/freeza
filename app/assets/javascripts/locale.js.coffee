jQuery ($)->

  $('#set-locale').on 'change', ->
    $.post '/locale', { locale: $(@).val() }, ->
      location.reload()
