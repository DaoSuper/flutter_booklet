import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_booklet/widgets/coordinate.dart';

// addOval用于在已有路径上添加椭圆路径，接受一个Rect 对象。
// addArc用于在已有路径上添加圆弧路径，接受一个Rect 对象，起始弧度、扫描弧度
class AddOvalDemo extends StatelessWidget {
  const AddOvalDemo({super.key});

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
  
  @override
  void paint(Canvas canvas, Size size) {
    coordinate.paint(canvas, size);
    canvas.translate(20, size.height / 2);

    Path path = Path();
    Paint paint = Paint()
      ..color = Colors.purpleAccent
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    Rect rect = Rect.fromPoints(Offset(100, 100), Offset(160, 140));
    path
      ..lineTo(100, 100)
      ..addOval(rect)
      ..relativeLineTo(100, -100)
      ..relativeLineTo(100, -100)
      ..addArc(rect.translate(100 + 60.0, -100), 0, pi);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant PaperPainter oldDelegate) => false;

}