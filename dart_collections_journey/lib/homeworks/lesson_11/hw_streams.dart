import 'dart:async';

Future<void> streamFromIterable() async {
  final stream = Stream<int>.fromIterable([1, 2, 3, 4, 5]);

  print('await for:');
  await for (var value in stream) {
    print(value);
  }

  final stream2 = Stream<int>.fromIterable([1, 2, 3, 4, 5]);
  print('listen:');
  stream2.listen((value) => print(value));
}

Future<void> countdownStream() async {
  final countdown = Stream<int>.periodic(
    Duration(seconds: 1),
    (x) => x + 1,
  ).take(10);
  await for (var number in countdown) {
    print('$number...');
  }
}

Future<void> streamControllerExample() async {
  final controller = StreamController<String>();

  controller.stream.listen(
    (data) => print(data),
    onDone: () => print('Стрім завершено'),
  );

  controller.sink.add('Hello');
  controller.sink.add('World');
  controller.sink.add('Dart');

  await controller.close();
}

void main() async {
  await streamFromIterable();

  await countdownStream();

  await streamControllerExample();
}
