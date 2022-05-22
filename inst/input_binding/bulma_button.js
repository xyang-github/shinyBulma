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

  setValue: function(el, value) {
    $(el).addClass(value);
  },

  receiveMessage: function(el, data) {

    // Update text
  	if (data.hasOwnProperty('text')) {
  		$(el).text(data.text);
  	}

    // Update color
  	if (data.hasOwnProperty('color')) {
  		var colors = "is-white is-light is-dark is-black is-text is-ghost is-primary is-link is-info is-success is-warning is-danger";
  		$(el).removeClass(colors);
  		this.setValue(el, data.color);
  		//$(el).addClass(data.color);
  	}

    // Update size
  	if (data.hasOwnProperty('size')) {
  		var sizes = "is-normal is-small is-medium is-large";
  		$(el).removeClass(sizes);
  		this.setValue(el, data.size);
  		//$(el).addClass(data.size);
  	}

    // Update state
  	if (data.hasOwnProperty('state')) {
  		var states = "is-hovered is-focused is-active is-loading";
  		$(el).removeClass(states);
  		this.setValue(el, data.state);
  		//$(el).addClass(data.state);
  	}

    // Update outlined appearance
  	if (data.hasOwnProperty('outlined')) {
  	  console.log(data.outlined);
  		if (data.outlined == true) {
  			$(el).addClass("is-outlined");
  		} else {
  			$(el).removeClass("is-outlined");
  		};
  	}
  },

  unsubscribe: function(el) {
    $(el).off(".bulm-btn");
  }
})

Shiny.inputBindings.register(binding);
