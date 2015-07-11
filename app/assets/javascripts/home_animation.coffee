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
  _easeing = 'cubic-bezier(0.64, -0.22, 0.45, 1.72)'

  # Animate Helper
  animate = (object, options, time) ->
    return ->
      object.transition(options, time, _easeing)

  parallelAnimation = (animations, delay) ->
    delay ||= 200
    for animation, index in animations
      setTimeout(animation, index * 200)

  # Build animation queue
  parallelAnimation([
    animate($airplan, {scale: 1}, 1000),
    animate($logo, {x: '-50%', y: '-50%', opacity: 1}, 1000),
    animate($ruby, {scale: 1}, 1000),
    animate($cloud1, {scale: 1}, 1000),
    animate($cloud3, {scale: 1}, 1000),
    animate($info, {y: '0%', opacity: 1}, 1000),
    animate($registration, {y: '0%', opacity: 1}, 1000),
    animate($mountain, {y: '0%'}, 1000),
    animate($tube, {y: '0%'}, 1500),
    animate($dwarf, {scale: 1, delay: 1500}, 1000)
  ])
