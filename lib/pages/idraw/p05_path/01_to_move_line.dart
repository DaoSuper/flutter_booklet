import 'package:flutter/material.dart';
import 'package:flutter_booklet/widgets/coordinate.dart';

// moveTo相当于提起笔落到纸上的位置坐标，且坐标以画布原点为参考系。
// lineTo相当于从落笔点画直线到期望的坐标点，且坐标以画布原点为参考系
class ToMoveLineDemo extends StatelessWidget {
  const ToMoveLineDemo({super.key});

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
      ..color = Colors.deepPurpleAccent
      ..style = PaintingStyle.fill;


    path
      ..moveTo(0, 0) //移至(0,0)点
      ..lineTo(60, 80) //从(0,0)画线到(60, 80) 点
      ..lineTo(60, 0) //从(60,80)画线到(60, 0) 点
      ..lineTo(0, -80) //从(60, 0) 画线到(0, -80)点
      ..close();

    canvas.drawPath(path, paint);

    paint
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    path
      ..moveTo(0, 0)
      ..lineTo(-60, 80)
      ..lineTo(-60, 0)
      ..lineTo(0, -80)
      ..close();

    canvas.drawPath(path, paint);

    path.reset();

    paint
      ..color = Colors.deepPurpleAccent
      ..style = PaintingStyle.fill;

    path
      ..moveTo(0, -80)
      ..lineTo(-60, -160)
      ..lineTo(-60, -240)
      ..lineTo(0, -160)
      ..close();

    canvas.drawPath(path, paint);

    paint
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    path
      ..moveTo(0, -80)
      ..lineTo(60, -160)
      ..lineTo(60, -240)
      ..lineTo(0, -160);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant PaperPainter oldDelegate) => false;

}