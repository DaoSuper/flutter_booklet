import 'package:flutter/material.dart';
import 'package:flutter_booklet/widgets/coordinate.dart';

// Patn#combine用于结合两个路径，并生成新路径
class CombineDemo extends StatelessWidget {
  const CombineDemo({super.key});

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
    Paint paint = Paint();
    paint
      ..color = Colors.purple
      ..style = PaintingStyle.fill;
    path
      ..relativeMoveTo(0, 0)
      ..relativeLineTo(-30, 120)
      ..relativeLineTo(30, -30)
      ..relativeLineTo(30,30)
      ..close();


    var pathOval =Path()..addOval(Rect.fromCenter(center: Offset(0, 0),width: 60,height: 60));
    canvas.drawPath(Path.combine(PathOperation.difference, path, pathOval), paint);

    canvas.translate(0, -120);
    canvas.drawPath(Path.combine(PathOperation.intersect, path, pathOval), paint);

    canvas.translate(120, 0);
    canvas.drawPath(Path.combine(PathOperation.union, path, pathOval), paint);

    canvas.translate(-120*2.0, 0);
    canvas.drawPath(Path.combine(PathOperation.reverseDifference, path, pathOval), paint);

    canvas.translate(0, 120);
    canvas.drawPath(Path.combine(PathOperation.xor, path, pathOval), paint);
  }

  @override
  bool shouldRepaint(covariant PaperPainter oldDelegate)  => false;

}