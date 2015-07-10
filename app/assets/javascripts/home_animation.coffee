$(document).ready ->

  # Variables
  $logo = $("#logo")
  $ruby = $("#ruby")
  $airplan = $("#airplan")
  $cloud1 = $("#cloud1")
  $cloud3 = $("#cloud3")
  $info = $("#info")
  $registration = $("#registration")
  $mountain = $("#mountain")
  $tube = $("#tub-repeat")
  $dwarf = $("#dwarf")

  # Easeing Function
  _easeing = 'cubic-bezier(0.82, 0.03, 0.58, 1)'

  # Animate Helper
  animate = (object, options, time) ->
    return (next) ->
      object.transition(options, time, _easeing, next)

  # Build animation queue
  $(this).delay(1000).queue([
    animate($airplan, {scale: 1}, 500),
    animate($logo, {x: '-50%', y: '-50%', opacity: 1}, 1000),
    animate($ruby, {scale: 1}, 1000),
    animate($cloud1, {scale: 1}, 500),
    animate($cloud3, {scale: 1}, 750),
    animate($info, {y: '0%', opacity: 1}, 500),
    animate($registration, {y: '0%', opacity: 1}, 500),
    animate($mountain, {y: '0%'}, 1000),
    animate($tube, {y: '0%'}, 1500),
    animate($dwarf, {scale: 1, delay: 1000}, 500)
  ])
