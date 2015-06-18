# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $('#front-nav').on 'mouseenter', 'li a', ->
    $(@).animate
      opacity: 1
    , 100
  .on "mouseleave", 'li a', ->
    $(@).animate
      opacity: 0
    , 100

  $.event.special.scrollstop.latency = 700
  section_dims = []
  $('#sections > div').each (i, sec) ->
    max = parseInt($(sec).position().top + $(sec).height() - 0)
    section_dims.push max
  $(window).on 'scrollstop', ->
    stop = $(@).scrollTop()
    $('#front-nav li > a').animate
      opacity: 0
    , 1
    idx = 0
    $.each section_dims, (i, sec) ->
      idx = i + 1 if stop > sec
      0
    $("#front-nav li:nth-child(#{idx + 1}) > a").animate
      opacity: 1
    , 1
  $(window).trigger 'scrollstop'

    #  $('#sections > div').each (i, sec) ->
    #    link = $("a[href='##{sec.id}']")
    #    $(sec).scrollspy
    #      min: $(sec).position().top + 0
    #      max: $(sec).position().top + $(sec).height() - 0
    #      onEnter: (ele, pos) ->
    #        link.trigger('mouseenter')
    #      onLeave: (ele, pos) ->
    #        link.trigger('mouseleave')
