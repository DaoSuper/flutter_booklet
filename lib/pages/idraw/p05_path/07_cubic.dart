import 'package:flutter/material.dart';
import 'package:flutter_booklet/widgets/coordinate.dart';

// cubicTo接收六个参数用于绘制三阶贝塞尔曲线
// 其中前两参是控制点1,三四参是控制点2,五六参是结束点。(下图已画出蓝色辅助点线)
// relativeCubicTo是在使用相对位置来加入三阶贝塞尔曲线路径。
class CubicToDemo extends StatelessWidget {
  const CubicToDemo({super.key});

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
  final Offset p2 = Offset(80, 50);
  final Offset p3 = Offset(160, 50);
  
  @override
  void paint(Canvas canvas, Size size) {
    coordinate.paint(canvas, size);
    canvas.translate(20, size.height / 2);

    Path path = Path();
    Paint paint = Paint()
      ..color = Colors.purpleAccent
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    path.cubicTo(p1.dx, p1.dy, p2.dx, p2.dy, p3.dx, p3.dy);
    path.relativeCubicTo(p1.dx, p1.dy, p2.dx, p2.dy, p3.dx, p3.dy);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant PaperPainter oldDelegate) => false;

}