$(document).ready ->
  $('#ruby-footer').animate({scale: 1}, 1000)
  $('.dwarf-group').on 'mouseenter', ->
    $('.staff-all').addClass('staff-all-fade-in')
    $('.staff-all').css
      top: '0',
      left: '0',
      transform: 'rotate(0deg)',
      zIndex: '3'
  $('#staff-close').on 'click', ->
    $('.staff-all').removeClass('staff-all-fade-in')
    $('.staff-all').addClass('staff-all-fade-out')
    $('.staff-all').css
      top: '-100%',
      left: '100%',
      transform: 'rotate(15deg)',
      zIndex: '0'
