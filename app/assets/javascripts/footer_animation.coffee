$(document).ready ->
  $('#ruby-footer').animate({scale: 1}, 1000)
  $('.dwarf-group').on 'click', (e)->
    e.preventDefault()
    $('.staff-all').addClass( 'group-active' )

#  $('#staff-close').on 'click', (e)->
#    e.preventDefault()
#    $('.staff-all').removeClass( 'group-active' )

  $('.more-btn, .link-to-speaker').on 'click', (e) ->
    e.preventDefault()
    $('.speaker-info').removeClass 'info-active'
    $($(e.target).attr('href')).addClass 'info-active'
  $('.close-info').on 'click', (e) ->
    e.preventDefault()
    tg = e.target
    console.log $(tg).parents('.modal-box').length
    console.log $(tg).attr('class')
    $(tg).parents('.modal-box').removeClass $(tg).data('class2remove')
