import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:flutter_booklet/widgets/coordinate.dart';

class TextPaper extends StatefulWidget {
  const TextPaper({super.key});

  @override
  State<TextPaper> createState() => _TextPaperState();
}

class _TextPaperState extends State<TextPaper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: CustomPaint(painter: TextPaperPainter())
      ),
    );
  }
}

class TextPaperPainter extends CustomPainter {
  final Coordinate coordinate = Coordinate();

  late Paint _paint;

  final double strokeWidth = 0.5;
  final Color color = Colors.blue;

  TextPaperPainter() {
    _paint = Paint()
      ..style = PaintingStyle.fill
      ..strokeWidth = strokeWidth
      ..color = color;
  }
  @override
  void paint(Canvas canvas, Size size) {
    coordinate.paint(canvas, size);
    canvas.translate(size.width / 2, size.height / 2);
     _drawTextWithParagraph(canvas);
     _drawTextPaint(canvas);
     _drawTextPaintShowSize(canvas);
  }

  void _drawTextWithParagraph(Canvas canvas) {
    var builder = ui.ParagraphBuilder(ui.ParagraphStyle(
      textAlign: TextAlign.right,
      fontSize: 40,
      textDirection: TextDirection.ltr,
      maxLines: 1
    ));

    builder.pushStyle(ui.TextStyle(
      color: Colors.black87,
      textBaseline: ui.TextBaseline.alphabetic
    ));

    builder.addText("Flutter Unit");
    ui.Paragraph paragraph = builder.build();
    paragraph.layout(ui.ParagraphConstraints(width: 300));
    canvas.drawParagraph(paragraph, Offset(-100, 0));
    canvas.drawRect(Rect.fromLTRB(0, 0, 300, 40 ), 
                  _paint..color = Colors.blue.withAlpha(33));
  }

  void _drawTextPaint(Canvas canvas) {
    var textPainter = TextPainter(
        text: TextSpan(
            text: 'Flutter Unit',
            style: TextStyle(fontSize: 40,color: Colors.black)),
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr);
    textPainter.layout(); // 进行布局
    textPainter.paint(canvas, Offset(0, -100)); // 进行绘制
  }

  void _drawTextPaintShowSize(Canvas canvas) {
  TextPainter textPainter = TextPainter(
      text: TextSpan(
          text: 'Flutter Unit',
          style: TextStyle(
              fontSize: 40,
              color: Colors.black)),
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr);
  textPainter.layout(); // 进行布局
  Size size = textPainter.size; // 尺寸必须在布局后获取
  textPainter.paint(canvas, Offset(-size.width / 2, -size.height / 2));
  
  canvas.drawRect(
      Rect.fromLTRB(0, 0, size.width, size.height)
          .translate(-size.width / 2, -size.height / 2),
      _paint..color = Colors.blue.withAlpha(33));
}

  @override
  bool shouldRepaint(covariant TextPaperPainter oldDelegate) => false;

}