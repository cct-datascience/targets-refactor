# Code modified from lterdatasampler package: https://lter.github.io/lterdatasampler/articles/hbr_maples_vignette.html

# load packages -----------------------------------------------------------

library(readr)
library(dplyr)
library(janitor)

# read and wrangle data ---------------------------------------------------

hbr_maples_raw <- read_csv("data/hbr_maples_raw.csv")

hbr_maples <- hbr_maples_raw %>%
  clean_names() %>%
  select(-root_area,-root_length,-root_dry_mass) %>%
  # change values of -999 to NA
  mutate(
    leaf1area = replace(leaf1area, which(leaf1area < 0), NA),
    leaf2area = replace(leaf2area, which(leaf2area < 0), NA),
    corrected_leaf_area = replace(corrected_leaf_area, which(corrected_leaf_area < 0), NA),
    watershed = as.factor(watershed),
    elevation = as.factor(elevation),
    transect = as.factor(transect),
    sample = as.factor(sample)
  )

hbr_maples


# Save wrangled data ------------------------------------------------------

write_rds(hbr_maples, "data/hbr_maples.rds")
