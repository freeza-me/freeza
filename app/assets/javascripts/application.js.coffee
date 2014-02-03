#= require jquery
#= require jquery_ujs
#= require turbolinks
#= require_tree .

jQuery ($)->

  $('.notice, .alert').delay(5000).slideUp()

  $('.close').on 'click', ->
    $(@).parents('.notice, .alert').slideUp()
