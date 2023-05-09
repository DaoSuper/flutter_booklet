import 'dart:math';

import 'package:flutter/material.dart';

class CircleFlowMenu extends StatefulWidget {
  const CircleFlowMenu({super.key});

  @override
  State<CircleFlowMenu> createState() => _CircleFlowMenuState();
}

class _CircleFlowMenuState extends State<CircleFlowMenu> with SingleTickerProviderStateMixin{
  static const List<IconData> menuItems = <IconData>[
    // Icons.menu,
    Icons.home,
    Icons.new_releases,
    Icons.notifications,
    Icons.settings,
    Icons.refresh,
    Icons.close,
  ];

  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    controller = AnimationController(vsync: this,duration: const Duration(milliseconds: 250));
    animation = CurveTween(curve: Curves.ease).animate(controller);
    super.initState();
  }

  Widget flowMenuItem(IconData icon) {
    return RawMaterialButton(
      fillColor: Colors.blue,
      splashColor: Colors.amber[100],
      shape: const CircleBorder(),
      constraints: BoxConstraints.tight(const Size(40, 40)),
      onPressed: () {
        animation.status == AnimationStatus.completed
          ? controller.reverse()
          : controller.forward();
      },
      child: Icon(
        icon,
        color: Colors.white,
        size: 25.0,
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Align(
        alignment: Alignment.topLeft,
        child: ColoredBox(
          color: Colors.orange.withOpacity(0.2),
          child: Flow(
            delegate: CircleFlowDelegate(
              animation: animation,
              location: MenuLocation.centerRight
            ),
            children: menuItems.map<Widget>((IconData icon) => flowMenuItem(icon)).toList(),
          ),
        ),
      ),
    );
  }
}

enum MenuLocation {
  topLeft,
  topRight,
  centerLeft,
  centerRight,
  bottomLeft,
  bottomRight,
}

class CircleFlowDelegate extends FlowDelegate {
  final Animation<double> animation;
  final MenuLocation location;

  CircleFlowDelegate({
    required this.animation,
    this.location = MenuLocation.centerLeft,
  }) : super(repaint: animation);


  @override
  void paintChildren(FlowPaintingContext context) {
    if(context.childCount == 0) return;
    final double radius = context.size.shortestSide / 2;
    final int count = context.childCount - 1;
    double angle = 90;
    //控制四周图标与中心的距离
    double progress = animation.value;
    final double perRad = angle / 180 * pi / (count - 1);
    // final double fixRotate = (angle / 2) / 180 * pi;
    double fixRotate = 0;
    switch (location) {
      case MenuLocation.topLeft:
        fixRotate = 270 / 180 * pi;
        break;
      case MenuLocation.topRight:
        fixRotate = 0;
        break;
      case MenuLocation.centerLeft:
        fixRotate = (angle / 2) / 180 * pi;
        break;
      case MenuLocation.centerRight:
      
        fixRotate = (angle * 5 /2) / 180 * pi;
        break;
      case MenuLocation.bottomLeft:
        fixRotate = 90 / 180 * pi;
        break;
      case MenuLocation.bottomRight:
        fixRotate = pi;
        break;
    }
    //（x1,y1) (x0,y0)圆心 r半径 a0角度
    // x1 = x0 + r * cos(a0 * pi / 180)
    // y1 = y0 + r * sin(a0 * pi / 180)
    if (progress != 0) {
      for (int i = 0; i < count; i++) {
        final Size size = context.getChildSize(i) ?? Size.zero;
        final double offsetX =
            progress * (radius - size.width / 2) * cos(i * perRad - fixRotate) +
                radius;
        final double offsetY = progress *
                (radius - size.height / 2) *
                sin(i * perRad - fixRotate) +
            radius;

        Offset fix = fixOffset(radius, size);

        context.paintChild(i + 1,
          transform: Matrix4.translationValues(
            offsetX - size.width / 2 - fix.dx,
            offsetY - size.height / 2 - fix.dy,
            0.0,
          )
        );
      }
    }

    final Size menuSize = context.getChildSize(0) ?? Size.zero;
    Offset fix = fixOffset(radius, menuSize);
    context.paintChild(0,
      transform: Matrix4.translationValues(
        radius - menuSize.width / 2 - fix.dx,
        radius - menuSize.height / 2 - fix.dy,
        0.0
      )
    );
  }

  Offset fixOffset(double radius, Size childSize) {
    double fixOffsetX = 0;
    double fixOffsetY = 0;
    switch (location) {
      case MenuLocation.topLeft:
        fixOffsetX = -(radius - childSize.width / 2);
        fixOffsetY = radius - childSize.height / 2;
        break;
      case MenuLocation.topRight:
        fixOffsetX = radius - childSize.width / 2;
        fixOffsetY = radius - childSize.height / 2;
        break;
      case MenuLocation.centerLeft:
        fixOffsetX = radius - childSize.width / 2;
        fixOffsetY = 0;
        break;
      case MenuLocation.centerRight:
        fixOffsetX = -(radius - childSize.width / 2);
        fixOffsetY = 0;
        break;
      case MenuLocation.bottomLeft:
        fixOffsetX = radius - childSize.width / 2;
        fixOffsetY = -(radius - childSize.height / 2);
        break;
      case MenuLocation.bottomRight:
        fixOffsetX = -(radius - childSize.width / 2);
        fixOffsetY = -(radius - childSize.height / 2);
        break;
    }
    return Offset(fixOffsetX, fixOffsetY);
  }

  @override
  Size getSize(BoxConstraints constraints) {
    final radius = constraints.biggest.shortestSide;
    return Size(radius, radius);
  }

  @override
  BoxConstraints getConstraintsForChild(int i, BoxConstraints constraints) {
    return constraints.loosen();
  }

  @override
  bool shouldRepaint(covariant FlowDelegate oldDelegate) {
    return true;
  }

}