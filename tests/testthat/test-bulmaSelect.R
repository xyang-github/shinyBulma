test_that("Select widget with no additional class attributes renders html
          correctly", {

  select <- BulmaSelect(
    inputId = "example"
  )

  answer <- "<select id=\"example\" class=\"is-normal\"></select>"

  # Bare minimum with no additional class attributes
  expect_equal(as.character(select), answer)

  select <- BulmaSelect(
    inputId = "example",
    choices = c("Option 1", "Option 2", "Option 3")
  )

  answer <- paste0("<select id=\"example\" class=\"is-normal\">\n  <option>",
                   "Option 1</option>\n  <option>Option 2</option>\n  <option>",
                   "Option 3</option>\n</select>")

  # With options
  expect_equal(as.character(select), answer)

  # With disabled = TRUE
  select <- BulmaSelect(
    inputId = "example",
    choices = c("Option 1", "Option 2", "Option 3"),
    disabled = TRUE
  )

  answer <- paste0("<select id=\"example\" class=\"is-normal\" disabled=\"tr",
                   "ue\">\n  <option>Option 1</option>\n  <option>Option 2",
                   "</option>\n  <option>Option 3</option>\n</select>")

  expect_equal(as.character(select), answer)
})
