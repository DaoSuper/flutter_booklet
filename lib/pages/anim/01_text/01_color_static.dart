import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class TextColorStatic extends StatefulWidget {
  const TextColorStatic({super.key});

  @override
  State<TextColorStatic> createState() => _TextColorStaticState();
}

// 1.渐变色文字静态效果
class _TextColorStaticState extends State<TextColorStatic> with SingleTickerProviderStateMixin {
  final List<Color> colors = [
    const Color(0xFFF60C0C),
    const Color(0xFFF3B913),
    const Color(0xFFE7F716),
    const Color(0xFF3DF30B),
    const Color(0xFF0DF6EF),
    const Color(0xFF0829FB),
    const Color(0xFFB709F4)
  ];

  final List<double> pos = [ 1.0 / 7, 2.0 / 7, 3.0 / 7, 4.0 / 7, 5.0 / 7, 6.0 / 7, 1.0 ];

  late AnimationController _controller;
  final Duration _duration = const Duration(milliseconds: 1000);


  Paint getPaint() {
    Paint paint = Paint()..style = PaintingStyle.stroke..strokeWidth = 2;
    paint.shader = ui.Gradient.linear(
        const Offset(0, 0),
        const Offset(100, 0),
        colors,
        pos,
        TileMode.mirror,
        Matrix4.rotationZ(pi / 6).storage
    );
    // paint.maskFilter = const MaskFilter.blur(BlurStyle.solid, 10); //模糊遮罩
    paint.maskFilter = MaskFilter.blur(BlurStyle.solid, 15 * _controller.value); //模糊遮罩
    return paint;
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: _duration);
  }

  //开始动画
  void _startAnim() {
    _controller.forward(from: 0);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GestureDetector(
        onTap: _startAnim,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child){
            return Center(
              child: Text(
                "渐变色文字效果",
                style: TextStyle(fontSize: 50, foreground: getPaint()),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
