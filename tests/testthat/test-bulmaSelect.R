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

test_that("Class attributes are formatting correctly", {
  select <- BulmaSelect(
    inputId = "example",
    size = "is-large",
    choices = c("A", "B", "C"),
    color = "is-white",
    state = "is-active",
    spacing = c("m-5", "p-5"),
    rounded = TRUE,
    responsive = TRUE,
    fullwidth = TRUE,
    hidden = TRUE)

  answer <- paste0("<select class=\"is-white is-large is-active m-5 p-5 is-res",
                   "ponsive is-fullwidth is-rounded is-hidden\" id=\"examp",
                   "le\">\n  <option>A</option>\n  <option>B</option>\n  <op",
                   "tion>C</option>\n</select>")

  expect_equal(as.character(select), answer)
})

test_that("Icon attribute works", {
  select <- BulmaSelect(
    inputId = "example",
    choices = c("A", "B", "C"),
    icon = "fa-solid fa-globe"
  )

  answer <- paste0("<div class=\"control has-icons-left\">\n  <select id=\"exa",
                   "mple\" class=\"is-normal\">\n    <option>A</option>\n    <",
                   "option>B</option>\n    <option>C</option>\n  </sele",
                   "ct>\n  <div class=\"icon is-left is-normal\"><i cla",
                   "ss = ' fa-solid fa-globe '></i></div>\n</div>")

  # Without applying a size attribute
  expect_equal(as.character(select), answer)

  select <- BulmaSelect(
    inputId = "example",
    choices = c("A", "B", "C"),
    icon = "fa-solid fa-globe",
    size = "is-large"
  )

  answer <- paste0("<div class=\"control has-icons-left\">\n  <select id=\"exa",
                   "mple\" class=\"is-large\">\n    <option>A</option>\n    <o",
                   "ption>B</option>\n    <option>C</option>\n  </selec",
                   "t>\n  <div class=\"icon is-left is-large\"><i class = ' f",
                   "a-solid fa-globe '></i></div>\n</div>")

  # After applying size attribute
  expect_equal(as.character(select), answer)
})
