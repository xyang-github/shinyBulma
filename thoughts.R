UpdateBulmaBtn <- function(
	inputId,
	text = NULL,
	color = NULL,
    size = NULL,
	state = NULL,
	responsive = NULL,
	fullwidth = NULL,
	outlined = NULL,
	inverted = NULL,
	rounded = NULL,
	disabled = NULL,
	hidden = NULL,
	session = getDefaultReactiveDomain()
	) {

	if (!is.null(size)) {
		size <- match.arg(
			arg = size,
			choices = c("is-normal", "is-small", "is-medium", "is-large")
			)	
	}

	if (!is.null(color)) {
		  color <- match.arg(
			    arg = color,
			    choices = c("is-white", "is-light", "is-dark", "is-black", "is-text",
			                "is-ghost", "is-primary", "is-link", "is-info", "is-success",
			                "is-warning", "is-danger")
			  )
	}

	if (!is.null(state)) {
		  state <- match.arg(
			    arg = state,
			    choices = c("is-hovered", "is-focused", "is-active", "is-loading")
			  )
	}

	# Makes sure that the attribute contains either TRUE or FALSE if not NULL
	Is_Null <- function(attribute) {
		if (!is.null(attribute)) {
			attribute <- match.arg(
				arg = attribute,
				choices = c(TRUE, FALSE)
				)
		}
	}

	Is_Null(responsive)
	Is_Null(fullwidth)
	Is_Null(outlined)
	Is_Null(inverted)
	Is_Null(rounded)
	Is_Null(disabled)
	Is_Null(hidden)

	message <- dropNulls(
		list(
			text = text,
			color = color,
			size = size,
			state = state,
			responsive = responsive,
			fullwidth = fullwidth,
			outlined = outlined,
			inverted = inverted,
			rounded = rounded,
			disabled = disabled,
			hidden = hidden
			)
		)

	session$sendInputMessage(inputId, message)
}

# Have an array of color, size and state choices
# Remove class if it's in the color/size/state array
# Add new color option

# For arguments with boolean values:
# Need to evaluate each: 
# 	if true, then add CSS if not already exists
#	if false, then remove CSS

#JS
receiveMessage: function(el, data) {
	if (data.hasOwnProperty('text')) {
		$(el).text(data.text);
	}

	if (data.hasOwnProperty('color')) {
		var colors = "is-white is-light is-dark is-black is-text is-ghost is-primary is-link is-info is-success is-warning is-danger";
		$(el).removeClass(colors);
		$(el).addClass(data.color);
	}

	if (data.hasOwnProperty('size')) {
		var sizes = "is-normal is-small is-medium is-large";
		$(el).removeClass(sizes);
		$(el).addClass(data.size);
	}

	if (data.hasOwnProperty('state')) {
		var states = "is-hovered is-focused is-active is-loading";
		$(el).removeClass(states);
		$(el).addClass(state);
	}

	if (data.hasOwnProperty('outlined')) {
		if (data.responsive == TRUE) {
			$(el).addClass("is-outlined")
		} else {
			$(el).removeClass("is-outlined")
		}
	}
}


