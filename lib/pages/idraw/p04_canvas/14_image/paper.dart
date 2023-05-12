import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_booklet/pages/idraw/p04_canvas/coordinate.dart';
import 'package:flutter_booklet/pages/irender/10_widgets_binding/m.dart';

class PaperDemo extends StatefulWidget {
  const PaperDemo({super.key});

  @override
  State<PaperDemo> createState() => _PaperDemoState();
}

class _PaperDemoState extends State<PaperDemo> {
  ui.Image? _image;
  DrawImageType _drawType = DrawImageType.imag;

  @override
  void initState() {
    super.initState();
    _loadImage();
  }

  void _loadImage() async {
    _image = await loadImageFromAssets('assets/images/blr.jpeg');
    setState(() {
      
    });
  }

  Future<ui.Image>? loadImageFromAssets(String path) async{
    ByteData data = await rootBundle.load(path);
    return decodeImageFromList(data.buffer.asUint8List());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Expanded(child: Container(
              color: Colors.white,
              child: CustomPaint(painter: PaperPainter(_image, _drawType))
            )),
            Padding(
              padding: const EdgeInsets.only(bottom: 30, left: 20, right: 20),
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: () => changeType(DrawImageType.imag), 
                    child: const Text('drawImage')
                  ),
                  const SizedBox(width: 10,),
                  ElevatedButton(
                    onPressed: () => changeType(DrawImageType.imageRect), 
                    child: const Text('drawImage')
                  )
                ],
              )
            )
          ],
        ),
      ),
    );
  }

  changeType(DrawImageType type) {
    if(_drawType != type) {
      _drawType = type;
      setState(() {
        
      });
    }
  }
}

enum DrawImageType {
  imag,
  imageRect
}


class PaperPainter extends CustomPainter {

  ui.Image? image;
  
  late Paint _paint;

  final double strokeWidth = 0.5;
  final Color color = Colors.blue;
  final DrawImageType drawType;
  final Coordinate coordinate = Coordinate();

  PaperPainter(this.image, this.drawType) {
    _paint = Paint()
    ..style = PaintingStyle.fill
    ..strokeWidth = strokeWidth
    ..color = color;
  }

  @override
  void paint(ui.Canvas canvas, ui.Size size) {
    coordinate.paint(canvas, size);
    canvas.translate(size.width / 2, size.height / 2);
    if(image != null) {
      switch (drawType) {
        case DrawImageType.imag:
          _drawImage(canvas);
          break;
        case DrawImageType.imageRect:
          _drawImageRect(canvas);
          break;
      }
    }
  }

  // ui.Image 对象、偏移量 Offset 和画笔 Paint
  void _drawImage(ui.Canvas canvas) {
    canvas.drawImage(image!, Offset(-image!.width / 2, -image!.height / 2), _paint);
  }

  // drawImageRect中主要是两个矩形域，src 和 dst。
  // src 表示从资源图片 image 上抠出一块矩形域，所以原点是图片的左上角。
  // dst 表示将抠出的图片填充到画布的哪个矩形域中，所以原点是画布原点。
  void _drawImageRect(ui.Canvas canvas) {
    canvas.drawImageRect(
      image!, 
      Rect.fromCenter(center: Offset(image!.width/2, image!.height/2), width: 60, height: 60), 
      const Rect.fromLTRB(0, 0, 0, 0).translate(0, 0), 
      _paint
    );
    canvas.drawImageRect(
        image!,
        Rect.fromCenter(
          center: Offset(image!.width/2, image!.height/2-60), width: 60, height: 60),
        Rect.fromLTRB(0, 0, 100, 100).translate(-100, -100),
        _paint);
        
    canvas.drawImageRect(
        image!,
        Rect.fromCenter(
          center: Offset(image!.width/2+60, image!.height/2), width: 60, height: 60),
        Rect.fromLTRB(0, 0, 100, 100).translate(-280, 50),
        _paint);
  }

  @override
  bool shouldRepaint(covariant PaperPainter oldDelegate) {
    return oldDelegate.image != image || oldDelegate.drawType != drawType;
  }

}