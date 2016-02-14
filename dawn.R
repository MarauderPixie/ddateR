## ...?

ddate <- function(){
  # days have names and those names want to be recognized. also seasons. and holydays.
  days     <- factor(c(1:5), labels = c("Sweetmorn", "Boomtime", "Pungenday", "Prickle-Prickle", "Setting Orange"))
  seasons  <- factor(c(1:5), labels = c("Chaos", "Discord", "Confusion", "Bureaucracy", "The Aftermath"))
  
  holydays <- data.frame("5th"  = c("Mungday", "Mojoday", "Syaday", "Zaraday", "Maladay"),
                         "50th" = c("Chaoflux", "Discoflux", "Confuflux", "Bureflux", "Afflux"))
  holydays.m <- matrix(holydays)
  
  # getting to the YOLD by means of simple arithmetics, at last something they are useful for.
  # not sure how to continue after Chaos; maybe the Eschaton has immanentized by then
  yold  <- as.numeric(today$year) + 1166
  chaos <- rep(days, length.out = 73)
  
  
  # maybe it's useful to look at how Greg does it
  today <- as.list(unlist(strsplit(system("date", T), " ")))
  names(today) <- c("weekday", "day", "month", "time", "timezone", "year")
  
  # some things are just not meant to be defined (for now).
  return(*object*)
  }


# more or less useless scribbles. that's how nature works, man.
*object* sth sth <- c("%day, %count'th Day of %season in the YOLD %yold")
