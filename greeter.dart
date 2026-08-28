import 'dart:io';

void main() {
  final vorname = getVorname();
  final nachname = getNachname();
  final alter = getAlter();
  final geschlecht = getGeschlecht();
  DateTime jetzt = DateTime.now();
  final anrede = getAnrede(geschlecht);

  printMessage(alter, anrede, vorname, nachname, jetzt.hour);
}

void printMessage(
  int alter,
  String anrede,
  String vorname,
  String nachname,
  int time,
) {
  if (alter < 40) {
    print("Hallo $vorname!");
  } else {
    if (time < 11) {
      print("Guten Morgen, $anrede $nachname");
    } else if (time >= 17) {
      print("Guten Abend, $anrede $nachname");
    } else
      print("Guten Tag, $anrede $nachname");
  }
}

String getAnrede(String geschlecht) {
  return geschlecht == "w" ? "Frau" : "Herr";
}

String getGeschlecht() {
  String? geschlecht;

  do {
    print("Geschlecht (m/w):");
    geschlecht = stdin.readLineSync();
  } while ((geschlecht != "m" && geschlecht != "w") || geschlecht == null);

  return geschlecht;
}

String getVorname() {
  String? vorname;

  do {
    print("Vorname:");
    vorname = stdin.readLineSync();
  } while (vorname == null || vorname == "");

  return vorname;
}

String getNachname() {
  String? nachname;

  do {
    print("Nachname:");
    nachname = stdin.readLineSync();
  } while (nachname == null || nachname == "");

  return nachname;
}

int getAlter() {
  int? alter;

  do {
    print("Alter:");
    alter = int.tryParse(stdin.readLineSync()!);
  } while (alter == null || alter < 0 || alter > 150);

  return alter;
}
