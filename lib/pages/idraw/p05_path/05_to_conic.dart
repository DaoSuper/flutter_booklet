import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_booklet/widgets/coordinate.dart';

// conicTo 接收五个参数用于绘制圆锥曲线，包括椭圆线、抛物线和双曲线
// 其中前两参是控制点，三四参是结束点，第五参是权重。(下图已画出辅助点)
// 当权重< 1 时，圆锥曲线是椭圆线
// 当权重= 1 时，圆锥曲线是抛物线
// 当权重> 1 时，圆锥曲线是双曲线
class ConicToDemo extends StatelessWidget {
  const ConicToDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: CustomPaint(painter: PaperPainter())
      ),
    );
  }
}

class PaperPainter extends CustomPainter {
  final Coordinate coordinate = Coordinate();
  final Offset p1 = Offset(80, -100);
  final Offset p2 = Offset(160, 0);
  
  @override
  void paint(Canvas canvas, Size size) {
    coordinate.paint(canvas, size);
    canvas.translate(size.width / 2, size.height / 2);

    Path path = Path();
    Paint paint = Paint()
      ..color = Colors.purpleAccent
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    // 当权重= 1 时，圆锥曲线是抛物线
    path.conicTo(p1.dx, p1.dy, p2.dx, p2.dy, 1);
    canvas.drawPath(path, paint);

    path.reset();
    canvas.translate(0, -180);
    // 当权重< 1 时，圆锥曲线是椭圆线
    path.conicTo(p1.dx, p1.dy, p2.dx, p2.dy, 0.5);
    canvas.drawPath(path, paint);

    path.reset();
    canvas.translate(0, 360);
    //当权重> 1 时，圆锥曲线是双曲线
    path.conicTo(p1.dx, p1.dy, p2.dx, p2.dy, 1.5);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant PaperPainter oldDelegate) => false;

}