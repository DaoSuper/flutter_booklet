
import 'dart:math';

import 'package:flutter/material.dart';

//类型
enum BurstType {
  circle,
  topLeft,
  bottomLeft,
  topRight,
  bottomRight,
  halfCircle
}

typedef BurstAnimItemClick = bool Function(int index);

class BurstAnim extends StatefulWidget {
  final List<Widget> menus;
  final Widget center;
  final double radius;
  final double startAngle;
  final double swapAngle;
  final double hideOpacity;
  final Duration duration;
  final BurstType burstType;
  final Curve curve;
  final BurstAnimItemClick? burstAnimItemClick;

  const BurstAnim({
    super.key, 
    required this.menus, 
    required this.center, 
    this.radius = 100, 
    this.startAngle = -60, 
    this.swapAngle = 120,
    this.hideOpacity = 0.3,
    this.duration = const Duration(milliseconds: 300), 
    this.burstType = BurstType.circle, 
    this.curve = Curves.ease, 
    this.burstAnimItemClick
  });

  const BurstAnim.topLeft({
    super.key, 
    required this.menus,
    required this.center,
    this.burstAnimItemClick,
    this.radius = 100, 
    this.hideOpacity = 0,
    this.curve = Curves.ease,
    this.duration = const Duration(milliseconds: 300),
    this.burstType = BurstType.topLeft,
    this.swapAngle = 90,
    this.startAngle = 0,
  });

  const BurstAnim.bottomLeft({
    super.key, 
    required this.menus,
    required this.center,
    this.burstAnimItemClick,
    this.radius = 100, 
    this.hideOpacity = 0.3,
    this.curve = Curves.ease,
    this.duration = const Duration(milliseconds: 300),
    this.burstType = BurstType.bottomLeft,
    this.swapAngle = 90,
    this.startAngle = -90,
  });

  const BurstAnim.topRight({
    super.key, 
    required this.menus,
    required this.center,
    this.burstAnimItemClick,
    this.radius = 100, 
    this.hideOpacity = 0.3,
    this.curve = Curves.ease,
    this.duration = const Duration(milliseconds: 500),
    this.burstType = BurstType.topRight,
    this.swapAngle = -90,
    this.startAngle = 180,
  });

  const BurstAnim.bottomRight({
    super.key, 
    required this.menus,
    required this.center,
    this.burstAnimItemClick,
    this.radius = 100, 
    this.hideOpacity = 0.3,
    this.curve = Curves.ease,
    this.duration = const Duration(milliseconds: 300),
    this.burstType = BurstType.bottomRight,
    this.swapAngle = 90,
    this.startAngle = 180,
  });

  
  @override
  State<BurstAnim> createState() => _BurstAnimState();
}

class _BurstAnimState extends State<BurstAnim> with SingleTickerProviderStateMixin{

  late AnimationController _controller;
  late Animation<double> _curveAnim;
  bool _close = true;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _curveAnim = CurvedAnimation(parent: _controller, curve: widget.curve);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant BurstAnim oldWidget) {
    super.didUpdateWidget(oldWidget);

    if(widget.duration != oldWidget.duration) {
      _controller.dispose();
      _controller = AnimationController(vsync: this, duration: widget.duration);
    }

    if(widget.curve != oldWidget.curve || widget.duration != oldWidget.duration){
      _curveAnim = CurvedAnimation(parent: _controller, curve: widget.curve);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.radius * 2,
      height: widget.burstType == BurstType.halfCircle ? widget.radius : widget.radius * 2,
      alignment: Alignment.center,
      child: Flow(
        delegate: BurstAnimDelegate(
          _curveAnim,
          startAngle: widget.startAngle,
          hideOpacity: widget.hideOpacity,
          swapAngle: widget.swapAngle,
          burstType: widget.burstType
        ),
        children: [
          ...widget.menus.asMap().keys.map((i){
            return GestureDetector(
              onTap: () => _handleItemClick(i),
              child: widget.menus[i],
            );
          }),
          GestureDetector(
            onTap: _toggle,
            child: widget.center,
          )
        ],
      ),
    );
  }

  //菜单项事件
  void _handleItemClick(int index){
    if(widget.burstAnimItemClick == null) {
      _toggle();
      return;
    }

    if(widget.burstAnimItemClick!.call(index)) _toggle();
  }


  //执行动画
  void _toggle() {
    if(_close){
      _controller.forward();
    } else {
      _controller.reverse();
    }
    _close = !_close;
  }
}


class BurstAnimDelegate extends FlowDelegate {

  // 菜单圆弧的扫描角度
  final double swapAngle;

  // 菜单圆弧的起始角度
  final double startAngle;
  final double hideOpacity;
  final BurstType burstType;

  final Animation<double> animation;

  BurstAnimDelegate(
    this.animation, {
    this.swapAngle = 120,
    this.hideOpacity = 0.3,
    this.startAngle = -60,
    this.burstType = BurstType.circle,
  }) : super(repaint: animation);

  @override
  void paintChildren(FlowPaintingContext context) {
    double radius = context.size.shortestSide / 2;
    final double halfCenterSize = context.getChildSize(context.childCount - 1)!.width / 2;

    switch (burstType) {
      case BurstType.circle:
        paintWithOffset(context, Offset.zero);
        break;
      case BurstType.topLeft:
        Offset centerOffset =
            Offset(-radius + halfCenterSize, -radius + halfCenterSize);
        paintWithOffset(context, centerOffset);
        break;
      case BurstType.bottomLeft:
        Offset centerOffset =
            Offset(-radius + halfCenterSize, radius - halfCenterSize);
        paintWithOffset(context, centerOffset);
        break;
      case BurstType.topRight:
        Offset centerOffset =
            Offset(radius - halfCenterSize, -radius + halfCenterSize);
        paintWithOffset(context, centerOffset);
        break;
      case BurstType.bottomRight:
        Offset centerOffset =
            Offset(radius - halfCenterSize, radius - halfCenterSize);
        paintWithOffset(context, centerOffset);
        break;
      case BurstType.halfCircle:
        Offset centerOffset = Offset(radius, radius - halfCenterSize);
        paintWithOffset(context, centerOffset);
        break;
    }
  }

  void paintWithOffset(FlowPaintingContext context, Offset centerOffset) {
    final double radius = context.size.shortestSide / 2;
    final int count = context.childCount - 1;
    final double perRad = swapAngle / 180 * pi / (count - 1);
    final double rotate = startAngle / 180 * pi;

    if(animation.value > hideOpacity) {
      for(int i = 0; i < count; i++){
        final double cSizeX = context.getChildSize(i)!.width / 2;
        final double cSizeY = context.getChildSize(i)!.height / 2;

        final double beforeRadius = (radius - cSizeX);
        final double now = beforeRadius + centerOffset.dy.abs();
        final swapRadius = (radius - cSizeX) / beforeRadius * now;

        final double offsetX = animation.value * swapRadius * cos(i * perRad + rotate) 
        + radius + centerOffset.dx;
        final double offsetY = animation.value * swapRadius * sin(i * perRad + rotate) 
        + radius + centerOffset.dy;

        //绘画菜单项
        context.paintChild(
          i,
          transform: Matrix4.translationValues(
            offsetX - cSizeX,
            offsetY - cSizeY,
            0.0,
          ),
          opacity: animation.value,
        );
      }
    }

    //绘画中心控制组件
    context.paintChild(
      context.childCount - 1,
      transform: Matrix4.translationValues(
        radius - context.getChildSize(context.childCount - 1)!.width / 2 + centerOffset.dx,
        radius - context.getChildSize(context.childCount - 1)!.height / 2 + centerOffset.dy,
        0.0,
      ),
    );
  }

  @override
  bool shouldRepaint(covariant FlowDelegate oldDelegate) => false;

}