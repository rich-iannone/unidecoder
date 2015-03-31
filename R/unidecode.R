#' Transliterate unicode strings to ascii text
#' @description Transliterate strings from containing Unicode text to ascii text.
#' @param data a vector of character data.
#' @param language the name of the source language for the text to be processed.
#' @param changes_file determines whether a text file with the changes made during text processing should be generated.
#' @param interactive a choice of whether the function should be performed using an interactive mode. If TRUE, all potential transliterations will be summarized and presented and then individual changes can be made.
#' @export unidecode

unidecode <- function(data,
                      language,
                      changes_file = TRUE,
                      interactive = FALSE){
  
  # Count number of values provided in 'language'
  number_of_languages <- length(language)
  
  # Get transliterations into data frame
  for (i in 1:number_of_languages){
    
    # Initialize an empty data frame to store all transliteration types
    if (i == 1) transliterations <- data.frame()
    
    # Get the transliteration data frame for the language(s) and
    # succesively bind data frames
    transliterations_gotten <- get_transliterations(language[i])
    transliterations <- rbind(transliterations, transliterations_gotten)
  }

  for (i in 1:nrow(transliterations)){
    if (i == 1) {
      data_in <- data
      changes <- as.data.frame(mat.or.vec(nc = 3, nr = 0))
      colnames(changes) <- c("type", "index", "change")
    }
    
    from <- transliterations[i, 1]
    to <- transliterations[i, 2]
    
    for (j in 1:length(data_in)){
      
      if (grepl(from, data_in[j]) == TRUE){
        data_in[j] <- gsub(from, to, data_in[j])
        the_changes <- data.frame(type = transliterations[i, 3],
                                  index = j,
                                  change = paste(from, " -> ", to, sep = ''),
                                  stringsAsFactors = FALSE)
        
        changes <- rbind(changes, the_changes)
        
        changes <- changes[with(changes, order(index)), ]
      }
    }
  }
  
  data_out <- data_in
  
  return(data_out)
}
