#' Converting Greg's to POEE date.
#'
#' @param greg The date in standard ISO 8601 date format, e.g. \code{2016-02-18}.
#' @return The current (or given) day, season and YOLD. Except it's St. Tib's Day; it's St. Tib's Day then.
#' @export

poee <- function(greg = Sys.Date()) {
  # days have names and those names want to be recognized. also seasons. and holydays.
  days <- factor(c(1:5), labels = c("Sweetmorn", "Boomtime", "Pungenday", "Prickle-Prickle", "Setting Orange"))
  # The year of the curse of Grayface, the first Year of Our Lady of Discord
  yold <- as.numeric(format(greg, "%Y")) + 1166
  year <- rep(days, length.out = 365)
  
  # nod <- as.numeric(greg - as.Date("2016-01-01") + 1)
  nod <- unclass(as.POSIXlt(greg))$yday +1
  
  tib_test <- c(((as.numeric(format(greg, "%Y")) %% 4 == F) &
                  (as.numeric(format(greg, "%Y")) %% 100 != F)) |
                  (as.numeric(format(greg, "%Y")) %% 400 == F))
  
  # Account for St.Tib's
  season_day <- if (tib_test == T && nod >= 61) {nod - 1} else {nod}
  
  season <- if (season_day <=  73) {"Chaos"} else
    if (season_day >=  74 && season_day <= 146) {"Discord"} else
      if (season_day >= 147 && season_day <= 219) {"Confusion"} else
        if (season_day >= 220 && season_day <= 292) {"Bureaucracy"} else
          if (season_day >= 293 && season_day <= 366) {"The Aftermath"}
  
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
  
  
  # with a little help from the all-knowing dumpster
  stndrdth <- function(black_metal) {
    gwargh <- c("st", "nd", "rd", rep("th", 17))
    gwargh[((black_metal - 1) %% 10 + 1) + 10 *
             (((black_metal %% 100) %/% 10) == 1)]
  }
  
  
  # now get it out!
  if (format(greg, "%d-%m") == "29-02") {
    tib <- "It's St. Tib's Day!"
    
    return(tib)
    invisible(tib)
  } else {
    if (holyday != "nevermind") {
      holy <- paste("It is",
                    holyday,
                    "in the YOLD",
                    paste0(yold, "! Celebrate!"))
      
      return(holy)
      invisible(holy)
    } else {
      nod <- if (tib_test == T && nod >= 61) {nod - 1} else {nod}
      
      yand <- paste("Today is",
                    paste0(as.character(year[season_day]), ", the"),
                    paste0(season_day, stndrdth(season_day), " Day of"),
                    season,
                    "in the YOLD",
                    yold)
      
      return(yand)
      invisible(yand)
    }
  }
}
