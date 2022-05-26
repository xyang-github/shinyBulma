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
  	}

    // Update size
  	if (data.hasOwnProperty('size')) {
  		var sizes = "is-normal is-small is-medium is-large";
  		$(el).removeClass(sizes);
  		this.setValue(el, data.size);
  	}

    // Update state
  	if (data.hasOwnProperty('state')) {
  		var states = "is-hovered is-focused is-active is-loading";
  		$(el).removeClass(states);
  		this.setValue(el, data.state);
  	}

  	// Update spacing
  	if (data.hasOwnProperty('spacing')) {
  		var spaces = "m-0 m-1 m-2 m-3 m-4 m-5 m-6 m-auto mt-0 mt-1 mt-2 mt-3 mt-4 mt-5 mt-6 mt-auto mr-0  mr-1 mr-2 mr-3 mr-4 mr-5 mr-6 mr-auto mb-0 mb-1 mb-2 mb-3 mb-4 mb-5 mb-6 mb-auto  ml-0 ml-1 ml-2 ml-3 ml-4 ml-5 ml-6 ml-auto mx-0  mx-1 mx-2  mx-3  mx-4  mx-5  mx-6  mx-auto  my-0 my-1 my-2 my-3 my-4 my-5 my-6 my-auto p-0 p-1 p-2 p-3 p-4 p-5 p-6 p-auto pt-0 pt-1 pt-2 pt-3 pt-4 pt-5 pt-6 pt-auto pr-0  pr-1 pr-2 pr-3 pr-4 pr-5 pr-6 pr-auto pb-0 pb-1 pb-2 pb-3 pb-4 pb-5 pb-6 pb-auto  pl-0 pl-1 pl-2 pl-3 pl-4 pl-5 pl-6 pl-auto px-0 px-1  px-2  px-3  px-4  px-5  px-6  px-auto  py-0 py-1 py-2 py-3 py-4 py-5 py-6 py-auto";
  		$(el).removeClass(spaces);
  		this.setValue(el, data.spacing);
  	}

  	// Update responsive size
  	if (data.hasOwnProperty('responsive')) {
  		if (data.responsive == true) {
  			$(el).addClass("is-responsive");
  		} else {
  			$(el).removeClass("is-responsive");
  		};
  	}

  	// Update full-width
  	if (data.hasOwnProperty('fullwidth')) {
  		if (data.fullwidth == true) {
  			$(el).addClass("is-fullwidth");
  		} else {
  			$(el).removeClass("is-fullwidth");
  		};
  	}

    // Update outlined appearance
  	if (data.hasOwnProperty('outlined')) {
  		if (data.outlined == true) {
  			$(el).addClass("is-outlined");
  		} else {
  			$(el).removeClass("is-outlined");
  		};
  	}

  	// Update inverted appearance
  	if (data.hasOwnProperty('inverted')) {
  		if (data.inverted == true) {
  			$(el).addClass("is-inverted");
  		} else {
  			$(el).removeClass("is-inverted");
  		};
  	}

  	// Update rounded corners
  	if (data.hasOwnProperty('rounded')) {
  		if (data.rounded == true) {
  			$(el).addClass("is-rounded");
  		} else {
  			$(el).removeClass("is-rounded");
  		};
  	}

  	// Update visibility
  	if (data.hasOwnProperty('hidden')) {
  		if (data.hidden == true) {
  			$(el).addClass("is-hidden");
  		} else {
  			$(el).removeClass("is-hidden");
  		};
  	}

  	// Update disable status
  	if (data.hasOwnProperty('disabled')) {
  		if (data.disabled == true) {
  			$(el).prop('disabled', true);
  		} else {
  			$(el).prop('disabled', false);
  		};
  	}
  },

  unsubscribe: function(el) {
    $(el).off(".bulm-btn");
  }
})

Shiny.inputBindings.register(binding);
