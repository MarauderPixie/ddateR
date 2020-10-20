#' Fnord.
#'
#' Join the KSC now. Defnordify the world. Peace out.
#'
#' @return Sacred sermons of the POEE as scribed by pope Pixie Marauder I

fnord <- function(){
  sermon <- c("RUN!",
              "You said something...?",
              "It is pitch black.",
              "You are likely to be eaten by a grue.",
              "Feeling dizzy?",
              "IF YOU DON'T SEE THE FNORD IT CAN'T EAT YOU",
              "Don't forget your towel.",
              "Hail Eris.",
              "All hail Discordia.",
              "thud",
              "Did you hear that?",
              "fnord",
              "Dull but sincere filler.",
              "Tao Fa Tsu-Dan.",
              "Oh that guy? Man, he's got issues.",
              "Better not mess with that lizard folk.",
              "If the phone rings today, water it!",
              "Reality is the original Rorschach.",
              "Convictions cause convicts.",
              "It's not you, it's determinism.",
              "...",
              "7. never write in pencil unless you are on a train or sick in bed.",
              "Did you know you have a lopsided pineal gland?",
              "Why'd the chicken cross the road.",
              # "Yo mama's so... wait, that's not right.",
              "WATCH OUT!!",
              "Don't eat the yellow snow. Unless you're into that kind of thing, then sure, go ahead, I guess.",
              "00034",
              "Or not.",
              "The uproar of one hand clapping.",
              "ODD# II/2,xii;68Chs3136",
              "Five is right out.")

  use <- sample(sermon, 1, replace = T)

  return(use)
}
