import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_booklet/widgets/coordinate.dart';

// 当想要画圆弧到某个点，用 arcToPoint 会非常方便
// 接受一个点位入参 Offset，是圆弧的终点，可指定圆弧半径radius、是否使用优弧、是否顺时针
// 左侧: 使用优弧: largeArc: true ,逆时针:clockwise: false
// 中间: 使用劣弧: largeArc: false ,顺时针:clockwise: true
// 右侧: 使用优弧: largeArc: true ,顺时针:clockwise: true
class ArcToPointDemo extends StatelessWidget {
  const ArcToPointDemo({super.key});

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
    canvas.translate(size.width / 2, size.height / 2);

    Path path = Path();
    Paint paint = Paint()
      ..color = Colors.purpleAccent
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    path.lineTo(80, -40);

    //中间: 使用劣弧
    path..arcToPoint(
      Offset(40, 40),
      radius: Radius.circular(60),
      largeArc: false
    )..close();

    canvas.drawPath(path, paint);

    path.reset();
    canvas.translate(0, -150);

    //左侧: 使用优弧
    path.lineTo(80, -40);
    path
    ..arcToPoint(
      Offset(40, 40),
      radius: Radius.circular(60),
      largeArc: true, 
      clockwise: false
    )..close();
    canvas.drawPath(path, paint);

    path.reset();
    canvas.translate(0, 300);

    // 右侧: 使用优弧
    path.lineTo(80, -40);
    path..arcToPoint(
      Offset(40, 40),
      radius: Radius.circular(60),
      largeArc: true,
    )..close();
    canvas.drawPath(path, paint);

  }

  @override
  bool shouldRepaint(covariant PaperPainter oldDelegate) => false;

}