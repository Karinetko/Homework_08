import 'dart:math';

void main() {
  task_1();
}

void task_1() {
  // Create list
  final numbers = List.generate(100, (index) => Random().nextInt(100));
  print('Numbers list: $numbers');
  print('-----------------------');

  // Print 65th element
  print('Element 65 : ${numbers[64]}');
  print('-----------------------');

  // Print 1000000000
  numbers.insert(49, 1000000000);
  print('List after inserting 1000000000 at index 49: $numbers');
  print('-----------------------');

  // Remove specific numbers
  numbers.remove(24);
  numbers.remove(45);
  numbers.remove(66);
  numbers.remove(88);
  print('List after removing 24, 45, 66, and 88: $numbers');
  print('-----------------------');

  // Sum of numbers divisible by 3
  int sum = 0;
  for (final number in numbers) {
    if (number % 3 == 0) {
      sum += number;
    }
  }
  print('Sum numbers divisible by 3: $sum');
  print('-----------------------');

  // List of even numbers
  final List<int> temp = [];
  for (final number in numbers) {
    if (number % 2 == 0) {
      temp.add(number);
    }
  }
  print('List of even numbers: $temp');
  print('List of even numbers length: ${temp.length}');
  print('-----------------------');
}
