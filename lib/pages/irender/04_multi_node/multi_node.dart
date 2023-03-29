import 'package:flutter/material.dart';
class MultiNode extends StatelessWidget {
  const MultiNode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: const [
          SizedBox(
            width: 60,
            height: 60,
            child: ColoredBox(color: Colors.red),
          ),
          SizedBox(
            width: 40,
            height: 40,
            child: ColoredBox(color: Colors.yellow),
          ),
          SizedBox(
            width: 20,
            height: 20,
            child: ColoredBox(color: Colors.blue),
          ),
        ],
      ),
    );
  }
}