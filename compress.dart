import "dart:io";

void main(List<String> args) {
  String toCompress = getValidFormat(args);
  compressAndPrint(toCompress);
}

void compressAndPrint(toCompress) {
  List<String> singleChars = toCompress.split("");
  var charCounter = 1;
  var i = 1;

  while (i < singleChars.length) {
    if (singleChars[i - 1] == singleChars[i]) {
      charCounter++;
      i++;
    } else {
      if (charCounter >= 3) {
        singleChars.replaceRange(i - charCounter + 1, i, ["$charCounter"]);
        i -= charCounter - 2;
      }
      charCounter = 1;
      i++;
      }
  }

  if (charCounter >= 3) singleChars.replaceRange(i - charCounter + 1, i, ["$charCounter"]);

  toCompress = singleChars.join("");
  print("$toCompress");
}

String getValidFormat(List<String> args) {
  String toCompress;
  
  if (args.isEmpty) {
    print("Eingabe: ");
    toCompress = stdin.readLineSync()!;
  } else {
    toCompress = args[0];
  }

  while (!RegExp(r'^[a-zA-Z]+$').hasMatch(toCompress)) {
    print("Fehler: Die Eingabe darf nur Buchstaben erhalten.");
    print("Eingabe: ");
    toCompress = stdin.readLineSync()!;
  }
  return toCompress;
}