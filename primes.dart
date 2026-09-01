import "dart:io";

void main() {
  print(findPrimes(getInput()));
}

int getInput() {
  int? number;

  do {
    print("Gebe eine Zahl ein:");
    number = int.tryParse(stdin.readLineSync()!);
  } while (number == null);

  return number;
}

List<int> findPrimes(number) {
  var primes = <int>[];

  if (number > 1) primes.add(2);

  for (var i = 3; i <= number; i += 2) {
    bool isPrime = true;

    for (var prime in primes) {
      if (prime * prime > i) break;
      if (i % prime == 0) isPrime = false;
    }

    if (isPrime) primes.add(i);
  }

  return primes;
}
