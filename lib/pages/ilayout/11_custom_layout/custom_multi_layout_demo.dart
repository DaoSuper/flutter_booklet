

import 'package:flutter/material.dart';

class CustomMultiLayoutDemo extends StatefulWidget {
  const CustomMultiLayoutDemo({super.key});

  @override
  State<CustomMultiLayoutDemo> createState() => _CustomMultiLayoutDemoState();
}

class _CustomMultiLayoutDemoState extends State<CustomMultiLayoutDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Align(
      alignment: Alignment.center,
      child: ColoredBox(
        color: Colors.orange.withOpacity(0.2),
        child:
        CustomMultiChildLayout(
          delegate: CornerCustomMultiChildLayout(
            padding: const EdgeInsets.fromLTRB(100, 30, 40, 100)
          ),
          children: [
            LayoutId(id: CornerType.topLeft, child: Box50(Colors.red)),
            LayoutId(id: CornerType.topRight, child: Box50(Colors.yellow)),
            LayoutId(id: CornerType.bottomLeft, child: Box50(Colors.blue)),
            LayoutId(id: CornerType.bottomRight, child: Box50(Colors.green)),
          ],
        ),
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

enum CornerType{
  topLeft,
  topRight,
  bottomLeft,
  bottomRight
}

class CornerCustomMultiChildLayout extends MultiChildLayoutDelegate {

  final EdgeInsets padding;

  CornerCustomMultiChildLayout({this.padding = EdgeInsets.zero});

  @override
  void performLayout(Size size) {
    BoxConstraints childBoxConstraints = BoxConstraints.loose(size);

    if(hasChild(CornerType.topLeft)) {
      layoutChild(CornerType.topLeft, childBoxConstraints);
      positionChild(
        CornerType.topLeft,
        Offset.zero.translate(padding.left, padding.top)
      );
    }
    if(hasChild(CornerType.topRight)) {
      var childSize = layoutChild(CornerType.topRight, childBoxConstraints);
      positionChild(
        CornerType.topRight,
        Offset(size.width - childSize.width, 0).translate(-padding.right
        , padding.top)
      );
    }

    if(hasChild(CornerType.bottomLeft)) {
      var childSize = layoutChild(CornerType.bottomLeft, childBoxConstraints);
      positionChild(
        CornerType.bottomLeft,
        Offset(0, size.height - childSize.height).translate(padding.left
        , -padding.bottom)
      );
    }

    if(hasChild(CornerType.bottomRight)) {
      var childSize = layoutChild(CornerType.bottomRight, childBoxConstraints);
      positionChild(
        CornerType.bottomRight,
        Offset(size.width - childSize.width, size.height - childSize.height).translate(-padding.right
        , -padding.bottom)
      );
    }
  }

  @override
  bool shouldRelayout(covariant CornerCustomMultiChildLayout oldDelegate) => oldDelegate.padding != padding;

}