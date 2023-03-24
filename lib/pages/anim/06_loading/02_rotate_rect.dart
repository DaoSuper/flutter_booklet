
import 'package:flutter/material.dart';
import 'package:flutter_booklet/utils/anim_util.dart';
import 'dart:math';

class RotateRect extends StatefulWidget {
  const RotateRect({super.key});

  @override
  State<RotateRect> createState() => _RotateRectState();
}

class _RotateRectState extends State<RotateRect> with SingleTickerProviderStateMixin {

  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: AnimUtil.druationTwo);
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
        painter: RotateRectPainter(_controller),
        size: const Size(200, 200),
      ),
    );
  }
}


class RotateRectPainter extends CustomPainter {

  RotateRectPainter(this.animation, {this.itemWidth = 33}) : super(repaint: animation);

  final double itemWidth;
  final List<Color> colors = const [
    Color(0xffF44336),  Color(0xff5C6BC0), Color(0xffFFB74D), Color(0xff8BC34A)
  ];
  final Paint _paint = Paint(); //画板
  final double span = 16; //色块间隔

  final Animation<double> animation;

  final Animatable<double> rotateTween = Tween<double>(begin: pi, end: -pi)
  .chain(CurveTween(curve: Curves.easeIn));
  
  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(size.width / 2, size.height / 2);
    canvas.rotate(animation.value * pi * 2);
    final double len = itemWidth / 2 + span / 2;

    // 绘制红色
    Offset centerA = Offset(-len, -len);
    drawItem(canvas, centerA, colors[0]);

    // 绘制蓝色
    Offset centerB = Offset(len, len);
    drawItem(canvas, centerB, colors[1]);

    // 绘制橙色
    Offset centerC = Offset(len, -len);
    drawItem(canvas, centerC, colors[2]);

    // 绘制绿色
    Offset centerD = Offset(-len, len);
    drawItem(canvas, centerD, colors[3]);
  }

  void drawItem(Canvas canvas, Offset center, Color color) {
    Rect rect = Rect.fromCenter(center: center, width: itemWidth, height: itemWidth);
    canvas.save();
    canvas.translate(center.dx, center.dy);
    canvas.rotate(rotateTween.evaluate(animation));
    canvas.translate(-center.dx, -center.dy);
    canvas.drawRRect(RRect.fromRectAndRadius(rect, const Radius.circular(5)), _paint..color = color);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant RotateRectPainter oldDelegate) => oldDelegate.animation != animation || oldDelegate.itemWidth != itemWidth;

}