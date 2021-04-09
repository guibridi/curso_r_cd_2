#'
#'
#'
#'
#' Título
#'
#' Descrição
#'
#' @param tabela Uma tabela
#' @param coluna Nome de uma coluna
#'
#' @return Um número
#'

tirar_media <- function(tabela, coluna){
  mean(tabela[[coluna]], na.rm = TRUE)
}

