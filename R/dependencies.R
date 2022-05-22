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
