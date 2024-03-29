import 'dart:math';

import 'package:flutter/material.dart';

class NoKeyDemo extends StatefulWidget {
  const NoKeyDemo({super.key});

  @override
  State<StatefulWidget> createState() => NoKeyDemoState();
}

class NoKeyDemoState extends State<NoKeyDemo> {
  List<Widget> tiles = [
    RandomColorBox(),
    RandomColorBox(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(children: tiles),
      floatingActionButton: FloatingActionButton(
          onPressed: swapTiles,
          child: const Icon(Icons.sentiment_very_satisfied)),
    );
  }

  void swapTiles() {
    setState(() {
      tiles.insert(1, tiles.removeAt(0));
    });
  }
}

class RandomColorBox extends StatelessWidget {
  RandomColorBox({Key? key}) : super(key: key);

  final Color myColor = UniqueColorGenerator.getColor();

  @override
  Widget build(BuildContext context) {
    return Container(
        color: myColor,
        child: const SizedBox(
          width: 70,
          height: 70,
        ));
  }
}

class UniqueColorGenerator {
  static Color getColor() {
    return Color.fromRGBO(
        Random().nextInt(256), Random().nextInt(256), Random().nextInt(256), 1);
  }
}