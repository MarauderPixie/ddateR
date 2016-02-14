## ...?

ddate <- function() {
  # days have names and those names want to be recognized. also seasons. and holydays.
  days     <- factor(c(1:5), labels = c("Sweetmorn", "Boomtime", "Pungenday", "Prickle-Prickle", "Setting Orange"))
  seasons  <- factor(c(1:5), labels = c("Chaos", "Discord", "Confusion", "Bureaucracy", "The Aftermath"))
  
  holydays <- data.frame("5th"  = c("Mungday", "Mojoday", "Syaday", "Zaraday", "Maladay"),
                         "50th" = c("Chaoflux", "Discoflux", "Confuflux", "Bureflux", "Afflux"))
  holydays.m <- matrix(holydays)
  
  # getting to the YOLD by means of simple arithmetics, at last something they are useful for.
  # not sure how to continue after Chaos; maybe the Eschaton has immanentized by then
  yold <- as.numeric(format(Sys.time(), "%Y")) + 1166
  year <- rep(days, length.out = 365)
    chaos       <- year[1:73]
    discord     <- year[74:146]
    confusion   <- year[147:219]
    bureaucracy <- year[220:292]
    aftermath   <- year[293:365]
    # this is actually just for your convenience and serves no purpose at all
  
  # maybe it's useful to look at how Greg does it
  # today <- as.list(unlist(strsplit(system("date", T), " ")))
  # names(today) <- c("weekday", "day", "month", "time", "timezone", "year")
  
  nod <- as.numeric(Sys.Date() - as.Date("2016-01-01") + 1)
  # nod <- lubridate::yday(Sys.Date())
  
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
  
  tib_test <- c(((as.numeric(format(Sys.time(), "%Y")) %% 4 == F) &
                 (as.numeric(format(Sys.time(), "%Y")) %% 100 != F)) | 
                 (as.numeric(format(Sys.time(), "%Y")) %% 400 == F))
             
  
  
  # some things are just not meant to be defined (for now).
  if (format(Sys.Date(), "%d-%m") == "29-02") {
    return(cat("It's St. Tib's Day!"))
  } else {
    if (tib_test == T) {
      year_tib <- c(rep(as.character(days), length.out = 59),
                    "St. Tib's Day", "Setting Orange",
                    rep(as.character(days), length.out = 305))
      
      return(cat("Today is", 
                 paste0(if (holyday != "nevermind") {holyday} else {
                   year_tib[nod]
                 },
                 ", the"), 
                 paste0(nod, "th Day of"), 
                 season, 
                 "in the YOLD", 
                 yold))
    } else {
      return(cat("Today is", 
                 paste0(if (holyday != "nevermind") {holyday} else {
                   as.character(year[nod])
                 },
                 ", the"), 
                 paste0(nod, "th Day of"), 
                 season, 
                 "in the YOLD", 
                 yold))
      }
    }
  }


# more or less useless scribbles. that's how nature works, man.
*object* sth sth <- c("%day, %count'th Day of %season in the YOLD %yold")

nod <- as.numeric(Sys.Date() - as.Date("2016-01-01"))
print(paste0("Today is ", year[nod]))


  # Acoount for St. Tib's Day

    # if 60th day of chaos is not Setting Orange then St. Tib's Day

if (nod == 60 && season == "Chaos" && as.character(year[nod]) != "Setting Orange") {"It's St. Tib's Day!"} else {year[nod]}
