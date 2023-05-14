import 'package:flutter/material.dart';
import 'package:flutter_booklet/widgets/coordinate.dart';

// path#close ：用于将路径尾点和起点，进行路径封闭。
// path#reset ：用于将路径进行重置，清除路径内容。
// path#shift ：指定点Offset将路径进行平移，且返回一条新的路径。
class CloseResetShiftDemo extends StatelessWidget {
  const CloseResetShiftDemo({super.key});

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
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    path
      ..lineTo(100, 100)
      ..relativeLineTo(0, -50)
      ..close();

    canvas.drawPath(path, paint);

    canvas.drawPath(path.shift(Offset(100, 0)), paint);
    canvas.drawPath(path.shift(Offset(-100, 0)), paint);
  }

  @override
  bool shouldRepaint(covariant PaperPainter oldDelegate)  => false;

}