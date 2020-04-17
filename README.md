
<!-- README.md is generated from README.Rmd. Please edit that file -->

# medrxivr <img src="man/figures/hex-medrxivr.png" align="right" width="20%" height="20%" />

<!-- badges: start -->

[![Project Status: Active – The project has reached a stable, usable
state and is being actively
developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
<br> [![Travis build
status](https://travis-ci.com/mcguinlu/medrxivr.svg?branch=master)](https://travis-ci.com/mcguinlu/medrxivr)
[![AppVeyor build
status](https://ci.appveyor.com/api/projects/status/github/mcguinlu/medrxivr?branch=master&svg=true)](https://ci.appveyor.com/project/mcguinlu/medrxivr)
[![Codecov test
coverage](https://codecov.io/gh/mcguinlu/medrxivr/branch/master/graph/badge.svg)](https://codecov.io/gh/mcguinlu/medrxivr?branch=master)
<!-- badges: end -->

`medrxivr` provides access to a static snapshot of the *medRxiv*
preprint repository, which is automatically updated each morning to
capture new records. `medrxivr` also provides functions to search the
snapshot using regular expressions and Boolean logic, and provides a
helper function to download the full-text PDFs of relevant preprints.

**Note:** `medrxivr` is now available as a web-app, which lets you build
complex searches via a user-friendly interface, explore the results and
export them for screening. In an effort to improve reproducibility, it
also creates the code needed to run the search straight from R. The app
is available [here.](https://mcguinlu.shinyapps.io/medrxivr/)

## Installation

You can install the development version of this package using:

``` r
devtools::install_github("mcguinlu/medrxivr")
library(medrxivr)
```

## Usage

## Perform a simple search

``` r

mx_results <- mx_search("dementia")
```

## Download PDFs for returned records

Pass the results of your search above to the `mx_download()` function to
download a copy of the PDF for each record.

``` r

mx_download(mx_results,     # Object returned by mx_search
            "pdf/",         # Directory to save PDFs to 
            create = TRUE)  # Create the directory if it doesn't exist
```

## Code of conduct

Please note that the `medrxivr` project is released with a [Contributor
Code of Conduct](CODE_OF_CONDUCT.md). By contributing to this project,
you agree to abide by its terms.

## Disclaimer

This package and the data it accesses/returns are provided “as is”, with
no guarantee of accuracy. Please be sure to check the accuracy of the
data yourself (and do let me know if you find an issue so I can fix it
for everyone\!)
