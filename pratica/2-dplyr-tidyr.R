library(dplyr)
library(tidyr)


View(casas)
glimpse(casas)


casas <- readr::read_rds("data/casas.rds")


casas %>%
  summarise(
    across(
      .cols = where(is.character),
      .fns = n_distinct

    )
  ) %>%
  View()

casas %>%
  summarise(across(
    .cols = where(is.character),
    .fns = n_distinct
    )) %>%
  pivot_longer(
    cols = everything(),
    names_to = "variavel",
    values_to = "num_categorias"
    ) %>%
  arrange(desc(num_categorias)) %>%
  View()

skimr::skim(casas)

casas %>%
  summarise(
    across(
    .cols = everything(),
    .fns = ~sum(is.na(.x))
  )
  ) %>%
  pivot_longer(
    cols = everything(),
    names_to = "variavel",
    values_to = "num_na"
  ) %>%
  filter(num_na > 0) %>%
  arrange(desc(num_na)) %>%
  View()


