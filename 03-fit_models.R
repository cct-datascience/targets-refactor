# Code modified from lterdatasampler package: https://lter.github.io/lterdatasampler/articles/hbr_maples_vignette.html

# Load packages -----------------------------------------------------------

library(dplyr)
library(car) # for Anova()
library(broom) # for tidy() and augment()
library(ggplot2)

# Read in data ------------------------------------------------------------

maples <- readRDS("data/maples.rds")

# Calculate total mass ----------------------------------------------------

maples <- 
  maples %>%
  mutate(total_mass = stem_dry_mass + leaf_dry_mass)

# Fit model --------------------------------------------------------------

# is stem length a good predictor of total mass? does that relationship depend on watershed?

stem_lm2 <- lm(total_mass ~ stem_length * watershed, data = maples)

# Hypothesis testing ------------------------------------------------------

Anova(stem_lm2) %>% tidy()


# Plot model fit ----------------------------------------------------------

stem_lm2 %>% 
  augment(interval = "confidence") %>%
  ggplot(aes(x = stem_length, color = watershed)) +
  geom_line(aes(y = .fitted)) +
  geom_ribbon(
    aes(
      ymax = .upper,
      ymin = .lower,
      color = NULL,
      fill = watershed
    ),
    alpha = 0.4
  ) +
  geom_point(aes(y = total_mass)) +
  scale_color_discrete(
    "Watershed", 
    labels = c("W1" = "Calcium-treated"),
    aesthetics = c("fill", "color")
  ) +
  labs(
    x = "Stem length (mm)",
    y = "Seedling mass (g)",
    caption = "Error = ± 95% CI"
  ) +
  theme_classic()
