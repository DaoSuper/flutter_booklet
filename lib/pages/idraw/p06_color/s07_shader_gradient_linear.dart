import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_booklet/widgets/coordinate.dart';
import 'dart:ui' as ui;

// |---- Gradient 渐变着色
// 	|--- linear 线性渐变
// 	|--- radial 径向渐变
// 	|--- sweep  扫描渐变


// 渐变着色器 - Gradient.linear线性渐变
// Gradient.linear( 
//     Offset from, //渐变起点
//     Offset to, //渐变终点
//     List<Color> colors, //渐变色
//   [
//     List<double> colorStops, //每个颜色所处的分率
//     TileMode tileMode = TileMode.clamp, //模式
//     Float64List matrix4, //变换矩阵
//   ])
class ShaderGradientLinearDemo extends StatelessWidget {
  const ShaderGradientLinearDemo({super.key});

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
  final Coordinate coordinate = Coordinate();
  final List<Color> colors = const [
    Color(0xFFF60C0C),
    Color(0xFFF3B913),
    Color(0xFFE7F716),
    Color(0xFF3DF30B),
    Color(0xFF0DF6EF),
    Color(0xFF0829FB),
    Color(0xFFB709F4),
  ];
  final List<double> pos = [1.0 / 7, 2.0 / 7, 3.0 / 7, 4.0 / 7, 5.0 / 7, 6.0 / 7, 1.0];

  @override
  void paint(Canvas canvas, Size size) {
    coordinate.paint(canvas, size); //绘制坐标系
    canvas.translate(size.width / 2 - 100, size.height / 2);

    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.blue
      ..strokeJoin = StrokeJoin.miter
      ..strokeWidth = 50;
    
    paint.shader = ui.Gradient.linear(Offset(0, 0), Offset(100, 0), colors, pos);
    canvas.drawLine(
      Offset(0, 0),
      Offset(200, 0),
      paint,
    );

    canvas.translate(0,  -100);

    //径向模式TileMode.mirror
    paint.shader = ui.Gradient.linear(
      Offset(0, 0), 
      Offset(100, 0), 
      colors, 
      pos,
      TileMode.mirror,
    );
    canvas.drawLine(Offset.zero, Offset(200, 0), paint);

    canvas.translate(0,  -100);
    //重复模式TileMode.repeated
    paint.shader = ui.Gradient.linear(
      Offset(0, 0), 
      Offset(100, 0), 
      colors, 
      pos,
      TileMode.repeated,
    );
    canvas.drawLine(Offset.zero, Offset(200, 0), paint);


    canvas.translate(0, 100 * 3);
    //matrix4旋转
    paint.shader = ui.Gradient.linear(
      Offset(0, 0), 
      Offset(100, 0), 
      colors, 
      pos, 
      TileMode.mirror,
      Matrix4.rotationZ(pi/6).storage
    );
    canvas.drawLine(
      Offset(0, 0),
      Offset(200, 0),
      paint,
    );

    canvas.translate(0, 100);
    //matrix4移动
    paint.shader = ui.Gradient.linear(
      Offset(0, 0), 
      Offset(100, 0), 
      colors, 
      pos, 
      TileMode.mirror,
      Matrix4.translationValues(20, 0, 0).storage
    );
    canvas.drawLine(
      Offset(0, 0),
      Offset(200, 0),
      paint,
    );

    canvas.translate(0, 100);
    //matrix4倾斜
    paint.shader = ui.Gradient.linear(
      Offset(0, 0), 
      Offset(100, 0), 
      colors, 
      pos, 
      TileMode.mirror,
      Matrix4.skewX(-pi/6).storage
    );
    canvas.drawLine(
      Offset(0, 0),
      Offset(200, 0),
      paint,
    );

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;

}