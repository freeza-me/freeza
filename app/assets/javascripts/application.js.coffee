#= require jquery
#= require jquery.turbolinks
#= require jquery_ujs
#= require turbolinks
#= require_tree .

jQuery ($)->

  $('.close').on 'click', ->
    $(@).parents('.notice, .alert').slideUp()
