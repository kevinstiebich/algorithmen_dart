import "dart:io";

void main() {
  int? number;

  do {
    print("Gebe eine Zahl ein:");
    number = int.tryParse(stdin.readLineSync()!);
  } while (number == null);

  print(findPrimes(number));
}

List<int> findPrimes(number) {
  var primes = <int>[];

  for (var i = 2; i <= number; i++) {
    for (var j = 2; j <= i; j++) {
      if (i % j == 0 && i > 2) {
        break;
      } else if (j == i - 1 || i == 2) {
        primes.add(i);
        break;
      }
    }
  }

  return primes;
}