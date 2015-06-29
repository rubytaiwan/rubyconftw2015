# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $('#front-nav').on 'mouseenter', '.nav-line',  ->
    $('#front-nav .inner-nav > a').next().removeClass "active"
    $(@).next().addClass "active"
  .on "mouseleave",'.nav-line',  ->
    $(@).next().removeClass "active"
  $.event.special.scrollstop.latency = 700
  section_dims = []
  $('#sections .section').each (i, sec) ->
    min = parseInt $(sec).position().top
    section_dims.push min
  console.dir section_dims
  $(window).on 'scrollstop', ->
    stop = $(@).scrollTop()
    $('#front-nav .inner-nav > a').next().removeClass "active"
    idx = 0
    middletop = $(window).scrollTop() + $(window).innerHeight() / 2
    $.each section_dims, (i, sectop) ->
      idx = i if middletop > sectop
    $("#front-nav .inner-nav:nth-child(#{idx + 1}) > a:nth-child(2)").addClass "active"
  $(window).trigger 'scrollstop'
  
  # $('#front-nav').on 'mouseenter', 'li', ->
  #   $(@).find('a').addClass "active"
  # .on "mouseleave", 'li', ->
  #   $(@).find('a').removeClass "active"
  # $.event.special.scrollstop.latency = 700
  # section_dims = []
  # $('#sections .section').each (i, sec) ->
  #   min = parseInt $(sec).position().top
  #   section_dims.push min
  # console.dir section_dims
  # $(window).on 'scrollstop', ->
  #   stop = $(@).scrollTop()
  #   $('#front-nav li > a').removeClass "active"
  #   idx = 0
  #   middletop = $(window).scrollTop() + $(window).innerHeight() / 2
  #   $.each section_dims, (i, sectop) ->
  #     idx = i if middletop > sectop
  #   $("#front-nav li:nth-child(#{idx + 1}) > a").addClass "active"
  # $(window).trigger 'scrollstop'

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
