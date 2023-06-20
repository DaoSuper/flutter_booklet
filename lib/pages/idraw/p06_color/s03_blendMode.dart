import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_booklet/widgets/coordinate.dart';

//在画布上绘制时使用的算法
//  dst 背景，src 正在绘制的图像
class BlendModeDemo extends StatefulWidget {
  const BlendModeDemo({super.key});

  @override
  State<BlendModeDemo> createState() => _BlendModeDemoState();
}

class _BlendModeDemoState extends State<BlendModeDemo> {
  ui.Image? _image;

  @override
  void initState() {
    _loadImage();
    super.initState();
  }

  _loadImage() async{
    ByteData data = await rootBundle.load('assets/images/blr.jpeg');
    _image = await decodeImageFromList(data.buffer.asUint8List());
    setState(() {});
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
          painter: PaperPainter(_image),
        ),
      ),
    );
  }

}

class PaperPainter extends CustomPainter {

  final ui.Image? image;
  static const double step = 20; // 方格变长
  final Coordinate coordinate = Coordinate(step: step);

  // 颜色列表 256 个元素
  final List<Color> colors =
      List<Color>.generate(256, (i) => Color.fromARGB(255 - i, 255, 0, 0));

  PaperPainter(this.image);
  
  @override
  void paint(Canvas canvas, Size size) {
    if(image == null) return;

    Paint srcPaint = Paint();
    canvas.translate(size.width / 2, size.height / 2);
    canvas.translate(-step * 8, -step * 16);
    Paint dstPaint = Paint();
    BlendMode.values.asMap().forEach((i, value) {
      int line = i ~/ 5;
      int row = i % 5;
      canvas.save();

      canvas.translate(3.7 * step * row, 5.5 * step * line);
      canvas.drawImageRect(image!, Rect.fromPoints(Offset.zero, Offset(image!.width*1.0,image!.height*1.0)),
          Rect.fromCenter(center:Offset.zero, width: 25*2.0,height: 25*2.0), dstPaint);

      srcPaint
        ..color = Color(0xffff0000)
        ..blendMode = value;
      canvas.drawRect(
          Rect.fromPoints(Offset.zero, Offset(20 * 2.0, 20 * 2.0)), srcPaint);

      _simpleDrawText(canvas,value.toString().split(".")[1],offset: Offset(-10, 50));
      canvas.restore();
    });
  }

  void _simpleDrawText(Canvas canvas, String str,
      {Offset offset = Offset.zero, Color color = Colors.black}) {
    var builder = ui.ParagraphBuilder(ui.ParagraphStyle(
      textAlign: TextAlign.left,
      fontSize: 11,
      textDirection: TextDirection.ltr,
      maxLines: 1,
    ))
      ..pushStyle(
        ui.TextStyle(color: color, textBaseline: ui.TextBaseline.alphabetic),
      )
      ..addText(str);

    canvas.drawParagraph(
        builder.build()
          ..layout(ui.ParagraphConstraints(width: 11.0 * str.length)),
        offset);
  }
  
  @override
  bool shouldRepaint(covariant PaperPainter oldDelegate) => oldDelegate.image != image;
}