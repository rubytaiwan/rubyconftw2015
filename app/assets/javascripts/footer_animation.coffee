$(document).ready ->
  $('#ruby-footer').animate({scale: 1}, 1000)
  $('.dwarf-group').on 'click', (e)->
    e.preventDefault()
    $('.staff-all').addClass( 'group-active' )
  $('.more-btn, .link-to-speaker').on 'click', (e) ->
    e.preventDefault()
    $('.speaker-info').removeClass 'info-active'
    $($(e.target).attr('href')).addClass 'info-active'
  $('.close-info').on 'click', (e) ->
    e.preventDefault()
    tg = e.target
    $(tg).parents('.modal-box').removeClass $(tg).data('class2remove')
  if window.location.hash != '' && $(window.location.hash).length > 0
    $('.more-btn[href=' + window.location.hash + ']').trigger 'click'
