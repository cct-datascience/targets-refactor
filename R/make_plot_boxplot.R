make_plot_boxplot <- function(maples) {
  ggplot(data = maples, aes(x = watershed, y = stem_length)) +
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
}