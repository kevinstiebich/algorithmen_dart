import 'dart:io';
import 'dart:math';

void main() {
  int? anzahlWuerfe;
  var wuerfe = <int>[];
  var counter = 0;
  var random = Random();

  do {
    print("Anzahl der Würfe:");
    anzahlWuerfe = int.tryParse(stdin.readLineSync()!);
  } while (anzahlWuerfe == null);

  while (anzahlWuerfe! > 0) {
    wuerfe.add(random.nextInt(6) + 1);
    anzahlWuerfe--;

    if (counter > 0 && wuerfe[counter] == 6 && wuerfe[counter - 1] == 6) {
      print("Es hat ${counter + 1} Würfe gebraucht, um 2x die 6 hintereinander zu würfeln.");
      print("Liste aller Würfe: $wuerfe");
      break;
    }

    if (anzahlWuerfe == 0) {
      print("Limit erreicht: $wuerfe");
    }

    counter++;
  }
}