import 'package:flutter/material.dart';
import 'dart:math' as Math;
import 'man.dart';
import 'package:flutter/services.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';

TextEditingController guessText = new TextEditingController();
String hiddenWordToGuess;
int doomsdayClock;
String wordToFind;

List<String> charsToFind;
bool won = false;
List<String> wordsEN =
    ("people,history,way,art,world,information,map,two,family,government,health,system,computer,meat,year,thanks,music,person,reading,method,data,food,understanding,theory,law,bird,literature,problem,software,control,knowledge,power,ability,economics,love,internet,television,science,library,nature,fact,product,idea,temperature,investment,area,society,activity,story,industry,media,thing,oven,community,definition,safety,quality,development,language,management,player,variety,video,week,security,country,exam,movie,organization,equipment,physics,analysis,policy,series,thought,basis,boyfriend,direction,strategy,technology,army,camera,freedom,paper,environment,child,instance,month,truth,marketing,university,writing,article,department,difference,goal,news,audience,fishing,growth,income,marriage,user,combination,failure,meaning,medicine,philosophy,teacher,communication,night,chemistry,disease,disk,energy,nation,road,role,soup,advertising,location,success,addition,apartment,education,math,moment,painting,politics,attention,decision,event,property,shopping,student,wood,competition,distribution,entertainment,office,population,president,unit,category,cigarette,context,introduction,opportunity,performance,driver,flight,length,magazine,newspaper,relationship,teaching,cell,dealer,finding,lake,member,message,phone,scene,appearance,association,concept,customer,death,discussion,housing,inflation,insurance,mood,woman,advice,blood,effort,expression,importance,opinion,payment,reality,responsibility,situation,skill,statement,wealth,application,city,county,depth,estate,foundation,grandmother,heart,perspective,photo,recipe,studio,topic,collection,depression,imagination,passion,percentage,resource,setting,ad,agency,college,connection,criticism,debt,description,memory,patience,secretary,solution,administration,aspect,attitude,director,personality,psychology,recommendation,response,selection,storage,version,alcohol,argument,complaint,contract,emphasis,highway,loss,membership,possession,preparation,steak,union,agreement,cancer,currency,employment,engineering,entry,interaction,mixture,preference,region,republic,tradition,virus,actor,classroom,delivery,device,difficulty,drama,election,engine,football,guidance,hotel,owner,priority,protection,suggestion,tension,variation,anxiety,atmosphere,awareness,bath,bread,candidate,climate,comparison,confusion,construction,elevator,emotion,employee,employer,guest,height,leadership,mall,manager,operation,recording,sample,transportation,charity,cousin,disaster,editor,efficiency,excitement,extent,feedback,guitar,homework,leader,mom,outcome,permission")
        .split(",");
List<String> wordsDE =
    ("Abend,Abfahrt,Abflug,Absender,Adresse,Alkohol,Alter,Ampel,Anfang,Angebot,Angestellte,Angst,Ankunft,Anmeldung,Anrede,Anruf,Anrufbeantworter,Ansage,Anschluss,Antwort,Anzeige,Anzug,Apfel,Apotheke,Appartement,Appetit,April,Arbeit,Arbeitsplatz,Arm,Arzt,Aufenthalt,Aufgabe,Aufzug,Auge,August,Ausbildung,Ausflug,Ausgang,Auskunft,Ausländer,Ausländerin,Ausland,Aussage,Ausstellung,Ausweis,Auto,Autobahn,Automat,Bäckerei,Büro,Baby,Bad,Bahn,Bahnhof,Bahnsteig,Balkon,Banane,Bank,Batterie,Baum,Beamte,Beamtin,Bein,Beispiel,Bekannte,Benzin,Beratung,Berg,Beruf,Berufsschule,Besuch,Betrag,Bett,Bewerbung,Bier,Bild,Bildschirm,Birne,Bitte,Blatt,Bleistift,Blick,Blume,Bluse,Blut,Bogen,Bohne,Brötchen,Brücke,Brief,Briefkasten,Briefmarke,Brieftasche,Briefumschlag,Brille,Brot,Bruder,Buch,Buchstabe,Bus,Butter,Café,CD,CD-ROM,Chef,Computer,Creme,Dach,Dame,Dank,Datum,Dauer,Deutsche,Dezember,Dienstag,Ding,Disco,Doktor,Dom,Donnerstag,Doppelzimmer,Dorf,Drucker,Durchsage,Durst,Dusche,E-Mail,Ecke,Ehefrau,Ehemann,Ei,Einführung,Eingang,Einladung,Eintritt,Einwohner,Einzelzimmer,Eis,Eltern,Empfänger,Empfang,Ende,Enkel,Entschuldigung,Erdgeschoss,Erfahrung,Ergebnis,Erlaubnis,Ermäßigung,Erwachsene,Essen,Export,Fähre,Führerschein,Führung,Fabrik,Fahrer,Fahrkarte,Fahrplan,Fahrrad,Familie,Familienname,Familienstand,Farbe,Fax,Februar,Fehler,Fenster,Ferien,Fernsehgerät,Fest,Feuer,Feuerwehr,Feuerzeug,Fieber,Film,Firma,Fisch,Flasche,Fleisch,Flughafen,Flugzeug,Flur,Fluss,Formular,Foto,Fotoapparat,Frühjahr,Frühling,Frühstück,Frage,Frau,Freitag,Freizeit,Freund,Freundin,Friseur,Frist,Fuß,Fußball,Fundbüro,Gabel,Garage,Garten,Gas,Gast,Gebühr,Geburtsjahr,Geburtsort,Geburtstag,Gegenteil,Geld,Geldbörse,Gemüse,Gepäck,Gericht,Gesamtschule,Geschäft,Geschenk,Geschirr,Geschwister,Gesicht,Gespräch,Gesundheit,Getränk,Gewicht,Gewitter,Glück,Glückwunsch,Glas,Gleis,Goethe-Institut,Größe,Die Grenze,Grippe,Großeltern,Großmutter,Großvater,Gruß,Grundschule,Gruppe,Guthaben,Gymnasium,Hähnchen,Haar,Halbpension,Halle,Hals,Haltestelle,Hand,Handtuch,Handy,Haus,Hausaufgabe,Hausfrau,Haushalt,Hausmann,Heimat,Heizung,Hemd,Herbst,Herd,Herr,Herz,Hilfe,Hobby,Holz,Hose,Hund,Hunger,Idee,Import,Industrie,Information,Inhalt,Internet,Jacke,Jahr,Januar,Job,Jugendherberge,Jugendliche,Juli,Junge,Juni,Käse,Körper,Küche,Kühlschrank,Kündigung,Kaffee,Kalender,Kamera,Kanne,Karte,Kartoffel,Kasse,Kassette,Kassettenrecorder,Katze,Keller,Kellner,Kenntnisse,Kennzeichen,Kette,Kfz,Kind,Kindergarten,Kinderwagen,Kino,Kiosk,Kirche,Klasse,Kleid,Kleidung,Kneipe,Koffer,Kollege,Kollegin,Konsulat,Kontakt,Konto,Kontrolle,Konzert,Kopf,Kosmetik,Krankenkasse,Krankheit,Kredit,Kreditkarte,Kreis,Kreuzung,Kuchen,Kugelschreiber,Kunde,Kundin,Kurs,Löffel,Lösung,Laden,Lager,Lampe,Land,Landschaft,Leben,Lebensmittel,Leid,Lehre,Lehrer,Lehrerin,Leute,Licht,Lied,Lkw,Loch,Lohn,Lokal,Luft,Lust,Mädchen,März,Möbel,Müll,Mülltonne,Magen,Mai,Mal,Mann,Mantel,Markt,Maschine,Material,Mechaniker,Medikament,Meer,Mehrwertsteuer,Meinung,Menge,Mensch,Messer,Metall,Miete,Milch,Minute,Mittag,Mitte,Mitteilung,Mittel,Mittelschule,Mittwoch,Mode,Moment,Monat,Montag,Morgen,Motor,Mund,Museum,Musik,Mutter,Nähe,Nachbar,Nachbarin,Nachmittag,Nachrichten,Nacht,Name,Natur,Nebel,Norden,Notarzt,Note,Notfall,Notiz,November,Nudel,Nummer,Ober,Obst,Oktober,Oma,Opa,Operation,Orange,Ordnung,Ort,Osten,Öl,Päckchen,Paket,Panne,Papier,Papiere,Parfüm,Park,Partei,Partner,Partnerin,Party,Pass,Pause,Pension,Pkw,Plan,Plastik,Platz,Polizei,Pommes frites,Portion,Post,Postleitzahl,Prüfung,Praktikum,Praxis,Preis,Problem,Das Produkt,Programm,Prospekt,Pullover,Qualität,Quittung,Rücken,Rabatt,Radio,Rathaus,Raucher,Raucherin,Raum,Realschule,Rechnung,Regen,Reifen,Reinigung,Reis,Reise,Reisebüro,Reiseführer,Reparatur,Restaurant,Rezept,Rezeption,Rind,Rock,Rose,Rundgang,Süden,S-Bahn,Sache,Saft,Salat,Salz,Samstag/Sonnabend,Satz,Schüler,Schülerin,Schalter,Scheckkarte,Schiff,Schild,Schinken,Schirm,Schlüssel,Schloss,Schluss,Schmerzen,Schnee,Schnupfen,Schokolade,Schrank,Schuh,Schule,Schwein,Schwester,Schwimmbad,See,Sehenswürdigkeit,Seife,Sekretärin,Sekunde,Sendung,Senioren,September,Service,Sessel,Sofa,Sohn,Sommer,Sonderangebot,Sonne,Sonntag,Sorge,Spülmaschine,Spaß,Spaziergang,Speisekarte,Spielplatz,Sprache,Sprachschule,Sprechstunde,Stück,Stadt,Standesamt,Stempel,Steuer,Stock,Stoff,Straße,Straßenbahn,Strand,Streichholz,Strom,Student,Studentin,Studium,Stuhl,Stunde,Supermarkt,Suppe,Tür,Tüte,Tag,Tankstelle,Tasche,Tasse,Taxi,Der Tee,Teil,Telefon,Telefonbuch,Teller,Teppich,Termin,Test,Text,Theater,Thema,Ticket,Tier,Tipp,Tisch,Tochter,Toilette,Tomate,Topf,Tourist,Treppe,Trinkgeld,Turm,U-Bahn,Uhr,Unfall,Universität,Unterhaltung,Unterkunft,Unterricht,Unterschied,Unterschrift,Untersuchung,Urlaub,Übernachtung,Vater,Verbindung,Verein,Verkäufer,Verkäuferin,Verkehr,Vermieter,Versicherung,Verspätung,Vertrag,Video,Vogel,Volksschule,Vormittag,Vorname,Vorsicht,Vorwahl,Wäsche,Wagen,Wald,Wasser,Weg,Wein,Welt,Werkstatt,Werkzeug,Westen,Wetter,Wiederhören,Wiedersehen,Wind,Winter,Wirtschaft,Woche,Wochenende,Wochentag,Wohnung,Wolke,Wort,Wunsch,Wurst,Zahl,Zahn,Zeit,Zeitschrift,Zeitung,Zentrum,Zettel,Zeugnis,Zigarette,Zimmer,Zitrone,Zoll,Zucker,Zug")
        .split(",");
List<String> charsUsedBad = new List<String>();
FocusNode inputNode = new FocusNode();
String lang = "English";

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hangman',
      theme: ThemeData(
        primaryColor: Colors.black,
        backgroundColor: Colors.black12,
        scaffoldBackgroundColor: Colors.black12,
        textTheme: TextTheme(
            body1: TextStyle(color: Colors.white),
            button: TextStyle(color: Colors.white)),
        accentColor: Colors.white24,
      ),
      home: HangmanPage(),
    );
  }
}

class HangmanPage extends StatefulWidget {
  @override
  _HangmanPageState createState() => _HangmanPageState();
}

class _HangmanPageState extends State<HangmanPage> {
  @override
  void initState() {
    KeyboardVisibilityNotification().addNewListener( //Blocking the keyboard from beeing dismissed
      onChange: (bool visible) {
        if (!visible) {
          print("Keyboard tried to dismiss");
          inputNode.unfocus();
          SystemChannels.textInput.invokeMethod('TextInput.show');
          FocusScope.of(context).requestFocus(inputNode);
        }
      },
    );

    newGame();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            new Image.asset('assets/11.png', color: Colors.white),
            new Text("Hangman")
          ],
        ),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Flexible(
              fit: FlexFit.loose,
              child: Container(
                child: Man(12 - doomsdayClock),
              ),
            ),
            Stack(alignment: AlignmentDirectional.center, children: <Widget>[
              Text(
                hiddenWordToGuess,
                style: TextStyle(
                    letterSpacing: won ? 1.5 : 0.0,
                    fontSize: 20,
                    decoration: won ? TextDecoration.underline : null),
              ),
              TextField(                  //For Input, there is an invisible TextField over the hiddenWordToGuess
                maxLength: 1,
                focusNode: inputNode,
                autofocus: true,
                cursorColor: Colors.transparent,
                maxLengthEnforced: true,
                controller: guessText,
                onChanged: (text) => submitGuess(),
                textCapitalization: TextCapitalization.characters,
                cursorWidth: 0.0,
                decoration: InputDecoration(
                    focusedBorder: InputBorder.none,
                    counterStyle: TextStyle(fontSize: 0.0)),
              ),
            ]),
            Text(charsUsedBad.toString()),
            FlatButton(
              onPressed: newGame,
              child: Icon(Icons.refresh, color: Colors.white),
            ),
            FlatButton(
                child: Text(
                  lang,
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () => setState(() {
                      lang = (lang == "Deutsch" ? "English" : "Deutsch");
                      newGame();
                    })),
          ],
        ),
      ),
    );
  }

  Future<Null> submitGuess() {
    if (doomsdayClock > 0) {
      String guess = guessText.text.toLowerCase();
      guessText.clear();
      if (guess.length == 1) {
        if (!wordCurrently(charsToFind, wordToFind).contains(guess)) {
          print(guess);
          if (!charsUsedBad.contains(guess)) {
            print("used: " + charsUsedBad.toString());
            if (checkForChar(guess)) {
              charsToFind.remove(guess);
            } else {
              doomsdayClock -= 1;
              charsUsedBad.add(guess);
              print("Wrong! Remaining guesses: " + doomsdayClock.toString());
            }
          }
          if (charsToFind.length == 0) {
            print(wordCurrently(charsToFind, wordToFind));
            won = true;
            print("You made it");
          }
          if (doomsdayClock <= 0) {
            print(
                "\n\nThe Executioner looks at you \n\nhe grabs the chair you are standing on \n\nyou feel how your feet are losing their ground \n\nyou feel the rope pushing against your throat \nit gets stronger and stronger until suddenly \n\n ... nothing ... \n \n You died.");
            showDeath();
          }
          print(wordCurrently(charsToFind, wordToFind));
          setWordShow();
        }
      }
    }
    guessText.clear();
  }

  bool checkForChar(String charToCheck) {
    return (charsToFind.contains(charToCheck));
  }

  String wordCurrently(List<String> charsToRemaining, String wordToHide) {
    String out = "";
    for (int i = 0; wordToHide.length > i; i++) {
      if (charsToRemaining.contains(wordToHide.split("")[i].toLowerCase())) {
        out += "_ ";
      } else {
        out += wordToHide.split("")[i] + " ";
      }
    }
    return out;
  }

  Future<Null> newGame() {
    print("newGame");
    won = false;
    guessText.clear();
    charsUsedBad = new List<String>();
    charsUsedBad.clear();
    doomsdayClock = 11;
    lang == "Deutsch"
        ? wordToFind = wordsDE[new Math.Random().nextInt(wordsDE.length - 1)]
        : wordToFind = wordsEN[new Math.Random().nextInt(wordsEN.length - 1)];
    print(wordToFind);
    charsToFind = new List<String>();

    for (int i = 0; wordToFind.length > i; i++) {
      if (!charsToFind.contains(wordToFind.split("")[i].toLowerCase()) &&
          wordToFind.split("")[i] != " ") {
        charsToFind.add(wordToFind.split("")[i].toLowerCase());
      }
    }
    print("Length: " + wordToFind.length.toString());
    setWordShow();
  }

  Future<Null> setWordShow() {
    setState(() {
      hiddenWordToGuess = wordCurrently(charsToFind, wordToFind);
      doomsdayClock = doomsdayClock;
      print(12 - doomsdayClock);
    });
  }

  Future<bool> showDeath() async {
    String deathtext =
        "The Executioner looks at you \n\nhe grabs the chair you are standing on \n\nyou feel how your feet are losing their ground \n\nyou feel the rope pushing against your throat \nit gets stronger and stronger until suddenly \n\n ... nothing ... \n \n You died. ✞";
    await Future.delayed(const Duration(milliseconds: 500));
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: Container(
              child: Column(
                children: <Widget>[
                  Text(deathtext, style: TextStyle(color: Colors.redAccent)),
                  SizedBox(height: 10.0),
                  Text("The Answer was: " + wordToFind),
                  FlatButton(
                    child: Text("New Game"),
                    onPressed: () {
                      newGame();
                      Navigator.of(context).pop();
                    },
                    color: Colors.white,
                  )
                ],
                mainAxisSize: MainAxisSize.min,
              ),
              margin: EdgeInsets.all(10),
            ),
            insetAnimationDuration: Duration(seconds: 1),
            backgroundColor: Colors.grey[900],
          );
        },
        barrierDismissible: false);
  }
}
