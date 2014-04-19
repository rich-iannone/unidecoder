get.transliterations <- function(language){
  
  if ("German" %in% language | "german" %in% language |
        "Deutsch" %in% language | "deutsch" %in% language |
        "DE" %in% language | "de" %in% language){
    transliterations_DE <-
      data.frame(from = c("ß", "Ä", "Ö", "Ü", "ä", "ö", "ü"),
                 to = c("ss", "Ae", "Oe", "Ue", "ae", "oe", "ue"),
                 type = rep("DE"), stringsAsFactors = FALSE)
    
    return(transliterations_DE)
  }

  # End function
}

