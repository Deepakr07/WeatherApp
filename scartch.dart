import 'dart:io';

String result = '';
void main() {
  performTask();
}

void performTask() async {
  task1();
  String s1 = await task2();
  task3(s1);
}

void task1() {
  print('Task1 is called');
}

Future<String> task2() async {
  Duration duration = Duration(seconds: 3);
  await Future.delayed(duration, () {
    print('Task2 is called');
    result = 'task2data';
  });
  return result;
}

void task3(String s1) {
  print('Task3 is called with $s1 data');
}
