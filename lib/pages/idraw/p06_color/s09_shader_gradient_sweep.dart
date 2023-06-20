import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_booklet/widgets/coordinate.dart';
import 'dart:ui' as ui;

// 渐变着色器 - Gradient.sweep 扫描渐变
// Gradient.sweep(
//     Offset center, // 中心
//     List<Color> colors, //颜色
// [
//     List<double> colorStops, //每个颜色所处的分率
//     TileMode tileMode = TileMode.clamp,  //模式
//     double startAngle = 0.0,//起始角度
//     double endAngle = math.pi * 2,//终止角度
//     Float64List matrix4, //变换矩阵
//   ])
class ShaderGradientSweepDemo extends StatelessWidget {
  const ShaderGradientSweepDemo({super.key});

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
    canvas.translate(size.width / 2, size.height / 2);

    Paint paint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.blue;
    
    paint.shader = ui.Gradient.sweep(
      Offset.zero, 
      colors, 
      pos, 
      TileMode.clamp, 
      pi / 2, 
      pi
    );
    canvas.drawCircle(Offset(0, 0), 50, paint);

    //径向模式TileMode.mirror
    canvas.translate(0,  -100);
    paint.shader = ui.Gradient.sweep(
      Offset.zero, 
      colors, 
      pos, 
      TileMode.mirror, 
      pi / 2, 
      pi
    );
    canvas.drawCircle(Offset(0, 0), 50, paint);

    canvas.translate(0,  100 * 2);
    //重复模式TileMode.repeated
    paint.shader = ui.Gradient.sweep(
      Offset.zero, 
      colors, 
      pos, 
      TileMode.repeated, 
      pi / 2, 
      pi
    );
    canvas.drawCircle(Offset(0, 0), 50, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;

}