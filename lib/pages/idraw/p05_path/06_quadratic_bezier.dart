import 'package:flutter/material.dart';
import 'package:flutter_booklet/widgets/coordinate.dart';

// quadraticBezierTo接收四个参数用于绘制二阶贝塞尔曲线。
// 其中前两参是控制点,三四参是结束点。(下图已画出蓝色辅助点线)
// relativeQuadraticBezierTo是在使用相对位置来加入二阶贝塞尔曲线路径。
class QuadraticBezierToDemo extends StatelessWidget {
  const QuadraticBezierToDemo({super.key});

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
  final Offset p1 = Offset(100, -100);
  final Offset p2 = Offset(160, 50);
  
  @override
  void paint(Canvas canvas, Size size) {
    coordinate.paint(canvas, size);
    canvas.translate(20, size.height / 2);

    Path path = Path();
    Paint paint = Paint()
      ..color = Colors.purpleAccent
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    path.quadraticBezierTo(p1.dx, p1.dy, p2.dx, p2.dy);
    path.relativeQuadraticBezierTo(p1.dx, p1.dy, p2.dx, p2.dy);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant PaperPainter oldDelegate) => false;

}