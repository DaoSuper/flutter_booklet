import 'dart:math';

import 'package:flutter/material.dart';

class SkewShadowText extends StatefulWidget {
  const SkewShadowText({super.key});

  @override
  State<SkewShadowText> createState() => _SkewShadowTextState();
}

//文字渐变斜阴影
class _SkewShadowTextState extends State<SkewShadowText> with SingleTickerProviderStateMixin {

  late AnimationController _controller;

  final Duration _duration = const Duration(milliseconds: 800);

  final TextStyle commonStyle =  const TextStyle(fontSize: 60, color: Colors.blue);
  final TextStyle shadowStyle = TextStyle(fontSize: 60, color: Colors.blue.withAlpha(88));

  double get rad => 6 * (_controller.value) / 180 * pi;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: _duration);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startAnim() {
    _controller.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GestureDetector(
        onTap: _startAnim,
        child: Center(
          child: Column(
            children: [
              Stack(
                children: [
                  Text('渐变斜阴影', style: commonStyle,),
                  Transform(
                    transform: Matrix4.skewX(4*pi/180),
                    child: Text('渐变斜阴影', style: shadowStyle,),
                  ),
                ],
              ),
              Stack(
                children: [
                  Text('渐变斜阴影', style: commonStyle,),
                  AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child){
                      return Transform(
                        transform: Matrix4.skewX(rad),
                        child: Text('渐变斜阴影', style: shadowStyle,),
                      );
                    },
                  ),
                ],
              )
            ],
          ),
        )
      ),
    );
  }
}
