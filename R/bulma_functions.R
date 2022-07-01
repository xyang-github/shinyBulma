#' Match Size
#' @description match argument to a character vector of choices
#' @return size variable, or an error if no matches
#' @export
#' @return size
#' @examples
#' size <- Match_Size("is-normal")
Match_Size <- function(size) {
  size <- match.arg(
    arg = size,
    choices = c("is-normal", "is-small", "is-medium", "is-large")
  )
}

#' Match Color
#' @description match argument to character vector of choices
#' @param color NULL or string value for color
#' @return color
#' @export
#' @examples
#' color <- Match_Color("is-light")
Match_Color <- function(color) {
  if (!is.null(color)) {
    color <- match.arg(
      arg = color,
      choices = c("is-white", "is-light", "is-dark", "is-black", "is-text",
                  "is-ghost", "is-primary", "is-link", "is-info", "is-success",
                  "is-warning", "is-danger")
    )
  }
}

#' Match State
#' @description match argument to character vector of choices
#' @param state NULL or string value for state
#' @return state
#' @export
#' @examples
#' state <- Match_State(state)
Match_State <- function(state) {
  if (!is.null(state)) {
    state <- match.arg(
      arg = state,
      choices = c("is-hovered", "is-focused", "is-active", "is-loading")
    )
  }
}

#' Match Spacing
#' @description match argument to character vector of choices
#' @param spacing string value for spacing and padding
#' @return spacing
#' @export
#' @examples
#' spacing <- Match_Spacing("m-0")
Match_Spacing <- function(spacing) {
  if (!is.null(spacing)) {
    spacing <- match.arg(
      arg = spacing,
      choices = c("m-0", "m-1", "m-2", "m-3", "m-4", "m-5", "m-6","m-auto",
                  "mt-0", "mt-1", "mt-2", "mt-3", "mt-4", "mt-5", "mt-6",
                  "mt-auto", "mr-0",  "mr-1", "mr-2", "mr-3", "mr-4", "mr-5",
                  "mr-6", "mr-auto", "mb-0", "mb-1", "mb-2", "mb-3", "mb-4",
                  "mb-5", "mb-6","mb-auto",  "ml-0", "ml-1", "ml-2", "ml-3",
                  "ml-4", "ml-5", "ml-6", "ml-auto", "mx-0",  "mx-1", "mx-2",
                  "mx-3",  "mx-4",  "mx-5",  "mx-6",  "mx-auto",  "my-0",
                  "my-1", "my-2", "my-3", "my-4", "my-5", "my-6", "my-auto",
                  "p-0", "p-1", "p-2", "p-3", "p-4", "p-5", "p-6", "p-auto",
                  "pt-0", "pt-1", "pt-2", "pt-3", "pt-4", "pt-5", "pt-6",
                  "pt-auto", "pr-0",  "pr-1", "pr-2", "pr-3", "pr-4", "pr-5",
                  "pr-6", "pr-auto", "pb-0", "pb-1", "pb-2", "pb-3", "pb-4",
                  "pb-5", "pb-6", "pb-auto",  "pl-0", "pl-1", "pl-2", "pl-3",
                  "pl-4", "pl-5", "pl-6", "pl-auto", "px-0",  "px-1",  "px-2",
                  "px-3", "px-4",  "px-5",  "px-6",  "px-auto",  "py-0",
                  "py-1", "py-2", "py-3", "py-4", "py-5", "py-6", "py-auto"),
      several.ok = TRUE
    )
  }
}
