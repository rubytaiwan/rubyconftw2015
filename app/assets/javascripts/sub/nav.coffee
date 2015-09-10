$(document).ready ->
  # $('[data-toggle="tooltip"]').tooltip()
  idx = 0
  update_active_nav = ->
    $('.nav-active').removeClass 'nav-active'
    $("#front-nav .inner-nav:nth-child(#{idx + 1}) > .enlarge").addClass 'nav-active'
  $('#front-nav').on 'mouseenter', '.nav-line',  ->
    $('.nav-active').removeClass 'nav-active'
    $(@).next().addClass 'nav-active'
  .on 'mouseleave','.nav-line', update_active_nav
  .on 'click','.nav-line', ->
    idx = -1

  $(window).on 'scrollstop', ->
    stop = $(@).scrollTop()
    $.each $('#sections .section'), (i, sec) ->
      sectop = parseInt $(sec).offset().top
      if stop >= sectop
        idx = i
    if jQuery(window).height() + jQuery(document).scrollTop() == jQuery(document).height()
      idx = jQuery('.section').length - 1
    update_active_nav()
  $(window).trigger 'scrollstop'
