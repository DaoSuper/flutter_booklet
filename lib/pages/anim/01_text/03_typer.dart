import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TyperText extends StatefulWidget {
  const TyperText({super.key});

  @override
  State<TyperText> createState() => _TyperTextState();
}

//高频率 的 数据变化 + 界面更新
class _TyperTextState extends State<TyperText> {

  int count = 0;

  final Duration animDuration = const Duration(milliseconds: 200);

  final String text = '桃树、杏树、梨树，你不让我，我不让你，都开满了花赶趟儿。'
      '红的像火，粉的像霞，白的像雪。花里带着甜味，闭了眼，'
      '树上仿佛已经满是桃儿、杏儿、梨儿。';
  
  final ValueNotifier<String> data = ValueNotifier<String>("");

  Timer? _timer;
  int currentIndex = 0;
  String get currentText => text.substring(0, currentIndex);

  void _startAnim() {
    _timer?.cancel();
    data.value = '';
    currentIndex = 0;
    _timer = Timer.periodic(animDuration, _type);
  }

  void _type(Timer timer) {
    if(currentIndex < text.length) {
      currentIndex++;
      data.value = currentText;
    } else {
      _timer?.cancel();
      _timer = null;
    }
  }

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 1), _callback);
    _startAnim();
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
    data.dispose();
  }

  void _callback(Timer timer){
    count++;
    if (kDebugMode) {
      print("------${DateTime.now().toIso8601String()}---------");
    }
    if(count >= 10){
      timer.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GestureDetector(
        onTap: _startAnim,
        child: Container(
          padding: const EdgeInsets.all(20),
          child: AnimatedBuilder(
            animation: data,
            builder: (context, child) {
              return Text(
                data.value,
                style: const TextStyle(color: Colors.blue),
              );
            },
          ),
        ),
      ),
    );
  }
}
