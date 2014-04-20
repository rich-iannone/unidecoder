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
  
  if ("French" %in% language | "french" %in% language |
        "Français" %in% language | "français" %in% language |
        "fr" %in% language | "FR" %in% language){
    transliterations_FR <-
      data.frame(from = c("À", "Á", "Â", "Ä", "Æ", "È", "É", "Ê",
                          "Ë", "Î", "Ï", "Í", "Ì", "Ò", "OŒ", "Ü",
                          "Ç",
                          "à", "á", "â", "ä", "æ", "è", "é", "ê",
                          "ë", "î", "ï", "í", "ì", "ò", "œ", "ü",
                          "ç"),
                 to = c("A", "A", "A", "A", "Ae", "E", "E", "E",
                        "E", "I", "I", "I", "I", "O", "Oe", "U",
                        "C",
                        "a", "a", "a", "a", "ae", "e", "e", "e",
                        "e", "i", "i", "i", "i", "o", "oe", "u",
                        "c"),
                 type = rep("FR"), stringsAsFactors = FALSE)
    
    return(transliterations_FR)
  }

  if ("Polish" %in% language | "polish" %in% language |
        "Język Polski" %in% language | "język polski" %in% language |
        "pl" %in% language | "PL" %in% language){
    transliterations_PL <-
      data.frame(from = c("Ą", "ą", "Ć", "ć", "Ę", "ę", "Ł", "ł",
                          "Ń", "ń", "Ó", "ó", "Ś", "ś", "Ź", "ź",
                          "Ż", "ż"),
                 to = c("A", "a", "C", "c", "E", "e", "L", "l",
                        "N", "n", "O", "o", "S", "s", "Z", "z",
                        "Z", "z"),
                 type = rep("PL"), stringsAsFactors = FALSE)
    
    return(transliterations_PL)
  }
    
  if (language == "all"){
    
    data(transliterations_all)
    
    return(transliterations_all)
  }

  # End function
}

