# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $('#front-nav').on 'mouseenter', 'li', ->
    $(@).find('a').addClass "active"
  .on "mouseleave", 'li', ->
    $(@).find('a').removeClass "active"

  $.event.special.scrollstop.latency = 700
  section_dims = []
  $('#sections .section').each (i, sec) ->
    min = parseInt $(sec).position().top
    section_dims.push min #[min, max]
  $(window).on 'scrollstop', ->
    stop = $(@).scrollTop()
    $('#front-nav li > a').removeClass "active"
    idx = 0
    middletop = $(window).scrollTop() + $(window).innerHeight() / 2
    $.each section_dims, (i, sectop) ->
      idx = i if middletop > sectop
    $("#front-nav li:nth-child(#{idx + 1}) > a").addClass "active"
  $(window).trigger 'scrollstop'
