<img src="inst/UnidecodeR.png" width="100%">

While Unicode characters are undeniably important, there can be occasions where you need text only in US-ASCII format. This is where the **R** package **UnidecodeR** can help. Provide text to **UnidecodeR** and it will replace accented letters, ligatures, and other Unicode characters with US-ASCII equivalents.

### Installation

Install **UnidecodeR** from GitHub using the **devtools** package.

```R
devtools::install_github('rich-iannone/UnidecodeR')
```

### Examples

Take, for example, Goethe's *Totentanz*:

```

	Der Türmer, der schaut zu Mitten der Nacht
	Hinab auf die Gräber in Lage;
	Der Mond, der hat alles ins Helle gebracht;
	Der Kirchhof, er liegt wie am Tage.
	Da regt sich ein Grab und ein anderes dann:
	Sie kommen hervor, ein Weib da, ein Mann,
	In weißen und schleppenden Hemden.
	 
	Das reckt nun, es will sich ergetzen sogleich,
	Die Knöchel zur Runde, zum Kranze,
	So arm und so jung, und so alt und so reich;
	Doch hindern die Schleppen am Tanze.
	Und weil hier die Scham nun nicht weiter gebeut,
	Sie schütteln sich alle, da liegen zerstreut
	Die Hemdlein über den Hügeln.
	 
	Nun hebt sich der Schenkel, nun wackelt das Bein,
	Gebärden da gibt es vertrackte;
	Dann klippert's und klappert's mitunter hinein,
	Als schlüg' man die Hölzlein zum Takte.
	Das kommt nun dem Türmer so lächerlich vor;
	Da raunt ihm der Schalk, der Versucher, ins Ohr:
	Geh! hole dir einen der Laken.
	 
	Getan wie gedacht! und er flüchtet sich schnell
	Nun hinter geheiligte Türen.
	Der Mond, und noch immer er scheinet so hell
	Zum Tanz, den sie schauderlich führen.
	Doch endlich verlieret sich dieser und der,
	Schleicht eins nach dem andern gekleidet einher,
	Und, husch, ist es unter dem Rasen.
	 
	Nur einer, der trippelt und stolpert zuletzt
	Und tappet und grapst an den Grüften;
	Doch hat kein Geselle so schwer ihn verletzt,
	Er wittert das Tuch in den Lüften.
	Er rüttelt die Turmtür, sie schlägt ihn zurück,
	Geziert und gesegnet, dem Türmer zum Glück,
	Sie blinkt von metallenen Kreuzen.
	 
	Das Hemd muß er haben, da rastet er nicht,
	Da gilt auch kein langes Besinnen,
	Den gotischen Zierat ergreift nun der Wicht
	Und klettert von Zinne zu Zinnen.
	Nun ist's um den armen, den Türmer getan!
	Es ruckt sich von Schnörkel zu Schnörkel hinan,
	Langbeinigen Spinnen vergleichbar.
	 
	Der Türmer erbleichet, der Türmer erbebt,
	Gern gäb er ihn wieder, den Laken.
	Da häkelt—jetzt hat er am längsten gelebt—
	Den Zipfel ein eiserner Zacken.
	Schon trübet der Mond sich verschwindenden Scheins,
	Die Glocke, sie donnert ein mächtiges Eins,
	Und unten zerschellt das Gerippe.
	
```

Written in German, it contains umlaut letters and the ß character, all of which are not part of the US-ASCII character set. To process this text, read the lines into R.

```R
# Read the poem from the file 'Totentanz.txt' in '/inst/examples/'
totentanz <- readLines("./inst/examples/Totentanz.txt")

# Replace the Unicode characters with US-ASCII replacements       
totentanz_ascii <- unidecode(data = totentanz, language = "German")

# View the modified text
cat(totentanz_ascii)
```

The resulting text returned after calling the `unidecode` function is:

```

  Der Tuermer, der schaut zu Mitten der Nacht
  Hinab auf die Graeber in Lage;
  Der Mond, der hat alles ins Helle gebracht;
  Der Kirchhof, er liegt wie am Tage.
  Da regt sich ein Grab und ein anderes dann:
  Sie kommen hervor, ein Weib da, ein Mann,
  In weissen und schleppenden Hemden.
  
  Das reckt nun, es will sich ergetzen sogleich,
  Die Knoechel zur Runde, zum Kranze,
  So arm und so jung, und so alt und so reich;
  Doch hindern die Schleppen am Tanze.
  Und weil hier die Scham nun nicht weiter gebeut,
  Sie schuetteln sich alle, da liegen zerstreut
  Die Hemdlein ueber den Huegeln.
  
  Nun hebt sich der Schenkel, nun wackelt das Bein,
  Gebaerden da gibt es vertrackte;
  Dann klippert's und klappert's mitunter hinein,
  Als schlueg' man die Hoelzlein zum Takte.
  Das kommt nun dem Tuermer so laecherlich vor;
  Da raunt ihm der Schalk, der Versucher, ins Ohr:
  Geh! hole dir einen der Laken.
  
  Getan wie gedacht! und er fluechtet sich schnell
  Nun hinter geheiligte Tueren.
  Der Mond, und noch immer er scheinet so hell
  Zum Tanz, den sie schauderlich fuehren.
  Doch endlich verlieret sich dieser und der,
  Schleicht eins nach dem andern gekleidet einher,
  Und, husch, ist es unter dem Rasen.
  
  Nur einer, der trippelt und stolpert zuletzt
  Und tappet und grapst an den Grueften;
  Doch hat kein Geselle so schwer ihn verletzt,
  Er wittert das Tuch in den Lueften.
  Er ruettelt die Turmtuer, sie schlaegt ihn zurueck,
  Geziert und gesegnet, dem Tuermer zum Glueck,
  Sie blinkt von metallenen Kreuzen.
  
  Das Hemd muss er haben, da rastet er nicht,
  Da gilt auch kein langes Besinnen,
  Den gotischen Zierat ergreift nun der Wicht
  Und klettert von Zinne zu Zinnen.
  Nun ist's um den armen, den Tuermer getan!
  Es ruckt sich von Schnoerkel zu Schnoerkel hinan,
  Langbeinigen Spinnen vergleichbar.
  
  Der Tuermer erbleichet, der Tuermer erbebt,
  Gern gaeb er ihn wieder, den Laken.
  Da haekelt—jetzt hat er am laengsten gelebt—
  Den Zipfel ein eiserner Zacken.
  Schon truebet der Mond sich verschwindenden Scheins,
  Die Glocke, sie donnert ein maechtiges Eins,
  Und unten zerschellt das Gerippe.
  
```

So, words like `Knöchel` were transliterated to `Knoechel`, resulting in text that is entirely in the US-ASCII character set.

This can be done for multiple languages. So far, there is support for:

- Czech
- French
- German
- Greek
- Polish
- Romanian
- Slovenian
