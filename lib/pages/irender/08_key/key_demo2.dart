import 'dart:math';

import 'package:flutter/material.dart';

class KeyDemo2 extends StatefulWidget {
  const KeyDemo2({super.key});

  @override
  State<StatefulWidget> createState() => KeyDemo2State();
}

class KeyDemo2State extends State<KeyDemo2> {
  List<String> data = ['A', 'B', 'C', 'D', 'E'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Row(
        children: data.map((e) => CheckableItem(
          name: e,
          // key: UniqueKey(),
          key: ValueKey<String>(e),
        )).toList(),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      actions: [
        IconButton(onPressed: reset, icon: const Icon(Icons.refresh)),
        TextButton(
            onPressed: removeFirst,
            child: const Text(
              '移除首位',
              style: TextStyle(color: Colors.white),
            ))
        // IconButton(onPressed: removeFirst, icon: Icon(Icons.remove)),
      ],
    );
  }

  void reset() {
    setState(() {
      data = ['A', 'B', 'C', 'D', 'E'];
    });
  }

  void removeFirst() {
    setState(() {
      data.removeAt(0);
      print(data);
    });
  }
}

class CheckableItem extends StatefulWidget {
  final String name;

  const CheckableItem({Key? key, required this.name}) : super(key: key);

  @override
  State<CheckableItem> createState() => CheckableItemState();
}

class CheckableItemState extends State<CheckableItem> {
  bool _checked = false;

  Widget buildCheckbox() {
    return Checkbox(
      value: _checked,
      onChanged: (bool? value) {
        setState(() {
          _checked = value ?? false;
        });
      }
    );
  }

  @override
  void initState() {
    super.initState();
    print('initState');
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
      height: 70,
      child: Center(
          child: Row(
        children: [
          buildCheckbox(),
          Text(
            widget.name,
            style: const TextStyle(fontSize: 20, color: Colors.black),
          ),
        ],
      )),
    );
  }
}

class RandomColor {
  static final Random _random = Random();

  static Color getColor() {
    return Color.fromRGBO(
      _random.nextInt(256),
      _random.nextInt(256),
      _random.nextInt(256),
      1,
    );
  }
}