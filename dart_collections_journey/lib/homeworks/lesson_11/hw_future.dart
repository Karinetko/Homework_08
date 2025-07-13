import 'dart:async';

void main() async {
  await sequentialExecution();
  print('---');
  await parallelExecution();
  print('---');
  String result = await delayedCountdown(3);
  print(result);
}

Future<String> fetchName() async {
  await Future.delayed(Duration(seconds: 2));
  return 'Карина';
}

Future<String> fetchAge() async {
  await Future.delayed(Duration(milliseconds: 1500));
  return '26';
}

String getYearLogic(int age) {
  if (age % 10 == 1 && age % 100 != 11) {
    return 'рік';
  } else if ((age % 10 >= 2 && age % 10 <= 4) &&
      !(age % 100 >= 12 && age % 100 <= 14)) {
    return 'роки';
  } else {
    return 'років';
  }
}

Future<void> sequentialExecution() async {
  final stopwatch = Stopwatch()..start();
  String name = await fetchName();
  print('Мене звати $name');

  String ageStr = await fetchAge();
  int age = int.parse(ageStr);
  print('Мені $age ${getYearLogic(age)}');
  stopwatch.stop();
  print('Час виконання (послідовно): ${stopwatch.elapsedMilliseconds} мс');
}

Future<void> parallelExecution() async {
  final stopwatch = Stopwatch()..start();
  var results = await Future.wait([fetchName(), fetchAge()]);

  String name = results[0];
  int age = int.parse(results[1]);

  print('Мене звати $name');
  print('Мені $age ${getYearLogic(age)}');
  stopwatch.stop();
  print('Час виконання (паралельно): ${stopwatch.elapsedMilliseconds} мс');
}

Future<String> delayedCountdown(int seconds) async {
  for (int i = seconds; i > 0; i--) {
    print('$i...');
    await Future.delayed(Duration(seconds: 1));
  }
  return 'Старт!';
}
