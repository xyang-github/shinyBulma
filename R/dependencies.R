#' Bulma Dependency
#' @import htmltools
#' @export
Bulma_Dependency <- function() {
  htmlDependency(
    name = "shiny-bulma",
    version = "0.9.4",
    src = c(file = "~/Documents/Programming Workspace/R/shinyBulma/inst/bulma"),
    stylesheet = "bulma.min.css"
  )
}

#' Font Awesome Dependency
#' @import htmltools
#' @export
Font_Awesome_Dependency <- function() {
  htmlDependency(
    name = "fontawesome",
    version = "6.1.1",
    src = c(file = "~/Documents/Programming Workspace/R/shinyBulma/inst/fontawesome/"),
    stylesheet = "css/all.min.css",
    script = "js/v4-shims.min.js"
  )
}

#' Bulma Button Binding
#' @import htmltools
#' @export
Bulma_Button_Binding <- function() {
  htmlDependency(
    name = "btn_binding",
    version = "0.1.0",
    src = c(file = "~/Documents/Programming Workspace/R/shinyBulma/inst/input_binding"),
    script = "bulma_button.js"
  )
}