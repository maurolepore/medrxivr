### Editor checks:

- [ ] **Fit**: The package meets criteria for [fit](https://devguide.ropensci.org/policies.html#package-categories) and [overlap](https://devguide.ropensci.org/policies.html#overlap)
- [x] **Automated tests:** Package has a testing suite and is tested via Travis-CI or another CI service.
- [x] **License:** The package has a CRAN or OSI accepted license
- [x] **Repository:** The repository link resolves correctly
- [ ] **Archive** (JOSS only, may be post-review): The repository DOI resolves correctly
- [ ] **Version** (JOSS only, may be post-review): Does the release version given match the GitHub release (v1.0.0)?

---

#### Editor comments

\@mcguinlu, thanks again for your submission. The editor checks flagged a few issues that need your attention; see them below.

Let's discuss the first two items (ml1 and ml2) before I search for reviewers; these two items refer to a potential **overlap** with existing packages. 

* [ ] (ml1) \@mcguinlu, I see you discussed this issue with @sckott (https://github.com/ropensci/fulltext/issues/213#issue-574066182); but this was a while ago and the issue remains unresolved and open. As of today, what do you think is the best way to move forward?:

  a. Extend the package fulltext (<https://github.com/ropensci/fulltext>).
  b. Continue with this submission (please argue for the lack of overlap).
  c. Something else (please explain).

* [ ] (ml2) The file DESCRIPTION links to <https://api.biorxiv.org/>. \@mcguinlu, is there an overlap with the package biorxivr (<https://cran.r-project.org/web/packages/biorxivr/index.html>)? Why not?

The remaining items are important but not as urgent as the first two.

- [ ] (ml3) Run `spelling::spell_check_package()`; then fix or update the list of valid words with `spelling::update_wordlist()`.

```r
> spelling::spell_check_package()
WORD              FOUND IN
api               mx_api_content.Rd:39,42
                  mx_api_doi.Rd:28,31
                  description:4
AppVeyor          README.md:14
                  README.Rmd:24
ation             building-complex-search-strategies.Rmd:110
biorxiv           description:4
capitalisation    building-complex-search-strategies.Rmd:125
... more lines
```

- [ ] (ml4) Run `goodpractice::gp()` to identify lines of code that tests don't touch.

```r
> goodpractice::gp()
... more lines
── GP medrxivr ─────────────────────────────────────────────────────────────────

It is good practice to

  ✖ write unit tests for all functions, and all package code in
    general. 77% of code lines are covered by test cases.

    R/mx_crosscheck.R:50:NA
    R/mx_download.R:25:NA
    R/mx_download.R:27:NA
    R/mx_download.R:28:NA
    R/mx_download.R:30:NA
    ... and 51 more lines
```

- [ ] (ml5) Run `covr::package_coverage()` and try to test code in files with low % coverage.

```r
> covr::package_coverage()
medrxivr Coverage: 77.60%
R/mx_download.R: 1.92%
R/mx_crosscheck.R: 96.15%
R/mx_search.R: 96.33%
R/mx_api.R: 100.00%
R/mx_info.R: 100.00%
```

- [ ] (ml6) You may run an automated code-styler to make it easier for reviewers to read your code (https://styler.r-lib.org/reference/style_pkg.html).

```r
> styler::style_pkg()
Styling  12  files:
 R/medrxivr.R                     ✓ 
 R/mx_api.R                       ℹ 
 R/mx_crosscheck.R                ℹ 
 R/mx_download.R                  ℹ 
 R/mx_info.R                      ℹ 
 R/mx_search.R                    ℹ 
 tests/testthat.R                 ✓ 
 tests/testthat/test-api.R        ℹ 
 tests/testthat/test-crosscheck.R ✓ 
 tests/testthat/test-download.R   ℹ 
 tests/testthat/test-info.R       ✓ 
 tests/testthat/test-search.R     ℹ 
────────────────────────────────────────
Status	Count	Legend 
✓ 	4	File unchanged.
ℹ 	8	File changed.
x 	0	Styling threw an error.
────────────────────────────────────────
Please review the changes carefully!
```

---

Reviewers:
Due date:

