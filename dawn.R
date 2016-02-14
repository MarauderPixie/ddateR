## ...?

ddate <- function(){
  days     <- factor(c(1:5), labels = c("Sweetmorn", "Boomtime", "Pungenday", "Prickle-Prickle", "Setting Orange"))
  seasons  <- factor(c(1:5), labels = c("Chaos", "Discord", "Confusion", "Bureaucracy", "The Aftermath"))
  
  holydays <- data.frame("5th"  = c("Mungday", "Mojoday", "Syaday", "Zaraday", "Maladay"),
                         "50th" = c("Chaoflux", "Discoflux", "Confuflux", "Bureflux", "Afflux"))
  holydays.m <- matrix(holydays)
  
  yold <- as.numeric(today$year) + 1166
  
  
  today <- as.list(unlist(strsplit(system("date", T), " ")))
  names(today) <- c("weekday", "day", "month", "time", "timezone", "year")
  
  
  
  return(*object*)
  }

*object* sth sth <- c("%day, %count'th Day of %season in the YOLD %yold")

system(command = 'ddate', intern = T)