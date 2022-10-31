make_plot_model <- function(stem_lm) {
  stem_lm %>% 
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
  
}