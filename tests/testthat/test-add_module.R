context("function add_module")


test_that("add_module", {
  with_dir(pkg, {
    add_module("test")
    expect_true(file.exists("R/mod_test.R"))
    script <- list.files("R", pattern = "mod_test")
    expect_equal(tools::file_ext(script),
                 "R")
    ## Test message of function
    ok <- file.exists("R/mod_output.R")
    if (ok) {
      file.remove("R/mod_output.R")
    }
    output <- testthat::capture_output(add_module("output"))
    test <-
      stringr::str_detect(output, "File created at R/mod_output.R")
    expect_true(test)
  })
})