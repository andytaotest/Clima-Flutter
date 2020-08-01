import 'dart:io';

void main() {
  performTasks();
  performOtherTasks();
}

void performTasks() async {
  task1();
  String task2Result = await task2(); // await + Future<String> => String
  task3(task2Result);
  task4();
}

void performOtherTasks() {
  print('Should appear after performTasks() but can run while performTasks() is pending');
}

void task1() {
  String result = 'task 1 data';
  print('Task 1 complete');
}

Future<String> task2() async {
  String result;
  Duration duration = Duration(seconds: 3);
//  sleep(duration); //synchronous
  await Future.delayed(duration, (){ //asynchronous
    result = 'task 2 data';
    print('Task 2 complete');
  });
//  String result = 'task 2 data';
//  print('Task 2 complete');
  return result;
}

void task3(String task2Result) {
  String result = 'task 3 data';
  print('Task 3 complete $task2Result');
}

void task4() {
  String result = 'task 4 data';
  print('Task 4 complete');
}