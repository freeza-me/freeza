#= require jquery
#= require jquery_ujs
#= require turbolinks
#= require_tree .

jQuery ($)->

  $('.close').on 'click', ->
    $(@).parents('.notice, .alert').slideUp()
