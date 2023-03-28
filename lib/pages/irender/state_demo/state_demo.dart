import 'dart:async';

import 'package:flutter/material.dart';
class StateDemo extends StatefulWidget {
  const StateDemo({super.key});

  @override
  State<StateDemo> createState() => _StateDemoState();
}

class _StateDemoState extends State<StateDemo> {
 
 @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), _update);
  }

  Color _color = Colors.red;

  void _update() {
    setState(() {
      _color = Colors.blue;
    });
    // setState(() {
    //   _color = Colors.blue;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Align(
        child: SizedBox(
          width: 100,
          height: 100,
          child: ColoredBox(color: _color),
        )
      ),
    );
  }
}