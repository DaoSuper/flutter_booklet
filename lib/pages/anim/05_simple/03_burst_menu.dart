

import 'dart:math';
import 'package:flutter/material.dart';

typedef BurstMenuItemClick = bool Function(int index);

class BurstMenu extends StatefulWidget {
  final List<Widget> menus;
  final Widget center;
  final BurstMenuItemClick? burstMenuItemClick;

    // 菜单圆弧的扫描角度
  final double swapAngle;

  // 菜单圆弧的起始角度
  final double startAngle;
  
  const BurstMenu({super.key, 
    required this.menus, 
    required this.center, 
    this.swapAngle = 120, 
    this.startAngle = -60,
    this.burstMenuItemClick
  });

  @override
  State<BurstMenu> createState() => _BurstMenuState();
}

class _BurstMenuState extends State<BurstMenu> with SingleTickerProviderStateMixin{

  late AnimationController _controller;
  late Animation<double> _animation;

  bool _close = true;
  
  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 200));
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Flow(
      delegate: CircleFlowDelegate(
        startAngle: widget.swapAngle,
        swapAngle: widget.swapAngle,
        animation: _animation
      ),
      children: [
        ...widget.menus.asMap().keys.map((index){
          return GestureDetector(
            onTap: () => _handleItemClick(index),
            child: widget.menus[index],
          );
        }),
        GestureDetector(
          onTap: _toggle,
          child: widget.center,
        )
      ],
    );
  }

  void _handleItemClick(int index){
    if(widget.burstMenuItemClick == null) {
      _toggle();
      return;
    }

    if(widget.burstMenuItemClick!.call(index)) _toggle();
  }


  //执行动画
  _toggle() {
    if(_close){
      _controller.forward();
    } else {
      _controller.reverse();
    }
    _close = !_close;
  }

}

class CircleFlowDelegate extends FlowDelegate{

  // 菜单圆弧的扫描角度
  final double swapAngle;

  // 菜单圆弧的起始角度
  final double startAngle;

  final Animation<double> animation;

  final double hideOpacity = 0.3;

  CircleFlowDelegate({
    this.swapAngle = 120,
    this.startAngle = -60,
    required this.animation
  }): super(repaint: animation); // super(repaint: ) 来监听一个可监听对象进行主动更新

  // context.size：Flow 组件的布局尺寸，如下图外层的大框。
  // context.childCount : 子组件的个数。
  // context.getChildSize(i) : 获取第 i 个孩子的尺寸。
  @override
  void paintChildren(FlowPaintingContext context) {
    double radius = context.size.shortestSide / 2;
    final int count = context.childCount - 1;
    // final double perRad = 360 / 180 * pi / count;
    final double perRad = swapAngle / 180 * pi / (count - 1);
    double rotate = startAngle / 180 * pi;

    for (int i = 0; i < count; i++) {
      final double cSizeX = context.getChildSize(i)!.width / 2;
      final double cSizeY = context.getChildSize(i)!.height / 2;
      // final double offsetX = (radius - cSizeX) * cos(i * perRad) + radius;
      // final double offsetY = (radius - cSizeY) * sin(i * perRad) + radius;

      // final double offsetX = (radius - cSizeX) * cos(i * perRad + rotate) + radius;
      // final double offsetY = (radius - cSizeY) * sin(i * perRad + rotate) + radius;

      final double offsetX = animation.value * (radius - cSizeX) * cos(i * perRad + rotate) + radius;
      final double offsetY = animation.value * (radius - cSizeY) * sin(i * perRad + rotate) + radius;

      if(animation.value > hideOpacity){
        context.paintChild(
          i,
          transform: Matrix4.translationValues(
            offsetX - cSizeX,
            offsetY - cSizeY,
            0.0,
          ),
          opacity: animation.value
        );
      }
    }

    context.paintChild(
      context.childCount - 1,
      transform: Matrix4.translationValues(
        radius - context.getChildSize(context.childCount - 1)!.width / 2,
        radius - context.getChildSize(context.childCount - 1)!.height / 2,
        0.0,
      ),
    );
  }

  @override
  bool shouldRepaint(CircleFlowDelegate oldDelegate) => swapAngle != oldDelegate.swapAngle ||
      startAngle != oldDelegate.startAngle;

}