# This is one possible answer.  Your refactor may look different from mine and that's OK!

# Load packages required to define the pipeline:
library(targets)
library(tarchetypes)

# Set target options:
tar_option_set(
  # packages that your targets need to run
  packages = c("tidyverse", "janitor", "broom", "car", "equatiomatic") 
  # Set other options as needed.
)

# Run the R scripts in the R/ folder with your custom functions:
tar_source()

list(
  tar_target(maples_file, "data/hbr_maples_raw.csv", format = "file"),
  tar_target(maples, read_wrangle_data(maples_file)),
  tar_target(plot_boxplot, make_plot_boxplot(maples)),
  tar_target(tbl_summary, make_tbl_summary(maples)),
  tar_target(stem_lm, fit_model(maples)),
  tar_target(stem_anova, Anova(stem_lm) %>% tidy()),
  tar_target(plot_model, make_plot_model(stem_lm)),
  tar_render(report, "docs/report.Rmd")
)
