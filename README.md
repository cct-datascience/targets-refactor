
# targets-refactor

<!-- badges: start -->
<!-- badges: end -->

This is a simple example research compendium to practice refactoring a project to use `targets`.  To switch this over to using `targets` :

1) run `targets::use_targets()` to set up some infrastructure
2) turn steps in analysis scripts into R functions in `R/`
3) edit `_targets.R` to load necessary packages
4) edit `_targets.R` to write analysis steps as targets with `tar_target()`
5) check workflow with `tar_manifest()` and `tar_visnetwork()`
6) run workflow with `tar_make()`
7) possibly debug functions and targets workflow

