import 'package:flutter/material.dart';
import 'package:flutter_booklet/widgets/coordinate.dart';

// addRect用于在已有路径上添加矩形路径，接受一个Rect对象。
// addRRect用于在已有路径上添加圆角矩形路径，接受一个RRect对象。
class AddRRectDemo extends StatelessWidget {
  const AddRRectDemo({super.key});

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

    Rect rect = Rect.fromPoints(Offset(100, 100), Offset(160, 160));
    path
      ..lineTo(100, 100)
      ..addRect(rect)
      ..relativeLineTo(100, -100)
      ..relativeLineTo(100, -100)
      ..addRRect(RRect.fromRectXY(rect.translate(100, -100), 10, 10))
      ..addRRect(RRect.fromRectXY(rect.translate(200, -200), 10, 10));
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant PaperPainter oldDelegate) => false;

}