import "dart:io";

void main(List<String> args) {
  String toDecompress = getValidFormat(args);
  decompressAndPrint(toDecompress);
}

void decompressAndPrint(String toDecompress) {
  int? c;
  var length = toDecompress.length;
  var i = 0;
  var j = 0;
  var digits = 0;
  String numberStr = "";

  List<String> singleChars = toDecompress.split(""); // String in Array aus einzelnen Chars verwandeln

  while (i < length) {
    if (int.tryParse(singleChars[i]) != null) {
      j = i;

      // Schleife prüft, wieviele Stellen die vorkommende Zahl hat und setzt sie erstmal als String zusammen
      // um sie danach direkt in einem Rutsch zu einem Integer umzuwandeln.
      while (j < length && int.tryParse(singleChars[j]) != null) {
        numberStr += singleChars[j];
        j++;
        digits++;
      }

      c = int.parse(numberStr) - 1;
      singleChars.replaceRange(i, i + 1, List.filled(c, singleChars[i - 1]));
      length += c - 1;
      i += (digits - 1);
      digits = 0; // Anzahl der Stellen einer Zahl resetten
      numberStr = ""; // Zahlenstring resetten
    }
    i++;
  }

  toDecompress = singleChars.join(""); // einzelne Chars wieder zu einem String zusammenfügen
  print(toDecompress);
}

String getValidFormat(List<String> args) {
  String toDecompress;

  if (args.isEmpty) {
    print("Eingabe: ");
    toDecompress = stdin.readLineSync()!;
  } else {
    toDecompress = args[0];
  }

  while (!RegExp(r'^[a-zA-Z0-9]+$').hasMatch(toDecompress)) {
    print("Fehler: Die Eingabe darf nur Buchstaben erhalten.");
    print("Eingabe: ");
    toDecompress = stdin.readLineSync()!;
  }

  return toDecompress;
}