$(document).ready ->
  $('#ruby-footer').animate({scale: 1}, 1000)
  $('.dwarf-group').on 'click', (e)->
    e.preventDefault()
    $('.staff-all').addClass( 'group-active' )
  $('.more-btn, .link-to-speaker').on 'click', (e) ->
    e.preventDefault()
    $('.speaker-info').removeClass 'info-active'
    $($(e.target).attr('href')).addClass 'info-active'
  $(document).keyup (e) ->
    if e.keyCode == 27
      $('.info-active').removeClass 'info-active'
      $('.group-active').removeClass 'group-active'
  $('.close-info').on 'click', (e) ->
    e.preventDefault()
    tg = e.target
    $(tg).parents('.modal-box').removeClass $(tg).data('class2remove')

