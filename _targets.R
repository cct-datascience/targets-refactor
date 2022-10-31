# This is one possible answer.  Your refactor may look different from mine and that's OK!

# Load packages required to define the pipeline:
library(targets)
library(tarchetypes) 

# Set target options:
tar_option_set(
  packages = c("tidyverse", "janitor", "broom", "car"), # packages that your targets need to run
  format = "rds" # default storage format
  # Set other options as needed.
)

# tar_make_clustermq() configuration (okay to leave alone):
options(clustermq.scheduler = "multicore")

# tar_make_future() configuration (okay to leave alone):
future::plan(future.callr::callr)

# Run the R scripts in the R/ folder with your custom functions:
tar_source()
# source("other_functions.R") # Source other scripts as needed. # nolint

# Replace the target list below with your own:
tar_plan(
  tar_target(maples_file, "data/hbr_maples_raw.csv", format = "file"),
  tar_target(maples, read_wrangle_data(maples_file)),
  tar_target(plot_boxplot, make_plot_boxplot(maples)),
  tar_target(tbl_summary, make_tbl_summary(maples)),
  #sometimes I keep simple code in tar_target() instead of writing a function
  tar_target(stem_lm, lm(total_mass ~ stem_length * watershed, data = maples)),
  tar_target(stem_anova, Anova(stem_lm) %>% tidy()),
  tar_target(plot_model, make_plot_model(stem_lm))
)
