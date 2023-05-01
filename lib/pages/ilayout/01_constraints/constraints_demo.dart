import 'package:flutter/material.dart';

class ConstraintsDemo extends StatelessWidget {
  const ConstraintsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    // return const UnconstrainedBox(
    //   child: SizedBox(
    //     width: 100,
    //     height: 100,
    //     child: ColoredBox(color: Colors.blue),
    //   ),
    // );
    return ColoredBox(
      color: Colors.white,
      child: CustomSingleChildLayout(
        delegate: DiyLayoutDelegate(),
        child: const ColoredBox(color: Colors.blue),
      ),
    );
  }
}

class DiyLayoutDelegate extends SingleChildLayoutDelegate {
  @override
  bool shouldRelayout(covariant SingleChildLayoutDelegate oldDelegate) => false;

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    return BoxConstraints.tight(const Size(100, 100));
  }

}