
import 'package:flutter/material.dart';

class CustomFlowDemo extends StatefulWidget {
  const CustomFlowDemo({super.key});

  @override
  State<CustomFlowDemo> createState() => _CustomFlowDemoState();
}

class _CustomFlowDemoState extends State<CustomFlowDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Align(
        alignment: Alignment.center,
        child: Flow(
          delegate: SimpleFlowDelegate(spacer: 10),
          children: const [
            Box50(Colors.red),
            Box50(Colors.yellow),
            Box50(Colors.blue),
            Box50(Colors.green),
          ],
        ),
      ),
    );
  }
}

class Box50 extends StatelessWidget {
  final Color color;

  const Box50(this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      color: color,
    );
  }
}

class SimpleFlowDelegate extends FlowDelegate {
  final int spacer;

  SimpleFlowDelegate({this.spacer = 0});

  @override
  void paintChildren(FlowPaintingContext context) {
    double dx = 0.0;
    for (int i = 0; i < context.childCount; i++) {
      dx = context.getChildSize(i)!.width * i;
      context.paintChild(i, transform: Matrix4.translationValues(dx + spacer * i, 0, 0));
    }
  }

  @override
  BoxConstraints getConstraintsForChild(int i, BoxConstraints constraints) {
    return constraints.loosen();
  }

  @override
  bool shouldRepaint(covariant SimpleFlowDelegate oldDelegate) => oldDelegate.spacer != spacer;

}