#' Transliterate unicode strings to ascii text
#' @description Transliterate strings from containing Unicode text to ascii text.
#' @param data a vector of character data.
#' @param language the name of the source language for the text to be processed.
#' @param changes_df determines whether a text file with the changes made during text processing should be generated.
#' @export unidecode

unidecode <- function(data,
                      language,
                      changes_df = FALSE){
  
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
      changes <- as.data.frame(mat.or.vec(nc = 6, nr = 0))
      colnames(changes) <- c("type", "index", "from_char", "to_char",
                             "from_word", "to_word")
    }
    
    from <- transliterations[i, 1]
    to <- transliterations[i, 2]
    
    for (j in 1:length(data_in)){
      
      if (grepl(from, data_in[j]) == TRUE){
        
        from_word <- grep(from, unlist(strsplit(data_in[j], " ")), value = TRUE)
        
        from_word <- gsub("\\W", "", from_word)
        
        to_word <- gsub(from, to, from_word)
        
        data_in[j] <- gsub(from, to, data_in[j])
      
        the_changes <- data.frame(type = transliterations[i, 3],
                                  index = j,
                                  from_char = from,
                                  to_char = to,
                                  from_word = from_word,
                                  stringsAsFactors = FALSE)
        
        changes <- rbind(changes, the_changes)
        
        changes <- changes[with(changes, order(index)), ]
        rownames(changes) <- NULL
      }
    }
  }
  
  data_out <- data_in
  
  if (changes_df == FALSE){
    return(data_out)
  }
  
  if (changes_df == TRUE){
    out_changes <- list("translit_text" = data_out, "translit_changes" = changes)
    return(out_changes)
  }
  
}
