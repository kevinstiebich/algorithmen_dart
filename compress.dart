import "dart:io";

void main(List<String> args) {
  String toCompress;

  if (args.isEmpty) {
    print("Eingabe: ");
    toCompress = stdin.readLineSync()!;
  } else {
    toCompress = args[0];
  }

  getValidFormat(toCompress);

  var charAmount = toCompress.length;
  List<String> singleChars = toCompress.split("");
  var charCounter = 1;
  var i = 1;

  while (i < charAmount) {

    if (singleChars[i - 1] == singleChars[i]) {
      charCounter++;
      i++;
    }

    if (charCounter >= 3 && (singleChars[i - 1] != singleChars[i] || i == charAmount - 1)) {
      singleChars.replaceRange((i - charCounter) + 1, i, ["$charCounter"]);
      charAmount -= (charCounter - 1);
      i -= (charCounter - 1);
      charCounter = 1;
      i++;
      continue;
    } 

    if (singleChars[i - 1] != singleChars[i]) {
      charCounter = 1;
      i++;
    }

  }

  toCompress = singleChars.join("");
  print("$toCompress");
}

String getValidFormat(toCompress) {
  while (!RegExp(r'^[a-zA-Z]+$').hasMatch(toCompress)) {
    print("Fehler: Die Eingabe darf nur Buchstaben erhalten.");
    print("Eingabe: ");
    toCompress = stdin.readLineSync()!;
  }
  return toCompress;
}