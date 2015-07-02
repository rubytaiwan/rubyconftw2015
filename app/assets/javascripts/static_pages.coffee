# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $('#front-nav').on 'mouseenter', '.nav-line',  ->
    $('#front-nav .inner-nav > a').next().removeClass 'active'
    $(@).next().addClass 'active'
  .on 'mouseleave','.nav-line',  ->
    $(@).next().removeClass 'active'
  $.event.special.scrollstop.latency = 100
  section_dims = []
  $('#sections .section').each (i, sec) ->
    min = parseInt $(sec).position().top
    section_dims.push min
  $(window).on 'scrollstop', ->
    stop = $(@).scrollTop()
    idx = 0
    middletop = $(window).scrollTop() + $(window).innerHeight() / 2
    $.each section_dims, (i, sectop) ->
      idx = i if middletop > sectop
    $('#front-nav .inner-nav > a').next().removeClass 'active'
    $("#front-nav .inner-nav:nth-child(#{idx + 1}) > .enlarge").addClass 'active'
  $(window).trigger 'scrollstop'
  reset = ->
    $('.dwarf-jump').removeClass('jump-active')
  $('.dwarf-jump').on 'click', ->
    $(@).addClass('jump-active')
    setTimeout(reset, 1000)

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
