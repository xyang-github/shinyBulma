#' Bulma Button
#' @param inputId string value for the id
#' @param text string value for the text displayed in the button
#' @param size string value for size; choices are: "is-normal", "is-small",
#' "is-medium", "is-large"
#' @param color string value for color; choices are: "is-white", "is-light",
#' "is-dark", "is-black", "is-text", "is-ghost", "is-primary", "is-link",
#' "is-info", "is-success", "is-warning", "is-danger"
#' @param state string value for state; choices are: "is-hovered",
#' "is-focused", "is-active", "is-loading"
#' @param responsive if true, will make the button size responsive to the
#' window size
#' @param fullwidth if true, will increase the button width to fit its parent
#' container
#' @param outlined if true, will create an outlined design
#' @param inverted if true, will create an inverted design
#' @param rounded if true, will create a rounded button
#' @param disabled if true, will disable the button
#' @param hidden if true, will hide the button from view
#' @param spacing string value for padding and margin; choices are: "m-0", "m-1", "m-2", "m-3", "m-4", "m-5", "m-6","m-auto", "mt-0", "mt-1", "mt-2", "mt-3", "mt-4", "mt-5", "mt-6", "mt-auto", "mr-0",  "mr-1", "mr-2", "mr-3", "mr-4", "mr-5", "mr-6", "mr-auto", "mb-0", "mb-1", "mb-2", "mb-3", "mb-4", "mb-5", "mb-6","mb-auto",  "ml-0", "ml-1", "ml-2", "ml-3", "ml-4", "ml-5", "ml-6", "ml-auto", "mx-0",  "mx-1",  "mx-2",  "mx-3",  "mx-4",  "mx-5",  "mx-6",  "mx-auto",  "my-0", "my-1", "my-2", "my-3", "my-4", "my-5", "my-6", "my-auto", "p-0", "p-1", "p-2", "p-3", "p-4", "p-5", "p-6","p-auto", "pt-0", "pt-1", "pt-2", "pt-3", "pt-4", "pt-5", "pt-6", "pt-auto", "pr-0",  "pr-1", "pr-2", "pr-3", "pr-4", "pr-5", "pr-6", "pr-auto", "pb-0", "pb-1", "pb-2", "pb-3", "pb-4", "pb-5", "pb-6","pb-auto",  "pl-0", "pl-1", "pl-2", "pl-3", "pl-4", "pl-5", "pl-6", "pl-auto", "px-0",  "px-1",  "px-2",  "px-3",  "px-4",  "px-5",  "px-6",  "px-auto",  "py-0", "py-1", "py-2", "py-3", "py-4", "py-5", "py-6", "py-auto",
#' @import htmltools
#' @export
#' @examples
#' BulmaBtn(inputId = "example", text = "Submit")
BulmaBtn <- function(inputId,
                     text,
                     size = "is-normal",
                     icon = NULL,
                     color = NULL,
                     state = NULL,
                     spacing = NULL,
                     responsive = FALSE,
                     fullwidth = FALSE,
                     outlined = FALSE,
                     inverted = FALSE,
                     rounded = FALSE,
                     disabled = FALSE,
                     hidden = FALSE
                     ) {

  # Size argument matching
  size <- match.arg(
    arg = size,
    choices = c("is-normal", "is-small", "is-medium", "is-large")
  )

  # Color argument matching
  if (!is.null(color)) {
    color <- match.arg(
    arg = color,
    choices = c("is-white", "is-light", "is-dark", "is-black", "is-text",
                "is-ghost", "is-primary", "is-link", "is-info", "is-success",
                "is-warning", "is-danger")
                )
  }

  # State argument matching
  if (!is.null(state)) {
    state <- match.arg(
    arg = state,
    choices = c("is-hovered", "is-focused", "is-active", "is-loading")
    )
  }

  # Spacing argument matching
  if (!is.null(spacing)) {
    spacing <- match.arg(
    arg = spacing,
    choices = c("m-0", "m-1", "m-2", "m-3", "m-4", "m-5", "m-6","m-auto", "mt-0", "mt-1", "mt-2", "mt-3", "mt-4", "mt-5", "mt-6", "mt-auto", "mr-0",  "mr-1", "mr-2", "mr-3", "mr-4", "mr-5", "mr-6", "mr-auto", "mb-0", "mb-1", "mb-2", "mb-3", "mb-4", "mb-5", "mb-6","mb-auto",  "ml-0", "ml-1", "ml-2", "ml-3", "ml-4", "ml-5", "ml-6", "ml-auto", "mx-0",  "mx-1",  "mx-2",  "mx-3",  "mx-4",  "mx-5",  "mx-6",  "mx-auto",  "my-0", "my-1", "my-2", "my-3", "my-4", "my-5", "my-6", "my-auto", "p-0", "p-1", "p-2", "p-3", "p-4", "p-5", "p-6","p-auto", "pt-0", "pt-1", "pt-2", "pt-3", "pt-4", "pt-5", "pt-6", "pt-auto", "pr-0",  "pr-1", "pr-2", "pr-3", "pr-4", "pr-5", "pr-6", "pr-auto", "pb-0", "pb-1", "pb-2", "pb-3", "pb-4", "pb-5", "pb-6","pb-auto",  "pl-0", "pl-1", "pl-2", "pl-3", "pl-4", "pl-5", "pl-6", "pl-auto", "px-0",  "px-1",  "px-2",  "px-3",  "px-4",  "px-5",  "px-6",  "px-auto",  "py-0", "py-1", "py-2", "py-3", "py-4", "py-5", "py-6", "py-auto"),
    several.ok = TRUE
    )
  }

  # Create HTML object based on icon
  if (!is.null(icon)) {
    html <- tags$button(
              id = inputId,
              class = "button bulma-btn",
              class = size,
              class = color,
              class = state,
              class = spacing,
              class = if (responsive) "is-responsive",
              class = if (fullwidth) "is-fullwidth",
              class = if (outlined) "is-outlined",
              class = if (inverted) "is-inverted",
              class = if (rounded) "is-rounded",
              class = if (hidden) "is-hidden",
              tags$span(
                class = "icon",
                HTML("<i class = '", icon, "'></i>")
                ),
              tags$span(
                text
                )
              )
    } else {
        html <- tags$button(
            id = inputId,
            class = "button bulma-btn",
            class = size,
            class = color,
            class = state,
            class = spacing,
            class = if (responsive) "is-responsive",
            class = if (fullwidth) "is-fullwidth",
            class = if (outlined) "is-outlined",
            class = if (inverted) "is-inverted",
            class = if (rounded) "is-rounded",
            class = if (hidden) "is-hidden",
            text)
    }

  if (disabled) html <- tagQuery(html)$addAttrs("disabled" = "true")$selected()

  tagList(html,
          Bulma_Dependency(),
          Font_Awesome_Dependency(),
          Bulma_Button_Binding()
          )
}

#' Update Bulma Button
#' @param inputId string value for id
#' @param text NULL or string value for button text
#' @param color NULL or string value for button color
#' @param size NULL or string value for button size
#' @param state NULL or string value for button state
#' @param spacing NULL or string value for margin and padding
#' @param responsive NULL or Boolean value for responsive size
#' @param fullwidth NULL or Boolean value to make button size fullwidth
#' @param outlined NULL or Boolean value to make button outlined
#' @param inverted NULL or Boolean value to make button inverted
#' @param rounded NULL or Boolean value to make button with rounded corners
#' @param disabled NULL or Boolean value to make a button disabled
#' @param hidden NULL or Boolean value to make a button hidden
#' @param session session object
#' @export
UpdateBulmaBtn <- function(
    inputId,
    text = NULL,
    color = NULL,
    size = NULL,
    state = NULL,
    spacing = NULL,
    responsive = NULL,
    fullwidth = NULL,
    outlined = NULL,
    inverted = NULL,
    rounded = NULL,
    disabled = NULL,
    hidden = NULL,
    session = getDefaultReactiveDomain()
    ){

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

    if (!is.null(spacing)) {
      spacing <- match.arg(
        arg = spacing,
        choices = c("", "m-0", "m-1", "m-2", "m-3", "m-4", "m-5", "m-6","m-auto", "mt-0", "mt-1", "mt-2", "mt-3", "mt-4", "mt-5", "mt-6", "mt-auto", "mr-0",  "mr-1", "mr-2", "mr-3", "mr-4", "mr-5", "mr-6", "mr-auto", "mb-0", "mb-1", "mb-2", "mb-3", "mb-4", "mb-5", "mb-6","mb-auto",  "ml-0", "ml-1", "ml-2", "ml-3", "ml-4", "ml-5", "ml-6", "ml-auto", "mx-0",  "mx-1",  "mx-2",  "mx-3",  "mx-4",  "mx-5",  "mx-6",  "mx-auto",  "my-0", "my-1", "my-2", "my-3", "my-4", "my-5", "my-6", "my-auto", "p-0", "p-1", "p-2", "p-3", "p-4", "p-5", "p-6","p-auto", "pt-0", "pt-1", "pt-2", "pt-3", "pt-4", "pt-5", "pt-6", "pt-auto", "pr-0",  "pr-1", "pr-2", "pr-3", "pr-4", "pr-5", "pr-6", "pr-auto", "pb-0", "pb-1", "pb-2", "pb-3", "pb-4", "pb-5", "pb-6","pb-auto",  "pl-0", "pl-1", "pl-2", "pl-3", "pl-4", "pl-5", "pl-6", "pl-auto", "px-0",  "px-1",  "px-2",  "px-3",  "px-4",  "px-5",  "px-6",  "px-auto",  "py-0", "py-1", "py-2", "py-3", "py-4", "py-5", "py-6", "py-auto"),
        several.ok = TRUE
      )
    }

    # Makes sure that the attribute contains either TRUE or FALSE if not NULL
    Is_Null <- function(attribute) {
      if (!is.null(attribute) & !is.logical(attribute)) {
        stop("One of the parameters in UpdateBulmaBtn must be TRUE or FALSE")
      }
    }

    Is_Null(responsive)
    Is_Null(fullwidth)
    Is_Null(outlined)
    Is_Null(inverted)
    Is_Null(rounded)
    Is_Null(disabled)
    Is_Null(hidden)
    Is_Null(spacing)

    message <- list(
      text = text,
      color = color,
      size = size,
      state = state,
      spacing = spacing,
      responsive = responsive,
      fullwidth = fullwidth,
      outlined = outlined,
      inverted = inverted,
      rounded = rounded,
      disabled = disabled,
      hidden = hidden
      )

    # Removes elements that have a NULL value
    message[sapply(message, is.null)] <- NULL

    session$sendInputMessage(inputId, message)
}

# Need to figure out how to implement testing with the update function
