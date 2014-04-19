remove_non_ascii <- function(data,
                             language,
                             changes_file = TRUE,
                             interactive = FALSE){

  # Count number of values provided in 'language'
  number_of_languages <- length(language)
  
  # Get transliterations into data frame
  for (i in 1:number_of_languages){
    if (i == 1) transliterations <- data.frame()
    transliterations.gotten <- get.transliterations(language[i])
    transliterations <- rbind(transliterations, transliterations.gotten)
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
        
      }
      
    }
    
  }
  
  data_out <- data_in
  
  
  return(data_out)
  
  # End function
}

