#' Bulma Select
#' @param inputId string value for the id
#' @param choices character vector of html options; can be blank ""
#' @param size string value for size; choices are: "is-normal", "is-small",
#' "is-medium", "is-large"
#' @param color string value for color; choices are: "is-white", "is-light",
#' "is-dark", "is-black", "is-text", "is-ghost", "is-primary", "is-link",
#' "is-info", "is-success", "is-warning", "is-danger"
#' @param size string value for size; choices are: "is-normal", "is-small",
#' "is-medium", "is-large"
#' @param state string value for state; choices are: "is-hovered",
#' "is-focused", "is-active", "is-loading"
#' @param spacing  string value for padding and margin; choices are:
#' "m-0", "m-1", "m-2", "m-3", "m-4", "m-5", "m-6","m-auto", "mt-0", "mt-1",
#' "mt-2", "mt-3", "mt-4", "mt-5", "mt-6", "mt-auto", "mr-0",  "mr-1", "mr-2",
#' "mr-3", "mr-4", "mr-5", "mr-6", "mr-auto", "mb-0", "mb-1", "mb-2", "mb-3",
#' "mb-4", "mb-5", "mb-6","mb-auto",  "ml-0", "ml-1", "ml-2", "ml-3", "ml-4",
#' "ml-5", "ml-6", "ml-auto", "mx-0",  "mx-1",  "mx-2",  "mx-3",  "mx-4",
#' "mx-5",  "mx-6",  "mx-auto",  "my-0", "my-1", "my-2", "my-3", "my-4",
#' "my-5", "my-6", "my-auto", "p-0", "p-1", "p-2", "p-3", "p-4", "p-5",
#' "p-6","p-auto", "pt-0", "pt-1", "pt-2", "pt-3", "pt-4", "pt-5", "pt-6",
#' "pt-auto", "pr-0",  "pr-1", "pr-2", "pr-3", "pr-4", "pr-5", "pr-6",
#' "pr-auto", "pb-0", "pb-1", "pb-2", "pb-3", "pb-4", "pb-5", "pb-6","pb-auto",
#' "pl-0", "pl-1", "pl-2", "pl-3", "pl-4", "pl-5", "pl-6", "pl-auto", "px-0",
#' "px-1",  "px-2",  "px-3",  "px-4",  "px-5",  "px-6",  "px-auto",  "py-0",
#' "py-1", "py-2", "py-3", "py-4", "py-5", "py-6", "py-auto",
#' @param rounded if true, will create a rounded select input
#' @param multiselect if true, will allow for multiselect
#' @param icon string value corresponding to fontawesome's i tag's class value
#' (i.e. "fa-solid fa-check")
#' @param responsive if true, will make the width responsive to window size
#' @param fullwidth if true, will make the width 100%
#' @param disabled if true, will disable the select input
#' @param hidden if true, will hide the select input
#' @import htmltools
#' @export
#' @return tagList object
#' @examples
#' BulmaSelect(inputId = "example", choices = c("A", "B", "C"))
BulmaSelect <- function(inputId,
                        size = "is-normal",
                        choices = NULL,
                        color = NULL,
                        state = NULL,
                        spacing = NULL,
                        icon = NULL,
                        rounded = FALSE,
                        multiselect = FALSE,
                        responsive = FALSE,
                        fullwidth = FALSE,
                        disabled = FALSE,
                        hidden = FALSE) {

  color <- Match_Color(color)
  size <- Match_Size(size)
  state <- Match_State(state)
  spacing <- Match_Spacing(spacing)

  html <- tagList(
    tags$select(
      id = inputId,
      class = color,
      class = size,
      class = state,
      class = spacing,
      class = if (responsive) "is-responsive",
      class = if (fullwidth) "is-fullwidth",
      class = if (rounded) "is-rounded",
      class = if (hidden) "is-hidden",
      if (!is.null(choices)) {
        lapply(choices, function(choice) tags$option(choice))
      }
    )
  )

  if (!is.null(icon)) {
    html <- tagList(
      tags$div(
        class = "control has-icons-left",
        html,
        tags$div(
          class = "icon is-left",
          class = size,
          HTML("<i class = '", icon, "'></i>")
        )
      )
    )
  }

  if (multiselect) {
    html <- tagList(
      tags$div(
        class = "select is-multiple",
        html
      )
    )
  }

  if (disabled) html <- tagQuery(html)$addAttrs("disabled" = "true")$selected()

  tagList(html,
          Bulma_Dependency(),
          Font_Awesome_Dependency(),
  )

}
