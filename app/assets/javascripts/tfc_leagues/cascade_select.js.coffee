$ ->
  $('select[data-select-cascade="true"]').each (index, item) =>
    $(item).bind "DOMSubtreeModified", ->
      next_item = $("##{$(item).attr('data-select-cascade-next-item')}")
      next_item.html('<option value="0">--</option>')

  $('select[data-select-cascade="true"]').change ->
    next_item = $("##{$(this).attr('data-select-cascade-next-item')}")
    loader_div = $("##{$(next_item).attr('id')}_loading")
    loader_div.show()
    $.ajax $(this).attr('data-select-cascade-url'),
        type: 'GET'
        data:
          id: $(this).val()
#        before_send: ->
#          loader_div.show()
        error: (jqXHR, textStatus, errorThrown) ->
            loader_div.hide()
        success: (data, textStatus, jqXHR) ->
            next_item.html(data)
            loader_div.hide()
