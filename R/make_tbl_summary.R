make_tbl_summary <- function(maples) {
  maple_summary <- maples %>% 
    drop_na(stem_length) %>% 
    group_by(year, watershed) %>% 
    summarize(
      mean_length = mean(stem_length),
      median_length = median(stem_length),
      sd_length = sd(stem_length),
      n = n()
    )
  
  maple_summary
  
}