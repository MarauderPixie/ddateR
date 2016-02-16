#' Converting Greg's to POEE date.
#'
#' @return The current day, season and YOLD. Except it's St. Tib's Day; it's St. Tib's Day then.
#' @export

ddate_convert <- function(greg = Sys.Date()) {
  # days have names and those names want to be recognized. also seasons. and holydays.
  days <- factor(c(1:5), labels = c("Sweetmorn", "Boomtime", "Pungenday", "Prickle-Prickle", "Setting Orange"))
  # The year of the curse of Grayface, the first Year of Our Lady of Discord
  yold <- as.numeric(format(greg, "%Y")) + 1166
  year <- rep(days, length.out = 365)

  # nod <- as.numeric(greg - as.Date("2016-01-01") + 1)
  nod <- lubridate::yday(greg)


  tib_test <- c(((as.numeric(format(greg, "%Y")) %% 4 == F) &
                 (as.numeric(format(greg, "%Y")) %% 100 != F)) |
                 (as.numeric(format(greg, "%Y")) %% 400 == F))

  # Account for St.Tib's
  season_day <- if (tib_test == T && nod >= 61) {nod - 1} else {nod}

  season <- if (nod <=  73) {"Chaos"} else
            if (nod >=  74 && nod <= 146) {"Discord"} else
            if (nod >= 147 && nod <= 219) {"Confusion"} else
            if (nod >= 220 && nod <= 292) {"Bureaucracy"} else
            if (nod >= 293 && nod <= 365) {"The Aftermath"}

  season_day <- if (season == "Chaos") {season_day} else
                if (season == "Discord") {season_day - 73} else
                if (season == "Confusion") {season_day - 146} else
                if (season == "Bureaucracy") {season_day - 219} else
                if (season == "The Aftermath") {season_day - 292}

  holyday <- if (season_day == 5  && season == "Chaos") {"Mungday"} else
             if (season_day == 50 && season == "Chaos") {"Chaoflux"} else
             if (season_day == 5  && season == "Discord") {"Mojoday"} else
             if (season_day == 50 && season == "Discord") {"Discoflux"} else
             if (season_day == 5  && season == "Confusion") {"Syaday"} else
             if (season_day == 50 && season == "Confusion") {"Confuflux"} else
             if (season_day == 5  && season == "Bureaucracy") {"Zaraday"} else
             if (season_day == 50 && season == "Bureaucracy") {"Bureflux"} else
             if (season_day == 5  && season == "The Aftermath") {"Maladay"} else
             if (season_day == 50 && season == "The Aftermath") {"Afflux"} else {"nevermind"}


  # some things are just not meant to be defined (for now).
  if (format(greg, "%d-%m") == "29-02") {
    return(cat("It's St. Tib's Day!"))
  } else {
    nod <- if (tib_test == T && nod >= 61) {nod - 1} else {nod}

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
