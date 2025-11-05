import 'dart:io';

double doubleFromInput(String prompt) {
  print(prompt);
  String? input = stdin.readLineSync();
  double? doubleInput = double.tryParse(input ?? '');

  while (doubleInput == null) {
    print('Invalid input. Please try again.');
    print(prompt);
    input = stdin.readLineSync();
    doubleInput = double.tryParse(input ?? '');
  }

  return doubleInput;
}

int integerFromInput(String prompt, List<int> validOptions) {
  print(prompt);
  String? input = stdin.readLineSync();
  int? intInput = int.tryParse(input ?? '');

  while (intInput == null ||
      (validOptions.isNotEmpty && !validOptions.contains(intInput))) {
    print('Invalid input. Please try again.');
    print(prompt);
    input = stdin.readLineSync();
    intInput = int.tryParse(input ?? '');
  }

  return intInput;
}

String stringFromInput(String prompt, validOptions) {
  print(prompt);
  String? input = stdin.readLineSync();

  while (input == null ||
      (validOptions.isNotEmpty && !validOptions.contains(input)) ||
      input.isEmpty) {
    print('Invalid input. Please try again.');
    print(prompt);
    input = stdin.readLineSync();
  }

  return input;
}
