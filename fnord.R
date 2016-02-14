fnord <- function(){
  sermon <- c("RUN!",
              "You said something...?",
              "It is pitch black.",
              "You are likely to be eaten by a grue.",
              "If you can't see it",
              "Feeling dizzy?",
              "IF YOU DON'T SEE THE FNORD IT CAN'T EAT YOU",
              "Don't forget your towel.",
              "Hail Eris.",
              "stub",
              "thud",
              "Did you hear that?")
  
  use <- sample(sermon, 1, replace = T)
  
  return(use)
}