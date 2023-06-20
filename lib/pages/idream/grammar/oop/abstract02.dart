import 'package:flutter/material.dart';

void main() {
  //通过 factory 关键字定义 工厂构造方法
  Exception exception = Exception("hello");
  debugPrint('${exception.runtimeType}');
}