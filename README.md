
<!-- README.md is generated from README.Rmd. Please edit that file -->

# medrxivr

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

## Installation

You can install the development version of this package using:

``` r
devtools::install_github("mcguinlu/medrxivr")
library(medrxivr)
```

## Example

To get the entire most recent *medRxiv* snapshot to play around with,
use the following command:

``` r

mx_results <- mx_search("*")
```

For a simple search strategy:

``` r

mx_results <- mx_search("dementia")
```

To find records that contain one of many keywords:

``` r

myquery <- c("dementia","vascular","alzheimer's") # Combined with OR

mx_results <- mx_search(myquery)
```

To combine different topic domains (currently, you can have up to 5
topics):

``` r

topic1  <- c("dementia","vascular","alzheimer's")  # Combined with OR
topic2  <- c("lipids","statins","cholesterol")     # Combined with OR
myquery <- list(topic1, topic2)                    # Combined with AND

mx_results <- mx_search(myquery)
```

To limit by date posted on medRxiv:

``` r
mx_results <- mx_search("dementia",
                        from.date = 20200101,      # 1st Jan 2020
                        to.date = 20200105)        # 5th Jan 2020
```

To exclude records containing certain terms:

``` r
mx_results <- mx_search("dementia",
                        NOT = "MCI")
```

To return all versions of a record, rather than just the most recent
one:

``` r
mx_results <- mx_search("dementia",
                        deduplicate = FALSE)
```

## Download PDFs

Pass the results of your search above to the `mx_download()` function to
download a copy of the PDF for each record. Note: downloaded PDFs are
named using the value of the `node` column in the dataset, which serves
as a unique identifier for each record.

``` r

mx_download(mx_results,     # Object returned by mx_search
            "pdf/",         # Directory to save PDFs to 
            create = TRUE)  # Create the directory if it doesn't exist
```

## Planned updates

  - At present, only the title and author fields are searched. I would
    like to also make the author/topic fields searchable.
  - At present, only the first author for each record has been
    extracted. This will be corrected in future updates.

## Code of conduct

Please note that the `medrxivr` project is released with a [Contributor
Code of Conduct](CODE_OF_CONDUCT.md). By contributing to this project,
you agree to abide by its terms.

## Disclaimer

This package and the data it accesses/returns are provided “as is”, with
no guarantee of accuracy. Please be sure to check the accuracy of the
data yourself (and do let me know if you find an issue so I can fix it
for everyone\!)