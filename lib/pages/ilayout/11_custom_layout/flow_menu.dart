

import 'package:flutter/material.dart';

class FlowMenu extends StatefulWidget {
  const FlowMenu({super.key});

  @override
  State<FlowMenu> createState() => _FlowMenuState();
}

class _FlowMenuState extends State<FlowMenu> with SingleTickerProviderStateMixin{

  late AnimationController menuAnimation;

  IconData lastTapped = Icons.notifications;
  final List<IconData> menuItems = <IconData>[
    Icons.home,
    Icons.new_releases,
    Icons.notifications,
    Icons.settings,
    Icons.menu,
  ];

  @override
  void initState() {
    super.initState();
    menuAnimation = AnimationController(
      vsync: this, 
      duration: const Duration(milliseconds: 250,)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Flow(
        delegate: FlowMenuDelegate(menuAnimation: menuAnimation),
        children: menuItems.map<Widget>((IconData icon) => flowMenuItem(icon)).toList(),
      ),
    );
  }

  Widget flowMenuItem(IconData icon) {
    const double buttonDiameter = 40;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: RawMaterialButton(
        fillColor: lastTapped == icon ? Colors.amber[700] : Colors.blue,
        splashColor: Colors.amber[100],
        shape: const CircleBorder(),
        constraints: BoxConstraints.tight(const Size(buttonDiameter, buttonDiameter)),
        onPressed: () {
          if (icon != Icons.menu) {
            setState(() => lastTapped = icon);
          }
          menuAnimation.status == AnimationStatus.completed
          ? menuAnimation.reverse()
          : menuAnimation.forward();
        },
        child: Icon(
          icon,
          color: Colors.white,
          size: 24.0,
        ),
      ),
    );
  }
}

class FlowMenuDelegate extends FlowDelegate {
  final Animation<double> menuAnimation;

  FlowMenuDelegate({required this.menuAnimation}) : super(repaint: menuAnimation);

  @override
  void paintChildren(FlowPaintingContext context) {
    double dx = 0.0;
    double dy = 0.0;
    if(menuAnimation.value == 0) {
      dy = (context.size.height - context.getChildSize(context.childCount - 1)!.height) / 2;
      context.paintChild(
        context.childCount - 1, 
        transform: Matrix4.translationValues(
          0,
          dy,
          0,
        ),
      );
    } else {
      for (int i = 0; i < context.childCount; ++i) {
        dx = context.getChildSize(i)!.width * i;
        dy = (context.size.height - context.getChildSize(i)!.height) / 2;
        context.paintChild(
          i,
          transform: Matrix4.translationValues(
            dx * menuAnimation.value,
            dy,
            0,
          ),
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant FlowMenuDelegate oldDelegate) {
    return menuAnimation != oldDelegate.menuAnimation;
  }

}