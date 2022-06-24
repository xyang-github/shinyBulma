test_that("BulmaBtn renders correct html tags without icons", {
  tag <- tagQuery(
    BulmaBtn(
      inputId = "example",
      text = "Button")
    )

  str <- as.character(BulmaBtn(inputId = "example",
                               text = "Button",
                               color = "is-link",
                               size = "is-large",
                               state = "is-loading",
                               responsive = TRUE,
                               fullwidth = TRUE,
                               outlined = TRUE,
                               inverted = TRUE,
                               rounded = TRUE,
                               hidden = TRUE))

  expected <- paste(
    "<button class=\"button bulma-btn is-large is-link is-loading",
    "is-responsive is-fullwidth is-outlined is-inverted is-rounded",
    "is-hidden\" id=\"example\">Button</button>")

  expect_type(tag, "list")
  expect_equal(str, expected)
})

test_that("BulmaBtn renders correct html tags with icons", {
  tag <- tagQuery(
    BulmaBtn(
      inputId = "example",
      text = "Button")
    )

  str <- as.character(BulmaBtn(
    inputId = "example",
    icon = "fa-solid fa-check",
    text = "Button",
    color = "is-link",
    size = "is-large",
    state = "is-loading",
    responsive = TRUE,
    fullwidth = TRUE,
    outlined = TRUE,
    inverted = TRUE,
    rounded = TRUE,
    hidden = TRUE))

  expected <- paste(
    "<button class=\"button bulma-btn is-large is-link is-loading",
    "is-responsive is-fullwidth is-outlined is-inverted is-rounded",
    "is-hidden\" id=\"example\">\n  <span class=\"icon\"><i class",
    "= ' fa-solid fa-check '></i></span>\n  <span>Button</span>\n</button>"
  )

  expect_type(tag, "list")
  expect_equal(str, expected)
})

test_that("That incorrect argument choices will cause an error", {

  # No arguments
  expect_error(BulmaBtn())

  # No text argument
  expect_error(BulmaBtn(inputId = "example", color = "is-light"))

  # Wrong color choice
  expect_error(
    BulmaBtn(
      inputId = "example",
      text = "Button",
      color = "red"))

  # Blank color choice
  expect_error(
    BulmaBtn(
      inputId = "example",
      text = "Button",
      color = ""))

  # Wrong size choice
  expect_error(
    BulmaBtn(
      inputId = "example",
      text = "Button",
      size = "xl"))

  # Wrong state choice
  expect_error(
    BulmaBtn(
      inputId = "example",
      text = "Button",
      state = "disabled"))

  # Wrong space choice
  expect_error(
    BulmaBtn(
      inputId = "example",
      text = "Button",
      spacing = "padding-0"))

  # Wrong responsiveness choice
  expect_error(
    BulmaBtn(
      inputId = "example",
      text = "Button",
      responsive = "yes"))

  # Wrong fullwidth choice
  expect_error(
    BulmaBtn(
      inputId = "example",
      text = "Button",
      fullwidth = "yes"))

  # Wrong outlined choice
  expect_error(
    BulmaBtn(
      inputId = "example",
      text = "Button",
      outlined = "yes"))

  # Wrong inverted choice
  expect_error(
    BulmaBtn(
      inputId = "example",
      text = "Button",
      inverted = ""))

  # Wrong rounded choice
  expect_error(
    BulmaBtn(
      inputId = "example",
      text = "Button",
      rounded = "yes"))
  # Wrong disabled choice
  expect_error(
    BulmaBtn(
      inputId = "example",
      text = "Button",
      disabled = "yes"))

  # Wrong hidden choice
  expect_error(
    BulmaBtn(
      inputId = "example",
      text = "Button",
      hidden = "yes"))
})

test_that("Wrong icon argument will run silently", {

  expect_silent(
    BulmaBtn(
      inputId = "example",
      text = "Button",
      icon = "blah")
  )
})

test_that("Disable attribute works", {
  str <- as.character(BulmaBtn(inputId = "example",
                               text = "Button",
                               disabled = TRUE))
  result <- paste(
    "<button class=\"button bulma-btn is-normal\"",
    "disabled=\"true\" id=\"example\">Button</button>")

  expect_equal(str, result)
})

test_that("UpdateBulmaBtn function changes class attributes and does not cause 
an error", {

  createModuleSession <- function(moduleId) {
    session <-
    as.environment(
      list(
        ns = shiny::NS(moduleId),
        btn = BulmaBtn(
          inputId = "test",
          text = "Button",
          color = "is-info",
          state = "is-active",
          spacing = "mb-4",
          responsive = TRUE,
          fullwidth = TRUE,
          outlined = TRUE,
          inverted = TRUE,
          rounded = TRUE,
          hidden = TRUE),
        sendInputMessage = function(id, message) {
          session$lastInputMessage <- list(id = id, message = message)
        }
      )
    )
    class(session) <- "ShinySession"
    session
  }

  sessionA <- createModuleSession("sessionA")

  UpdateBulmaBtn(
    session = sessionA,
    inputId = "test",
    text = "Button Updated",
    color = "is-link",
    state = "is-focused",
    spacing = c("mt-1", "mr-2"),
    responsive = FALSE,
    fullwidth = FALSE,
    outlined = FALSE,
    inverted = FALSE,
    rounded = FALSE,
    hidden = FALSE
    )

  resultA <- sessionA$lastInputMessage

  expect_equal(resultA$message$text, "Button Updated")
  expect_equal(resultA$message$color, "is-link")
  expect_equal(resultA$message$state, "is-focused")
  expect_equal(resultA$message$spacing, c("mt-1", "mr-2"))
  expect_false(resultA$message$responsive)
  expect_false(resultA$message$fullwidth)
  expect_false(resultA$message$outlined)
  expect_false(resultA$message$inverted)
  expect_false(resultA$message$rounded)
  expect_false(resultA$message$hidden)
})