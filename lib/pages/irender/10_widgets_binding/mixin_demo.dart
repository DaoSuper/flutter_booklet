// mixin 最基本功能 - 混入属性与方法
//无法声明 [构造方法], 无法 [实例化]
//可以依赖于 普通类 或 抽象类 的

import 'package:flutter/material.dart';

class Human with RespiratorySystem{
  Human() {
    initInstances();
  }
}

class Human2 with RespiratorySystem, MotorSystem2 {
  Human2() {
    initInstances();
  }
  bool get alive => oxygen > 0;
}

class Human3 with RespiratorySystem, MotorSystem {
  Human3() {
    initInstances();
  }
  bool get alive => oxygen > 0;
}

mixin RespiratorySystem {
  int oxygen = 0;
  int _inhaleCount = 0;

  // 在混入类中实例化时调用初始化成员属性
  void initInstances({int count = 10}){
    oxygen = 10;
    _inhaleCount = count;
    debugPrint('========初始化呼吸系统完成===氧气值:$oxygen========');
  }

  void inhale() {
    oxygen += _inhaleCount;
    debugPrint('========呼吸系统吸入10点氧气值===氧气值:$oxygen========');
  }

  void run() {
    oxygen--;
    debugPrint('========呼吸系统正常运行===氧气值:$oxygen======');
  }
}

// 混入多个 mixin 时，防止同名方法的覆盖可以用on
mixin MotorSystem on RespiratorySystem{
  int _cost = 0; // 每次消耗的氧气量

  @override
  void initInstances({int count = 3}) {
    super.initInstances();
    _cost = count;
    debugPrint('========初始化【运动系统】完成=========');
  }

  @override
  void run() {
    super.run();
    debugPrint('========运动系统运行=======');
  }
}

//混入多个 mixin 时有同名方法的话，后入覆盖先入的
mixin MotorSystem2 {
  int _cost = 0; // 每次消耗的氧气量

  void initInstances({int count = 3}) {
    _cost = _cost;
    debugPrint('========初始化【运动系统】完成=========');
  }
  void run() {
    debugPrint('========运动系统运行=======');
  }
}