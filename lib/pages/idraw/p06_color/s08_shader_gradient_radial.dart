import 'package:flutter/material.dart';
import 'package:flutter_booklet/widgets/coordinate.dart';
import 'dart:ui' as ui;

// 渐变着色器 - Gradient.radial 径向渐变
//  Gradient.radial(
//     Offset center, // 中心
//     double radius, // 半径
//     List<Color> colors, //颜色
//   [
//     List<double> colorStops, //每个颜色所处的分率
//     TileMode tileMode = TileMode.clamp, //模式
//     Float64List matrix4,  //变换矩阵
//     Offset focal, //焦点坐标
//     double focalRadius = 0.0 //焦点半径
//   ]) 
class ShaderGradientRadialDemo extends StatelessWidget {
  const ShaderGradientRadialDemo({super.key});

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
    
    paint.shader = ui.Gradient.radial(
      Offset(0, 0), 
      25, 
      colors, 
      pos,
      TileMode.clamp
    );
    canvas.drawCircle(Offset(0, 0), 50, paint);

    //径向模式TileMode.mirror
    canvas.translate(0,  -100);
    paint.shader = ui.Gradient.radial(
      Offset(0, 0), 
      25, 
      colors, 
      pos,
      TileMode.mirror,
    );
    canvas.drawCircle(Offset(0, 0), 50, paint);

    canvas.translate(0,  -100);
    //重复模式TileMode.repeated
    paint.shader = ui.Gradient.radial(
      Offset(0, 0), 
      25, 
      colors, 
      pos,
      TileMode.repeated,
    );
    canvas.drawCircle(Offset(0, 0), 50, paint);

    //焦点偏移和焦点半径可以控制渐变
    canvas.translate(0, 100 *3);
    paint.shader = ui.Gradient.radial(
      Offset(0, 0), 
      25, 
      colors,
      pos, 
      TileMode.mirror,
      null, 
      Offset(10, 10),
      1
    );
    canvas.drawCircle(
      Offset.zero,
      50,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;

}