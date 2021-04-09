`%>%` <- magrittr::`%>%`

df <- mtcars %>%
  dplyr::filter(cyl > 4)

readr::write_rds(df, "data/df.rds")

mtcars <- mtcars

readr::write_csv(mtcars, "data_raw/mtcars.csv")


usethis::use_github()

usethis::create_github_token()


usethis::use_git_config(
  user.name = "guibridi",
  user.email = "guilhermebride@gmail.com"
  )

