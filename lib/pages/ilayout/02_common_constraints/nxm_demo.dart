import 'dart:math';

import 'package:flutter/material.dart';

class NXMDemo extends StatefulWidget {
  const NXMDemo({super.key});

  @override
  State<NXMDemo> createState() => _NXMDemoState();
}

class _NXMDemoState extends State<NXMDemo> {
  final Random random = Random();

  Color randomColor({
    int limitA = 120, int limitR = 0, int limitG = 0,int limitB = 0,
  }) {
    int a = limitA + random.nextInt(256 - limitA); //透明度值
    int r = limitR + random.nextInt(256 - limitR); //红值
    int g = limitG + random.nextInt(256 - limitG); //绿值
    int b = limitB + random.nextInt(256 - limitB); //蓝值
    return Color.fromARGB(a, r, g, b); //生成argb模式的颜色
  }


  @override
  Widget build(BuildContext context) {

    List<Widget> children = [];
    for(int i = 0; i < 3; i++){
      List<Widget> columnChildren = [];
      for(int j = 0; j < 3; j++) {
        columnChildren.add(Expanded(
          child: ColoredBox(
            color: randomColor(),
            child: Center(child: Text('($i,$j)', style: TextStyle(fontSize: 14)),),
          )
        ));
      }
      children.add(Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: columnChildren,
      )));
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: children,
    );
  }
}