import 'dart:io';

void main() {
  String? vorname;
  String? nachname;
  int? alter;
  String? geschlecht;
  DateTime jetzt = DateTime.now();
  String anrede = "Herr";

  do {
    print("Vorname:");
    vorname = stdin.readLineSync();
  } while (vorname == null || vorname == "");

  do {
    print("Nachname:");
    nachname = stdin.readLineSync();
  } while (nachname == null || nachname == "");

  do {
    print("Alter:");
    alter = int.tryParse(stdin.readLineSync()!);
  } while (alter == null || alter < 0 || alter > 150);

  do {
    print("Geschlecht (m/w):");
    geschlecht = stdin.readLineSync();
    if (geschlecht == "w") anrede = "Frau";
  } while (geschlecht != "m" && geschlecht != "w");

  if (alter < 40) {
    print("Hallo $vorname!");
  } else {
    if (jetzt.hour < 11) {
      print("Guten Morgen, $anrede $nachname");
    } else if (jetzt.hour >= 17) {
      print("Guten Abend, $anrede $nachname");
    } else print("Guten Tag, $anrede $nachname");
  }
}