import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_booklet/utils/anim_util.dart';

class CrossSingle extends StatefulWidget {
  const CrossSingle({super.key});

  @override
  State<CrossSingle> createState() => _CrossSingleState();
}

class _CrossSingleState extends State<CrossSingle> with SingleTickerProviderStateMixin {

  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: AnimUtil.druationTwo);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _controller.repeat(reverse: true),
      child: CustomPaint(
        painter: CrossSinglePainter(_controller),
        size: const Size(100, 100),
      ),
    );
  }
}


class CrossSinglePainter extends CustomPainter {

  CrossSinglePainter(this.animation, {this.itemWidth = 33}) : super(repaint: animation);

  final double itemWidth;
  final Paint _paint = Paint();

  final List<Color> colors = const [
    Color(0xffF44336), Color(0xff5C6BC0), Color(0xffFFB74D), Color(0xff8BC34A),
  ];

  final Animation<double> animation;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(Offset.zero & size, Paint()..color = Colors.grey.withAlpha(11));

    canvas.translate(size.width / 2, size.height / 2);

    // final double offset = -size.height / 2 + itemWidth / sqrt(2);
    // drawDiamond(canvas, offset, colors[0], true);
    // drawDiamond(canvas, -offset, colors[1], true);
    // drawDiamond(canvas, -offset, colors[2], false);
    // drawDiamond(canvas, offset, colors[3], false);
    final double begin = -size.height / 2 + itemWidth / sqrt(2);
    final double end = size.height / 2 - itemWidth / sqrt(2) + 20.0;
    drawItem(canvas, begin, end, colors[0], true);
    drawItem(canvas, -begin, -end, colors[1], true);
    drawItem(canvas, -begin, -end, colors[2], false);
    drawItem(canvas, begin, end, colors[3], false);
  }

  void drawItem(Canvas canvas, double begin, double end, Color color,
    bool vertical,
    {Curve curve = Curves.easeIn}) {

      Animatable<double> animatable = TweenSequence<double>(
        <TweenSequenceItem<double>>[
          TweenSequenceItem<double>(
            tween: Tween(begin: begin, end: end),
            weight: 1
          ),
          TweenSequenceItem<double>(
            tween: Tween(begin: begin, end: end),
            weight: 1
          )
        ]
      ).chain(CurveTween(curve: curve));
      drawDiamond(canvas, animatable.evaluate(animation), color, vertical,);
    }

  void drawDiamond(Canvas canvas, double offset, Color color, bool vertical) {
    canvas.save();
    vertical ? canvas.translate(0, offset) : canvas.translate(offset, 0);
    canvas.rotate(45 / 180 * pi);

    canvas.drawRect(
      Rect.fromCenter(center: Offset.zero, width: itemWidth, height: itemWidth), 
      _paint..color = color
    );
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CrossSinglePainter oldDelegate) => oldDelegate.animation != animation || oldDelegate.itemWidth != itemWidth;

}