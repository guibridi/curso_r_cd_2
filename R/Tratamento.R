`%>%` <- magrittr::`%>%`

df <- mtcars %>%
  dplyr::filter(cyl > 4)

readr::write_rds(df, "data/df.rds")

usethis::use_data(df)
