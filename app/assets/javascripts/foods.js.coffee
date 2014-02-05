jQuery ($)->

  $('.deadline-preset').on 'click', ->
    date = $(@).data('deadline')
    [y, m, d] = date.split('-')
    $.each { "1i": y, "2i": m, "3i": d }, (key, val)=>
      $(@).parents('.field').find("select[id$=#{key}]").val(parseInt(val))
    false
