jQuery ($)->

  $('.new-food .button a').on 'click', ->
    $('.new-food .form').slideToggle()
    return false
