var binding = new Shiny.InputBinding();

$.extend(binding, {

  find: function(scope) {
    return $(scope).find(".bulma-btn");
  },

  getValue: function(el) {
    return $(el).data("val") || 0
  },

  getType: function(el) {
    return "shiny.action"
  },

  subscribe: function(el, callback) {
    $(el).on('click.bulma-btn', function() {
      var $el = $(this);
      var val = $el.data("val") || 0;
      $el.data("val", val + 1);
      callback(false);
    })
  },

  receiveMessage: function(el, data) {
  	if (data.hasOwnProperty('text')) {
  		$(el).text(data.text)
  	}
  },

  unsubscribe: function(el) {
    $(el).off(".bulm-btn");
  }
})

Shiny.inputBindings.register(binding);
