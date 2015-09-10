# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  selector = jQuery('.polymorphic-selector select')
  options = jQuery('.polymorphic-option')
  options.each (i,ele) ->
    e = jQuery(ele)
    sel = e.find('select')
    sel.attr('name_',sel.attr('name'))
  update_polymorphic_selection = ->
    options.each (i,ele) ->
      e = jQuery(ele)
      e.hide()
      e.find('select').removeAttr('name')
    selected = selector.val()
    $selected = jQuery("\##{selected}")
    $selected.show()
    name = $selected.find('select').attr('name_')
    $selected.find('select').attr('name',name)
  selector.on 'change', update_polymorphic_selection
  update_polymorphic_selection()
