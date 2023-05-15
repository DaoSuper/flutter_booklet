import 'package:flutter_booklet/widgets/coordinate.dart';
import 'package:image/image.dart' as image;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//拾取图像的某一像素点颜色
class ImageColorDemo extends StatefulWidget {
  const ImageColorDemo({super.key});

  @override
  State<ImageColorDemo> createState() => _ImageColorDemoState();
}

class _ImageColorDemoState extends State<ImageColorDemo> {
  image.Image? _image;
  List<Ball> balls = [];
  double d = 5; //复刻的像素边长

  @override
  void initState() {
    super.initState();
    _loadImage();
  }

  void _loadImage() async {
    _image = await loadImageFromAssets('assets/images/blr.jpeg');
    if(_image == null) return;
    for (int i = 0; i < _image!.width; i ++) {
      for (int j = 0; j < _image!.height; j++) {
        Ball ball = Ball();
        ball.x = i * d + d / 2;
        ball.y = j * d + d / 2;
        ball.r = d / 2;
        image.Pixel pixel = _image!.getPixel(i, j);
        var color = Color.fromARGB(pixel.a.toInt(),pixel.r.toInt(),pixel.g.toInt(),pixel.b.toInt());
        ball.color = color;
        balls.add(ball);
      }
    }
    setState(() {});
  }

  //读取 assets 中的图片
  Future<image.Image?> loadImageFromAssets(String path) async {
    ByteData data = await rootBundle.load(path);
    List<int> bytes = data.buffer.asUint8List();
    return image.decodeImage(Uint8List.fromList(bytes));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white, child: CustomPaint(painter: PaperPainter(balls))
      ),
    );
  }

}
class PaperPainter extends CustomPainter {
  late Paint _paint;

  final double strokeWidth = 0.5;
  final Color color = Colors.blue;

  final List<Ball> balls;

  PaperPainter(this.balls) {
    _paint = Paint()
      ..style = PaintingStyle.fill
      ..strokeWidth = strokeWidth
      ..color = color;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(-200, 100);
    _drawImage(canvas);
  }

  void _drawImage(Canvas canvas) {
    for (var ball in balls) {
      canvas.drawCircle(Offset(ball.x, ball.y), ball.r, _paint..color = ball.color);
    }
  }

  @override
  bool shouldRepaint(PaperPainter oldDelegate) => balls != oldDelegate.balls;
}

class Ball {
  double x; //点位X
  double y; //点位Y
  Color color; //颜色
  double r; // 半径

  Ball({this.x=0, this.y=0, this.color=Colors.black, this.r=5});
}