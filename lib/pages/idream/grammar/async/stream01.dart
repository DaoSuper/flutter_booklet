import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;

int fileLength = 0;
int counter = 0;

void doTask2() async {
  File file = File(path.join(Directory.current.path, "assets", "Jane Eyre.txt"));
  fileLength = await file.length();
  debugPrint("开始读取 Jane Eyre.txt ");
  Stream<List<int>> stream = file.openRead();
  stream.listen(_onData, onDone: _onDone);
}

void _onData(List<int> bytes) {
  counter += bytes.length;
  double progress = counter * 100 / fileLength;
  DateTime time = DateTime.now();
  String timeStr = "[${time.hour}:${time.minute}:${time.second}:${time.millisecond}]";
  debugPrint('$timeStr${"=" * (progress ~/ 2)}[${progress.toStringAsFixed(2)}%]');
}

void _onDone() {
  debugPrint("读取 Jane Eyre.txt 结束");
}