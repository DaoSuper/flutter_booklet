
import 'package:flutter/material.dart';

class LayoutDemo extends StatelessWidget {
  const LayoutDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: UnconstrainedBox(
        child: SizedBox(
          width: 100,
          height: 100,
          child: LayoutBuilder(
            builder:(_, p1) {
              print('p1>>>>>>>$p1');
              return const ColoredBox(color: Colors.blue);
            },
          ),
        ),
      ),
    );
  }
}