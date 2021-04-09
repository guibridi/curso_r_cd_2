library(dplyr)
library(tidyr)

casas <- readr::read_rds("data/casas.rds")

# a:

casas %>%
  group_by(geral_qualidade) %>%
  summarise(
    acima_solo_area_media = mean(acima_solo_area, na.rm = TRUE),
    garagem_area_media = mean(garagem_area, na.rm = TRUE),
    valor_venda_medio = mean(venda_valor, na.rm = TRUE)
  )

# a_resp:

casas %>%
  group_by(geral_qualidade) %>%
  summarise(
    across(
      .cols = c(acima_solo_area,  garagem_area, venda_valor),
      .fns = mean,
      .names = "{.col}_media",
      na.rm = TRUE
    )
  )

# b:

casas %>%
  filter_at(
    vars(porao_qualidade, varanda_fechada_area, cerca_qualidade),
    ~!is.na(.x)
  )

# b_resp:

casas %>%
  filter(
    across(
        .cols = c(porao_qualidade, varanda_fechada_area, cerca_qualidade),
        .fns = ~!is.na(.x),
          )) %>% View()

# c:

casas %>%
  mutate_if(is.character, ~tidyr::replace_na(.x, replace = "Não possui"))

# c_resp:

casas %>%
  mutate(
    across(
      .cols = where(is.character),
      .fns = ~replace_na(.x,"Não possui")
    )
  ) %>% View()
