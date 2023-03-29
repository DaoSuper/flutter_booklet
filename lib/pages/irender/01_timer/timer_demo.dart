import 'dart:async';

import 'package:flutter/material.dart';

class TimerDemo {
  static timerTest() {
    debugPrint('1=======TAG1=======');
    Timer.run(() {
      debugPrint('2====Timer.run====');
    });
    Future(() {
      debugPrint('3====Future====');
    });
    Timer.run(() {
      debugPrint('4====Timer.run====');
    });
    debugPrint('5=======TAG2=======');
  }

  static void do2() {
    int count = 1000000000;
    int start = DateTime.now().millisecondsSinceEpoch;
    int sum = 0;
    for (int i = 0; i < count; i++) {
      sum += i;
    }

    int end = DateTime.now().millisecondsSinceEpoch;
    debugPrint("${((end - start) / 1000).toStringAsFixed(4)} s");
  }
}