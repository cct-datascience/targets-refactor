#maples = the data frame created by the `maples` target
fit_model <- function(maples) {
  lm(total_mass ~ stem_length * watershed, data = maples)
}