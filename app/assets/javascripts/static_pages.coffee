# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $('#front-nav').on 'mouseenter', 'li a', ->
    $(@).animate
      opacity:'1'
    ,"slow"
  .on "mouseleave", 'li a', ->
    $(@).animate
      opacity:'0'
    ,"slow"

  $('#sections > div').each (i, sec) ->
    link = $("a[href='##{sec.id}']")
    $(sec).scrollspy
      min: $(sec).position().top + 0
      max: $(sec).position().top + $(sec).height() - 0
      onEnter: (ele, pos) ->
        link.trigger('mouseenter')
        console.log "Enter #{ele.id}"
      onLeave: (ele, pos) ->
        link.trigger('mouseleave')
        console.log "Leave #{ele.id}"

