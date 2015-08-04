# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
methodToFixLayout =  ->
  viewportHeight = $(window).height()
  speakerIntroHeight = viewportHeight * 0.6
  $('.speaker-intro-scroll').css('height',speakerIntroHeight)
$(document).ready ->
  methodToFixLayout()
  $('[data-toggle="tooltip"]').tooltip()
  $('#tabs').tab()
  $('#front-nav').on 'mouseenter', '.nav-line',  ->
    $('#front-nav .inner-nav > a').next().removeClass 'nav-active'
    $(@).next().addClass 'nav-active'
  .on 'mouseleave','.nav-line',  ->
    $(@).next().removeClass 'nav-active'
  $(".fullNavOverlay ul li a").on 'mouseenter', ->
    $(@).next().removeClass 'nav-active'
    $(@).next().addClass 'nav-active'
  $(".fullNavOverlay ul li a").on 'mouseleave', ->
    $(@).removeClass 'test'

  $.event.special.scrollstop.latency = 100
  section_dims = []
  $('#sections .section').each (i, sec) ->
    min = parseInt $(sec).offset().top
    section_dims.push min
  $(window).on 'scrollstop', ->
    if $('#dwarf-scroll').css('display') == 'block'
      stop = $('#dwarf-scroll').offset().top + $('#dwarf-scroll').height() / 2
    else
      stop = $(@).scrollTop() + $(@).height() / 3
    idx = 0
    $.each $('#sections .section'), (i, sec) ->
      sectop = parseInt $(sec).offset().top
      if i > 0 && stop >= sectop
        idx = i
    $('#front-nav .inner-nav > a').next().removeClass 'nav-active'
    $(".fullNavOverlay ul li > a").removeClass 'test'
    $("#front-nav .inner-nav:nth-child(#{idx + 1}) > .enlarge").addClass 'nav-active'
    $(".fullNavOverlay ul li:nth-child(#{idx + 1}) a ").addClass 'test'
  $(window).trigger 'scrollstop'

  reset = ->
    $('.dwarf-jump').removeClass('jump-active')

  $('.dwarf-jump').on 'click', ->
    $(@).addClass('jump-active')
    setTimeout(reset, 1000)

  $(window).on 'scrollstop', ->
    $('#dwarf-scroll').removeClass('climb')

  $(window).on 'scroll', ->
    winHeight = $(window).height()
    x = $('.dwarf-jump').position().top
    $('#dwarf-scroll').addClass('climb')
    if x == 0
      $('#dwarf-scroll').addClass('dwarf-scroll-hide')
      $('.dwarf-jump').show()
    else if $(window).scrollTop() + $(window).height() == $(document).height()
      $('#dwarf-scroll').addClass('dwarf-scroll-hide')
      $('.dwarf-bottom').css('display','block')
    else
      $('#dwarf-scroll').removeClass('dwarf-scroll-hide')
      $('.dwarf-jump').hide()
      $('.dwarf-bottom').css('display','none')

  initialize = ->
    myLatlng = new (google.maps.LatLng)(25.041384, 121.611353)
    mapOptions =
      zoom: 18
      center: myLatlng
      scrollwheel: false
    map = new (google.maps.Map)(document.getElementById('venue-block'), mapOptions)
    marker = new (google.maps.Marker)(
      position: myLatlng
      map: map)
    return
  google.maps.event.addDomListener window, 'load', initialize

  $(window).on 'resize', methodToFixLayout
