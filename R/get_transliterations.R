#' Obtain table of transliterations
#' @description This function returns a data frame with transliterations for a specific language, or, a large default set of transliterations that is language agnostic. The function is primarly called by the 'unidecode' function.
#' @param language the name of the source language for the text to be processed.
#' @export get_transliterations

get_transliterations <- function(language = c("bulgarian", "български език", "bǎlgarski ezik", "bg",
                                              "czech", "čeština", "český jazyk", "cs",
                                              "french", "français", "fr",
                                              "georgian", "kartuli", "ქართული", "ka",
                                              "german", "deutsch", "deutsche Sprache", "de",
                                              "greek", "ελληνικά",  "el",
                                              "polish", "język polski", "pl",
                                              "romanian", "limba română", "ro",
                                              "russian", "русский язык", "ru",
                                              "slovene", "slovenian", "slovenski jezik", "slovenščina", "sl",
                                              "all")){

  language <- tolower(language)
  language <- match.arg(language, several.ok = TRUE)

  
  # Bulgarian -- Streamlined system (2006) with -ia-exception
  if (any(c("bulgarian", "български език", "bǎlgarski ezik", "bg") %in% language)){
    transliterations_bg <-
      data.frame(from = c("България",
                          "А", "а", "Б", "б", "В", "в", "Г", "г",
                          "Д", "д", "Е", "е", "З", "з", "И", "и",
                          "К", "к", "Л", "л", "М", "м", "Н", "н",
                          "О", "о", "П", "п", "Р", "р", "С", "с",
                          "Т", "т", "Ф", "ф", "Ж", "ж", "Ч",
                          "ч", "Ш", "ш", "Щ", "щ", "Ц", "ц", "Х",
                          "х", "Й", "й", "Ю", "ю", "Я", "я", "Ь",
                          "ь", "У", "у", "Ъ", "ъ"),
                 to = c("Bulgaria",
                        "A", "a", "B", "b", "V", "v", "G", "g",
                        "D", "d", "E", "e", "Z", "z", "I", "i",
                        "K", "k", "L", "l", "M", "m", "N", "n",
                        "O", "o", "P", "p", "R", "r", "S", "s",
                        "T", "t", "F", "f", "Zh", "zh", "Ch",
                        "ch", "Sh", "sh", "Sht", "sht", "Ts", "ts", "H",
                        "h", "Y", "y", "Yu", "yu", "Ya", "ya", "Y",
                        "y", "U", "u", "A", "a"),
                 type = rep("bg"), stringsAsFactors = FALSE)
    
    return(transliterations_bg)
  }
  
  # Czech -- Simple mapping of characters with diacritics to the
  #          same character without a diacritic
  if (any(c("czech", "čeština", "český jazyk", "cs") %in% language)){
    transliterations_cs <-
      data.frame(from = c("Á", "á", "Č", "č", "Ď", "ď", "É", "é",
                          "Ě", "ě", "Í", "í", "Ň", "ň", "Ó", "ó",
                          "Ř", "ř", "Š", "š", "Ť", "ť", "Ú", "ú",
                          "Ů", "ů", "Ý", "ý", "Ž", "ž", "„", "“"),
                 to = c("A", "a", "C", "c", "D", "d", "E", "e",
                        "E", "e", "I", "i", "N", "n", "O", "o",
                        "R", "r", "S", "s", "T", "t", "U", "u",
                        "U", "u", "Y", "y", "Z", "z", "\"", "\""),
                 type = rep("cs"), stringsAsFactors = FALSE)

    return(transliterations_cs)
  }

  # French -- Simple mapping of characters with diacritics to the
  #           same character without a diacritic
  if (any(c("french", "français", "fr") %in% language)){
    transliterations_fr <-
      data.frame(from = c("À", "Á", "Â", "Ä", "Æ", "È", "É", "Ê",
                          "Ë", "Î", "Ï", "Í", "Ì", "Ô", "Ò", "Œ",
                          "Ü", "Ç", "à", "á", "â", "ä", "æ", "è",
                          "é", "ê", "ë", "î", "ï", "í", "ì", "ò",
                          "œ", "ü", "ç", "«", "»"),
                 to = c("A", "A", "A", "A", "Ae", "E", "E", "E",
                        "E", "I", "I", "I", "I", "O", "O", "Oe",
                        "U", "C", "a", "a", "a", "a", "ae", "e",
                        "e", "e", "e", "i", "i", "i", "i", "o",
                        "oe", "u", "c", "\"", "\""),
                 type = rep("fr"), stringsAsFactors = FALSE)

    return(transliterations_fr)
  }

  # Georgian -- National system for romanization (2002)
  if (any(c("georgian", "kartuli", "ქართული", "ka") %in% language)){
    transliterations_ka <-
      data.frame(from = c("ა", "ბ", "გ", "დ", "ე", "ვ", "ზ", "თ",
                          "ი", "კ", "ლ", "მ", "ნ", "ო", "პ", "ჟ",
                          "რ", "ს", "ტ", "უ", "ფ", "ქ", "ღ", "ყ",
                          "შ", "ჩ", "ც", "ძ", "წ", "ჭ", "ხ", "ჯ",
                          "ჰ"),
                 to = c("a", "b", "g", "d", "e", "v", "z", "t",
                        "i", "k'", "l", "m", "n", "o", "p'", "zh",
                        "r", "s", "t'", "u", "p", "k", "gh", "q'",
                        "sh", "ch", "ts", "dz", "ts'", "ch'", "kh", "j",
                        "h"),
                 type = rep("ka"), stringsAsFactors = FALSE)

    return(transliterations_ka)
  }
  
  # German -- Common transliteration of German Umlauts
  #           See Duden - Band 1: "Die deutsche Rechtschreibung", Mannheim, 2001,
  #           p. 105f., "Maschinenschreiben und E-Mails"
  if (any(c("german", "deutsch", "deutsche Sprache", "de") %in% language)){
    transliterations_de <-
      data.frame(from = c("ß", "Ä", "Ö", "Ü", "ä", "ö", "ü"),
                 to = c("ss", "Ae", "Oe", "Ue", "ae", "oe", "ue"),
                 type = rep("de"), stringsAsFactors = FALSE)

    return(transliterations_de)
  }

  # Greek -- Phonetic transcription into latin characters as there is
  #          no authoritive standard
  if (any(c("greek", "ελληνικά",  "el") %in% language)){
    transliterations_el <-
      data.frame(from = c("Α", "α", "Ά", "ά", "Β", "β", "Γ", "γ",
                          "Δ", "δ", "Ε", "ε", "Έ", "έ", "Ζ", "ζ",
                          "Η", "η", "Ή", "ή", "Θ", "θ", "Ι", "ι",
                          "Ί", "ί", "Ϊ",  "ϊ", "ΐ", "Κ", "κ",
                          "Λ", "λ", "Μ", "μ", "Ν", "ν", "Ξ", "ξ",
                          "Ο", "ο", "Ό", "ό", "Π", "π", "Ρ", "ρ",
                          "Σ", "σ", "Τ", "τ", "Υ", "υ", "Ύ", "ύ",
                          "Ϋ", "ϋ", "ΰ", "Φ", "φ", "Χ", "χ",
                          "Ψ", "ψ", "Ω", "ω", "Ώ", "ώ", "ς",
                          ";", ";", "·", "‿", "΄", "΅", "͂", "̓",
                          "̓", "̔",
                          "ͅ",
                          "ει", "έι", "εί", "ευ", "έυ", "εύ",
                          "ου", "ού", "όυ"),
                 to = c("A", "a", "A", "a", "V", "v", "Y", "y",
                        "D", "d", "E", "e", "E", "e", "Z", "z",
                        "I", "i", "I", "i", "Th", "th", "I", "i",
                        "I", "i", "I", "i", "i", "K", "k",
                        "L", "l", "M", "m", "N", "n", "X", "x",
                        "O", "o", "O", "o", "P", "p", "R", "r",
                        "S", "s", "T", "t", "I", "i", "I", "i",
                        "I", "i", "i", "F", "f", "H", "h",
                        "Ps", "ps", "O", "o", "O", "o", "s",
                        "?", "?", ";", "-", "", "", "", "",
                        "", "",
                        "",
                        "i", "i", "i", "ef", "ef", "ef",
                        "u", "u", "u"),
                 type = rep("el"), stringsAsFactors = FALSE)

    return(transliterations_el)
  }

  # Polish -- Simple mapping of characters with diacritics to the
  #           same character without a diacritic
  if (any(c("polish", "język polski", "pl") %in% language)){
    transliterations_pl <-
      data.frame(from = c("Ą", "ą", "Ć", "ć", "Ę", "ę", "Ł", "ł",
                          "Ń", "ń", "Ó", "ó", "Ś", "ś", "Ź", "ź",
                          "Ż", "ż"),
                 to = c("A", "a", "C", "c", "E", "e", "L", "l",
                        "N", "n", "O", "o", "S", "s", "Z", "z",
                        "Z", "z"),
                 type = rep("pl"), stringsAsFactors = FALSE)

    return(transliterations_pl)
  }

  # Romanian -- Simple mapping of characters with diacritics to the
  #             same character without a diacritic
  if (any(c("romanian", "limba română", "ro") %in% language)){
    transliterations_ro <-
      data.frame(from = c("Ă", "ă", "Â", "â", "Î", "î", "Ș", "ș",
                          "Ş", "ş", "Ț", "ț", "Ţ", "ţ"),
                 to = c("A", "a", "A", "a", "I", "i", "S", "s",
                        "S", "s", "T", "t", "T", "t"),
                 type = rep("ro"), stringsAsFactors = FALSE)

    return(transliterations_ro)
  }

  # Russian
  if (any(c("russian", "русский язык", "ru") %in% language)){
    transliterations_ru <-
      data.frame(from = c("Б", "б", "В", "в", "Г", "г", "Д", "д",
                          "Ё", "ё", "Ж", "ж", "З", "з", "И", "и",
                          "Й", "й", "К", "к", "Л", "л", "М", "м",
                          "Н", "н", "О", "о", "П", "п", "Р", "р",
                          "С", "с", "Т", "т", "У", "у", "Ф", "ф",
                          "Х", "х", "Ц", "ц", "Ч", "ч", "Ш", "ш",
                          "Щ", "щ", "Ъ", "ъ", "Ы", "ы", "Ь", "ь",
                          "Э", "э", "Ю", "ю", "Я", "я"),
                 to = c("B", "b", "V", "v", "G", "g", "D", "d",
                        "Yo", "yo", "Zh", "zh", "Z", "z", "I", "i",
                        "J", "j", "K", "k", "L", "l", "M", "m",
                        "N", "n", "O", "o", "P", "p", "R", "r",
                        "C", "c", "T", "t", "U", "u", "F", "f",
                        "Kh", "kh", "Cz", "cz", "Ch", "ch", "Sh", "sh",
                        "Shh", "shh", "\"", "\"", "Y'", "y'", "'", "'",
                        "E'", "e'", "Yu", "yu", "Ya", "ya"),
                 type = rep("ru"), stringsAsFactors = FALSE)
    
    return(transliterations_ru)
  }
  
  # Slovenian -- Simple mapping of characters with diacritics to the
  #              same character without a diacritic
  if (any(c("slovene", "slovenian", "slovenski jezik", "slovenščina", "sl") %in% language)){
    transliterations_sl <-
      data.frame(from = c("Č", "č", "É", "é", "Í", "í", "Ó", "ó",
                          "Š", "š", "Ž", "ž"),
                 to = c("C", "c", "E", "e", "I", "i", "O", "o",
                        "S", "s", "Z", "z"),
                 type = rep("sl"), stringsAsFactors = FALSE)

    return(transliterations_sl)
  }

  if (language == "all"){

    data(transliterations_all)

    return(transliterations_all)
  }
}
