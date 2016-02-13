days <- factor(c("Sweetmorn", "Boomtime", "Pungenday", "Prickle-Prickle", "Setting Orange"))
seasons <- factor(c("Chaos", "Discord", "Confusion", "Bureaucracy", "The Aftermath"))

holydays <- data.frame("5th"  = c("Mungday", "Mojoday", "Syaday", "Zaraday", "Maladay"),
                       "50th" = c("Chaoflux", "Discoflux", "Confuflux", "Bureflux", "Afflux"))
## ...?
holydays.m <- matrix(holydays)

ddate <- function(){
  days     <- factor(c("Sweetmorn", "Boomtime", "Pungenday", "Prickle-Prickle", "Setting Orange"))
  seasons  <- factor(c("Chaos", "Discord", "Confusion", "Bureaucracy", "The Aftermath"))
  
  holydays <- data.frame("5th"  = c("Mungday", "Mojoday", "Syaday", "Zaraday", "Maladay"),
                         "50th" = c("Chaoflux", "Discoflux", "Confuflux", "Bureflux", "Afflux"))
  
  today <- as.list(unlist(strsplit(system("date",T)," ")))
  names(today)<-c("weekday","month","day","time","timezone","year")
  
  YOLD <- as.numeric(today$year) + 1166
  return(*object*)
  }

system(command = 'ddate', intern = T)