test_that("Require file", {
  expect_error(mx_download())
})

mx_result <- data.frame(pdf = "/content/10.1101/19007328v2.full.pdf",
                        node = "69465")

test_that("Inital output", {
  expect_output(mx_download(mx_result, "pdf"), regexp = "Downloading")
})

test_that("Already downloaded", {
  expect_output(mx_download(mx_result, "pdf"), regexp = "downloaded")
})

unlink("pdf", recursive = TRUE)

test_that("Status update", {
  expect_output(mx_download(mx_result, "pdf", print_update = 1), regexp = "%")
})

unlink("pdf", recursive = TRUE)

