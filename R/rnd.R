#' Hail Eris
#'
#' Use with caution.
#'
#' @return POEE date, lest there's a hiccup
#' @export

ddate <- function() {
  poee <- poee()
  fnord <- fnord()

  lottery <- c(poee, fnord)

  ticket <- sample(lottery, 1, replace = T, prob = c(0.7, 0.3))

  return(ticket)
}
