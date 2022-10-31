# This is one possible answer.  Your refactor may look different from mine and that's OK!

# Load packages required to define the pipeline:
library(targets)
library(tarchetypes) 

# Set target options:
tar_option_set(
  packages = c("tidyverse", "janitor"), # packages that your targets need to run
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
  tar_target(hbr_maples_file, "data/hbr_maples_raw.csv", format = "file"),
  tar_target(hbr_maples, read_wrangle_data(hbr_maples_file))
)
