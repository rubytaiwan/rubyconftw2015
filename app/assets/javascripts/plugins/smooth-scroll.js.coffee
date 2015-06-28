$(document).ready () ->
  $(document).on 'click', '.scroll', (e) ->
    e.preventDefault()
    $('html, body').animate
      scrollTop: $(@.hash).offset().top, 1200

