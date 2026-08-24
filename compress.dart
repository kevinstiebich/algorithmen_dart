import "dart:io";

void main(List<String> args) {
  String toCompress;

  if (args.isEmpty) {
    print("Gebe etwas ein: ");
    toCompress = stdin.readLineSync()!;
  } else {
    toCompress = args[0];
  }

  while (!RegExp(r'^[a-zA-Z]+$').hasMatch(toCompress)) {
    print("Fehler: Die Eingabe darf nur Buchstaben erhalten.");
    print("Gebe etwas ein: ");
    toCompress = stdin.readLineSync()!;
  }
}