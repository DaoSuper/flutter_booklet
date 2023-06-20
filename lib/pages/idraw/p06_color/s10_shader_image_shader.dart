import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_booklet/widgets/coordinate.dart';
import 'dart:ui' as ui;

// 图片着色器 ImageShader
// ImageShader(
//     Image image,  //图片
//     TileMode tmx, //水平方向模式
//     TileMode tmy, //竖直方向模式
//     Float64List matrix4  // 变化矩阵
// )

class ImageShaderDemo extends StatefulWidget {
  const ImageShaderDemo({super.key});

  @override
  State<ImageShaderDemo> createState() => _ImageShaderDemoState();
}

class _ImageShaderDemoState extends State<ImageShaderDemo> {
  ui.Image? _image;

  @override
  void initState() {
    _loadImage();
    super.initState();
  }

  _loadImage() async {
    ByteData byteData = await rootBundle.load('assets/images/blr.jpeg');
    _image = await decodeImageFromList(byteData.buffer.asUint8List());
    setState(() {
      
    });
  }

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