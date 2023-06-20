import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_booklet/widgets/coordinate.dart';

// Paint#contains可以判断点Offset在不在路径之内(如下图紫色区域)，
// 这是个非常好用的方法，可以根据这个方法做一些触点判断或简单的碰撞检测。
// Paint#getBounds可以获取当前路径所在的矩形区域，(如下橙色区域)
//Path#transform: 路径变换
class GetBoundsContainsDemo extends StatelessWidget {
  const GetBoundsContainsDemo({super.key});

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
      ..style = PaintingStyle.fill;

    path
      ..relativeMoveTo(0, 0)
      ..relativeLineTo(-30, 120)
      ..relativeLineTo(30, -30)
      ..relativeLineTo(30, 30)
      ..close();

      canvas.drawPath(path, paint);
      

      //使用Matrix4生成矩阵。能很方便进行旋转、平移、缩放、斜切等变换效果。
      for(int i = 0; i < 8; i++){
        canvas.drawPath(path.transform(Matrix4.rotationZ(i*pi/4).storage), paint);
      }

      debugPrint(path.contains(Offset(20, 20)).toString());
      debugPrint(path.contains(Offset(0, 20)).toString());

      Rect bounds = path.getBounds();
      canvas.drawRect(bounds, Paint()
      ..color = Colors.orange
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1);

      
  }

  @override
  bool shouldRepaint(covariant PaperPainter oldDelegate)  => false;

}