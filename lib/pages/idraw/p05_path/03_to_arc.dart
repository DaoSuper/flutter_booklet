import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_booklet/widgets/coordinate.dart';

// arcTo 用于圆弧路径，指定一个矩形域，形成椭圆。
// 指定起始弧度，和扫描弧度，就可以从椭圆上截取出圆弧。
// 最后一参代表是否强行移动，如果为true，如图左，绘制圆弧时会先移动到起点。
class ArcToDemo extends StatelessWidget {
  const ArcToDemo({super.key});

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

    var rect = Rect.fromCenter(
      center: Offset(0, 0), 
      width: 160, 
      height: 160
    );

    path.lineTo(30, 30);
    path.arcTo(rect, 0, pi * 1.5, true);
    canvas.drawPath(path, paint);

    path.reset();
    canvas.translate(0, 200);

    path.lineTo(30, 30);
    path.arcTo(rect, 0, pi * 1.5, false);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant PaperPainter oldDelegate) => false;

}