import 'package:flutter/material.dart';
import 'package:flutter_booklet/widgets/coordinate.dart';

//使用相对的坐标会更方便调整(左侧只需移动起始点即可全部移动)
class RelativeMoveLineDemo extends StatelessWidget {
  const RelativeMoveLineDemo({super.key});

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
      ..color = Colors.green
      ..style = PaintingStyle.fill;

    path
      ..relativeMoveTo(0, 0)
      ..relativeLineTo(100, 120)
      ..relativeLineTo(-10, -60)
      ..relativeLineTo(60, -10)
      ..close();
      canvas.drawPath(path, paint);

    paint
      ..style = PaintingStyle.stroke..color=Colors.green
      ..strokeWidth = 2;
    path
      ..relativeMoveTo(-200, 0)
      ..relativeLineTo(100, 120)
      ..relativeLineTo(-10, -60)
      ..relativeLineTo( 60,-10,)..close();
    canvas.drawPath(path, paint);

  }
  
  @override
  bool shouldRepaint(covariant PaperPainter oldDelegate) => false;
}