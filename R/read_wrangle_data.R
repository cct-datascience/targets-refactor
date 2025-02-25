read_wrangle_data <- function(maples_file) {
  maples_raw <- read.csv(maples_file)
  
  maples_raw %>%
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
    )  %>%
    #copied from 03-fit_models.R. Seems like should be part of this step
    mutate(total_mass = stem_dry_mass + leaf_dry_mass)
  
}