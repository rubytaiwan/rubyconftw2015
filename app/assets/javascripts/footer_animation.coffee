$(document).ready ->
  $('#ruby-footer').animate({scale: 1}, 1000)
  $('.dwarf-group').on 'mouseenter', ->
    $('.staff-all').addClass( 'group-active' )
  $('#staff-close').on 'click', ->
    $('.staff-all').removeClass( 'group-active' )

  $('.more-btn').on 'click', (e) ->
    $($(e.target).attr('href')).addClass 'info-active'
  $('.info-close').on 'click', (e) ->
    $(e.target).parents('.speaker-info').removeClass 'info-active'
