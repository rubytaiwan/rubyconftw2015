group = $('.speaker-sortable').sortable
  containerSelector: '.speaker-sortable'
  itemSelector: '.col-sm-4'
  nested: false
  handle: '.handle'
  onDrop: (item, container, _super) ->
    data = $('.speaker-sortable').find('li').map ->
      $(@).data('id')
    .get()
    $(container.target).find('speaker-container').map
    $.ajax
      url: $(container.target).data 'resort-action'
      data:
        ids: data
      type: 'PUT'
    _super(item, container)
