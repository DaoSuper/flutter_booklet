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
}