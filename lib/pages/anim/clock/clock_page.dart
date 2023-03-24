
import 'package:flutter/material.dart';
import 'package:flutter_booklet/pages/anim/clock/clock_widget.dart';

class ClockPage extends StatefulWidget {
  const ClockPage({super.key});

  @override
  State<ClockPage> createState() => _ClockPageState();
}

class _ClockPageState extends State<ClockPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: ClockWidget(),
      ),
    );
  }
}