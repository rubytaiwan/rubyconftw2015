# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $('#front-nav').on 'mouseenter', 'li', ->
    $(@).children().addClass( "active" )
  .on "mouseleave", 'li', ->
    $(@).children().removeClass( "active" )
    
  $.event.special.scrollstop.latency = 700
  section_dims = []
  $('#sections > div').each (i, sec) ->
    max = parseInt($(sec).position().top + $(sec).height() + 0)
    section_dims.push max
  $(window).on 'scrollstop', ->
    stop = $(@).scrollTop()
    $('#front-nav li > a').removeClass( "active" )
    idx = 0
    $.each section_dims, (i, sec) ->
      idx = i + 1 if stop > sec
      0
    $("#front-nav li:nth-child(#{idx + 1}) > a").addClass( "active")
  $(window).trigger 'scrollstop'

initialize = ->
  myLatlng = new (google.maps.LatLng)(25.041384, 121.611353)
  mapOptions = 
    zoom: 18
    center: myLatlng
    scrollwheel: false
  map = new (google.maps.Map)(document.getElementById('venue'), mapOptions)
  marker = new (google.maps.Marker)(
    position: myLatlng
    map: map)
  return
google.maps.event.addDomListener window, 'load', initialize