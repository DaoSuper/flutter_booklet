
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_booklet/utils/anim_util.dart';

class OvalSingle extends StatefulWidget {
  const OvalSingle({super.key});

  @override
  State<OvalSingle> createState() => _OvalSingleState();
}

class _OvalSingleState extends State<OvalSingle> with SingleTickerProviderStateMixin{

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: AnimUtil.druationTwo);
    _animation = Tween<double>(begin: -pi, end: pi).animate(_controller);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _controller.repeat(),
      child: CustomPaint(
        painter: OvalSinglePainter(_animation),
        size: const Size(150, 150),
      ),
    );
  }
}

//让绘制物按某个函数去运动
class OvalSinglePainter extends CustomPainter {

  OvalSinglePainter(this.animation,{this.radius = 15, this.a = 0.4}) : super(repaint: animation);

  final Paint _paint = Paint();
  final double radius;
  final double a;
  final Animation<double> animation;

  final List<Color> colors = const [
    Color(0xffF44336),
    Color(0xff5C6BC0),
    Color(0xffFFB74D),
    Color(0xff8BC34A)
  ];

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(
        Offset.zero & size, Paint()..color = Colors.grey.withAlpha(11));

    double zoneSize = size.shortestSide / 2; 
    canvas.translate(size.width / 2, size.height / 2);

    // canvas.drawOval(
    //   Rect.fromCenter(
    //       center: Offset.zero,
    //       width: zoneSize * 2 - radius,
    //       height: zoneSize * a * 2 - radius),
    //   Paint()..style = PaintingStyle.stroke,
    // );

    // double x = (zoneSize - radius) * f(animation.value);
    // double y = (zoneSize - radius) * g(animation.value);

    //运动轨迹符合 sin 函数
    // double x = (zoneSize - radius) / pi * f(animation.value);
    // double y = (zoneSize - radius) / 2 * g(animation.value);

    // canvas.drawCircle(Offset(x, y), radius, _paint..color = const Color(0xffF44336));

    //四个旋转弧度为 0 、pi/2、-pi/2、pi 的单体
    drawItem(canvas, zoneSize, 0, colors[0]);
    drawItem(canvas, zoneSize, pi / 2, colors[1]);
    drawItem(canvas, zoneSize, -pi / 2, colors[2]);
    drawItem(canvas, zoneSize, pi, colors[3]);
  }

  void drawItem(Canvas canvas, double zoneSize, double rad, Color color) {
    double x = (zoneSize - radius) * f(animation.value);
    double y = (zoneSize - radius) * g(animation.value);

    canvas.save();
    canvas.rotate(rad);
    canvas.drawCircle(Offset(x, y), radius, _paint..color = color);
    canvas.restore();
  }

  double f(double t) => cos(t);

  double g(double t) => a * sin(t);

  @override
  bool shouldRepaint(covariant OvalSinglePainter oldDelegate) =>
      oldDelegate.a != a || oldDelegate.animation != animation;
}