# Code modified from lterdatasampler package: https://lter.github.io/lterdatasampler/articles/hbr_maples_vignette.html

# Load packages -----------------------------------------------------------

library(tidyverse)


# Load data ---------------------------------------------------------------

hbr_maples <- read_rds("data/hbr_maples.rds")


# Make a boxplot by watershed -------------------------------------------------

ggplot(data = hbr_maples, aes(x = watershed, y = stem_length)) +
  geom_boxplot(aes(color = watershed, shape = watershed),
               alpha = 0.8,
               width = 0.5) +
  geom_jitter(
    aes(color = watershed),
    alpha = 0.5,
    show.legend = FALSE,
    position = position_jitter(width = 0.2, seed = 0)
  ) +
  labs(
    x = "Watershed",
    y = "Stem length (millimeters)",
    title = "Stem Lengths of Sugar Maple Seedlings",
    subtitle = "Hubbard Brook LTER"
  ) +
  facet_wrap(~year) +
  theme_minimal()


# Summary statistics ------------------------------------------------------

maple_summary <- hbr_maples %>% 
  drop_na(stem_length) %>% 
  group_by(year, watershed) %>% 
  summarize(
    mean_length = mean(stem_length),
    median_length = median(stem_length),
    sd_length = sd(stem_length),
    n = n()
  )

maple_summary
