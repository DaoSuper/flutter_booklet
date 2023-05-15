import 'package:flutter/material.dart';
import 'package:flutter_booklet/widgets/coordinate.dart';

class RectColorsDemo extends StatelessWidget {
  const RectColorsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: CustomPaint(
          // 使用CustomPaint
          painter: PaperPainter(),
        ),
      ),
    );
  }
}

class PaperPainter extends CustomPainter {
  static const double step = 15; // 方格变长
  final Coordinate coordinate = Coordinate(step: step);
  // 颜色列表 256 个元素
  final List<Color> colors = List<Color>.generate(256, (i) => Color.fromARGB(255 - i, 255, 0, 0));
  
  @override
  void paint(Canvas canvas, Size size) {

    Paint paint = Paint();
    canvas.save();
    canvas.translate(size.width / 2, size.height / 2);
    canvas.translate(-step * 8.0, -step * 8.0);
    colors.asMap().forEach((i, color) {
      int line = (i % 16);
      int row = i ~/ 16;
      var topLeft = Offset(step * line, step * row);
      var rect = Rect.fromPoints(topLeft, topLeft.translate(step, step));
      canvas.drawRect(rect, paint..color = color);
    });

    canvas.restore();
    coordinate.paint(canvas, size); //绘制坐标系
  }
  
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}