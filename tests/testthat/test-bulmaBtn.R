test_that("BulmaBtn renders correct html tags", {
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

  expected <- paste("<button class=\"button bulma-btn is-large is-link",
                    "is-loading  is-responsive is-fullwidth is-outlined",
                    "is-inverted is-rounded is-hidden\"",
                    "id=\"example\">Button</button>")

  expect_type(tag, "list")
  expect_equal(str,expected)
})

test_that("That incorrect argument choices will cause an error", {

  result <- paste("<button class=\"button bulma-btn is-normal   \"",
                  "id=\"example\">Button</button>")

  expect_error(BulmaBtn())  # no arguments
  expect_error(BulmaBtn(inputId = "example", color = "is-light"))  # no text argument
  expect_error(as.character(BulmaBtn(inputId = "example",
                                     text = "Button",
                                     color = "red")))  # wrong color choice
  expect_error(as.character(BulmaBtn(inputId = "example",
                                     text = "Button",
                                     size = "xl")))  # wrong size choice
  expect_error(as.character(BulmaBtn(inputId = "example",
                                     text = "Button",
                                     state = "disabled")))  # wrong state choice
  expect_equal(as.character(BulmaBtn(inputId = "example",
                                     text = "Button")),result)

})

test_that("Disable attribute works", {
  str <- as.character(BulmaBtn(inputId = "example",
                               text = "Button",
                               disabled = TRUE))
  result <- paste("<button class=\"button bulma-btn is-normal   \"",
                  "disabled=\"true\" id=\"example\">Button</button>")

  expect_equal(str, result)
})

test_that("UpdateBulmaBtn function causes error with incorrect arguments", {
  expect_error(UpdateBulmaBtn())  # no arguments
  expect_error(UpdateBulmaBtn(inputId = "example", size = "xl"))
  expect_error(UpdateBulmaBtn(inputId = "example", color = "red"))
  expect_error(UpdateBulmaBtn(inputId = "example", state = "disabled"))
  expect_error(UpdateBulmaBtn(inputId = "example", responsive = true))
})

test_that("UpdateBulmaBtn function does not cause errors with correct arguments", {

  createModuleSession <- function(moduleId) {
    session <- as.environment(list(
      ns = NS(moduleId),
      BulmaBtn(inputId = ns("test"), text = "Test"),
      sendInputMessage = function(inputId, message) {
        session$lastInputMessage = list(id = inputId, message = message)
      }
    ))
    class(session) <- "ShinySession"
    session
  }

  sessionA <- createModuleSession("sessA")
  UpdateBulmaBtn(session = sessionA, inputId = "test", text = "Button")
  resultA <- sessionA$lastInputMessage

  expect_true(grepl('"SessA-test1"', resultA$message$options))
  # expect_silent(UpdateBulmaBtn(inputId = "example"))
  # expect_silent(UpdateBulmaBtn(inputId = "example", text = "Example"))
  # expect_silent(UpdateBulmaBtn(inputId = "example", size = "is-large"))
  # expect_silent(UpdateBulmaBtn(inputId = "example", color = "is-dark"))
  # expect_silent(UpdateBulmaBtn(inputId = "example", state = "is-loading"))
  # expect_silent(UpdateBulmaBtn(inputId = "example", responsive = TRUE))
})
