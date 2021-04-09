install.packages("remotes")
remotes::install_github("dados")

`%>%` <- magrittr::`%>%`

casas <- readRDS("data/ames.rds")

dplyr::glimpse(casas)

library(dplyr)

casas %>%
  dplyr::group_by(geral_qualidade) %>%
  dplyr::summarize(
    lote_area_media = mean(lote_area, na.rm = TRUE),
    venda_valor_medio = mean(venda_valor, na.rm = TRUE)
  )

casas %>%
  dplyr::group_by(geral_qualidade) %>%
  dplyr::summarize_at(
    .vars = dplyr::vars(lote_area, venda_valor),
    .funs = ~mean(.x, na.rm = TRUE)
    )

casas %>%
  dplyr::group_by(geral_qualidade) %>%
  dplyr::summarize(dplyr::across(
    .cols = c(lote_area, venda_valor),
    .fns = mean,
    na.rm = TRUE
  ))

casas %>%
  dplyr::group_by(geral_qualidade) %>%
  dplyr::summarize(dplyr::across(
    .cols = c(lote_area, venda_valor),
    .fns = list(media = mean, mediana = median),
    na.rm = TRUE
  ))

casas %>%
  dplyr::group_by(geral_qualidade) %>%
  dplyr::summarize(dplyr::across(
    .cols = c(lote_area, venda_valor),
    .fns = list(media = mean, mediana = median),
    na.rm = TRUE,
    .names = "{.fn}_{.col}"
  ))

casas %>%
  dplyr::group_by(geral_qualidade) %>%
  dplyr::summarise(across(.fns = dplyr::n_distinct))

casas %>%
  summarise(across(
    where(is.numeric) & ends_with("_area"), mean, na.rm = TRUE))


