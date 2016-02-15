#' Converting Greg's to POEE date.
#'
#' @return The current day, season and YOLD. Except it's St. Tib's Day; it's St. Tib's Day then.
#' @export

ddate_convert <- function(greg = Sys.Date()) {
  # days have names and those names want to be recognized. also seasons. and holydays.
  days <- factor(c(1:5), labels = c("Sweetmorn", "Boomtime", "Pungenday", "Prickle-Prickle", "Setting Orange"))
  yold <- as.numeric(format(greg, "%Y")) + 1166
  year <- rep(days, length.out = 365)

  # nod <- as.numeric(greg - as.Date("2016-01-01") + 1)
  nod <- lubridate::yday(greg)

  season <- if (nod <=  73) {"Chaos"} else
            if (nod >=  74 && nod <= 146) {"Discord"} else
            if (nod >= 147 && nod <= 219) {"Confusion"} else
            if (nod >= 220 && nod <= 292) {"Bureaucracy"} else
            if (nod >= 293 && nod <= 365) {"The Aftermath"}

  holyday <- if (nod == 5  && season == "Chaos") {"Mungday"} else
    if (nod == 50 && season == "Chaos") {"Chaoflux"} else
      if (nod == 5  && season == "Discord") {"Mojoday"} else
        if (nod == 50 && season == "Discord") {"Discoflux"} else
          if (nod == 5  && season == "Confusion") {"Syaday"} else
            if (nod == 50 && season == "Confusion") {"Confuflux"} else
              if (nod == 5  && season == "Bureaucracy") {"Zaraday"} else
                if (nod == 50 && season == "Bureaucracy") {"Bureflux"} else
                  if (nod == 5  && season == "The Aftermath") {"Maladay"} else
                    if (nod == 50 && season == "The Aftermath") {"Afflux"} else {"nevermind"}

  season_day <- if (season == "Discord") {nod - 73} else
                if (season == "Confusion") {nod - 146} else
                if (season == "Bureaucracy") {nod - 219} else
                if (season == "The Aftermath") {nod - 292} else

  tib_test <- c(((as.numeric(format(Sys.time(), "%Y")) %% 4 == F) &
                  (as.numeric(format(Sys.time(), "%Y")) %% 100 != F)) |
                  (as.numeric(format(Sys.time(), "%Y")) %% 400 == F))



  # some things are just not meant to be defined (for now).
  if (format(greg, "%d-%m") == "29-02") {
    return(cat("It's St. Tib's Day!"))
  } else {
    if (tib_test == T && nod >= 61) {
      year_tib <- c(rep(as.character(days), length.out = 59),
                    "St. Tib's Day", "Setting Orange",
                    rep(as.character(days), length.out = 305))
      nod <- nod - 1

      return(cat("Today is",
                 paste0(if (holyday != "nevermind") {holyday} else {
                   year[nod]
                 },
                 ", the"),
                 paste0(season_day, "th Day of"),
                 season,
                 "in the YOLD",
                 yold))
    } else {
      return(cat("Today is",
                 paste0(if (holyday != "nevermind") {holyday} else {
                   as.character(year[nod])
                 },
                 ", the"),
                 paste0(season_day, "th Day of"),
                 season,
                 "in the YOLD",
                 yold))
    }
  }
}
