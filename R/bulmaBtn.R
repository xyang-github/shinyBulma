#' Bulma Button
#'
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
#' @import htmltools
#' @export
#' @examples
#' BulmaBtn(inputId = "example", text = "Submit")
BulmaBtn <- function(inputId,
                     text,
                     size = "is-normal",
                     color = NULL,
                     state = NULL,
                     responsive = FALSE,
                     fullwidth = FALSE,
                     outlined = FALSE,
                     inverted = FALSE,
                     rounded = FALSE,
                     disabled = FALSE,
                     hidden = FALSE
                     ) {

  size <- match.arg(
    arg = size,
    choices = c("is-normal", "is-small", "is-medium", "is-large")
  )

  color <- match.arg(
    arg = color,
    choices = c("", "is-white", "is-light", "is-dark", "is-black", "is-text",
                "is-ghost", "is-primary", "is-link", "is-info", "is-success",
                "is-warning", "is-danger")
  )

  state <- match.arg(
    arg = state,
    choices = c("", "is-hovered", "is-focused", "is-active", "is-loading")
  )

  html <- tags$button(
            id = inputId,
            class = "button bulma-btn",
            class = size,
            class = color,
            class = state,
            class = if (responsive) "is-responsive",
            class = if (fullwidth) "is-fullwidth",
            class = if (outlined) "is-outlined",
            class = if (inverted) "is-inverted",
            class = if (rounded) "is-rounded",
            class = if (hidden) "is-hidden",
            text)

  if (disabled) html <- tagQuery(html)$addAttrs("disabled" = "true")$selected()

  tagList(html,
          Bulma_Dependency(),
          Bulma_Button_Binding()
          )
}

#' Update Bulma Button
#'
#' @param inputId string value for id
#' @param text NULL or string value for button text
#' @param color NULL or string value for button color
#' @param size NULL or string value for button size
#' @param state NULL or string value for button state
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

    message <- list(
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

    # Removes elements that have a NULL value
    message[sapply(message, is.null)] <- NULL

    session$sendInputMessage(inputId, message)
}
