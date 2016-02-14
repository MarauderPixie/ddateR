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
              "Did you hear that?",
              "fnord",
              "Dull but sincere filler.",
              "Tao Fa Tsu-Dan.",
              "If the phone rings today, water it!",
              "Reality is the original Rorschach.",
              "Convictions cause convicts.",
              "It's not you, it's determinism.",
              "...",
              "7. never write in pencil unless you are on a train or sick in bed.",
              "Did you know you have a lopsided pineal gland?",
              "Why did the chicken cross the road.",
              "Yo mama's so... wait, that's not right.")
  
  use <- sample(sermon, 1, replace = T)
  
  return(use)
}