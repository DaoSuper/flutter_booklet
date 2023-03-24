
import 'dart:math';

import 'package:flutter/widgets.dart';
import 'dart:ui' as ui ;

class HaloCircle extends StatefulWidget {
  const HaloCircle({super.key});

  @override
  State<HaloCircle> createState() => _HaloCircleState();
}

class _HaloCircleState extends State<HaloCircle> with SingleTickerProviderStateMixin{
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 2000),);
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
      onTap: () => _controller.repeat(),
      child: CustomPaint(
        size: const Size(200, 200),
        painter: HaloCirclePainter(_controller),
        // painter: HaloCirclePainter2(_controller),
      ),
    );
  }
}

class HaloCirclePainter2 extends CustomPainter {

  Animation<double> animation;

  HaloCirclePainter2(this.animation) : super(repaint: animation);

  final Animatable<double> tweenSequence = TweenSequence<double>(
    <TweenSequenceItem<double>>[
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 0, end: 4),
        weight: 1
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 4, end: 0),
        weight: 1
      )
    ]
  ).chain(CurveTween(curve: Curves.decelerate));

  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(size.width / 2, size.height / 2);

    Paint paint = Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = 1;

    paint.maskFilter = MaskFilter.blur(BlurStyle.solid, tweenSequence.evaluate(animation));

     // shader 属性设置着色器
    List<Color> colors = const [
      Color(0xFFF60C0C),  Color(0xFFF3B913),  Color(0xFFE7F716),
      Color(0xFF3DF30B),  Color(0xFF0DF6EF),  Color(0xFF0829FB),
      Color(0xFFB709F4),
    ];
    colors.addAll(colors.reversed.toList());
    List<double> pos = List.generate(colors.length, (index) => index / colors.length);
    paint.shader = ui.Gradient.sweep(Offset.zero, colors, pos,);

    Path path1 = Path();
    Path path2 = Path();
    path1.addOval(Rect.fromCenter(center: const Offset(0, 0), width: 100, height: 100));
    path2.addOval(Rect.fromCenter(center: const Offset(-1, 0), width: 100, height: 100));

    Path result = Path.combine(PathOperation.difference, path1, path2);

    canvas.drawPath(path1, paint);
    canvas.save();
    canvas.rotate(animation.value * 2 * pi);
        //颜色填充
    paint..style = PaintingStyle.fill..color = const Color(0xff00abf2);
    canvas.drawPath(result, paint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant HaloCirclePainter2 oldDelegate) => oldDelegate.animation != animation;

}


class HaloCirclePainter extends CustomPainter {
  Animation<double> animation;

  HaloCirclePainter(this.animation) : super(repaint: animation);

  final Animatable<double> breatheTween = TweenSequence<double>(
    <TweenSequenceItem<double>>[
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 0, end: 4),
        weight: 1
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 4, end: 0),
        weight: 1
      )
    ]
  ).chain(CurveTween(curve: Curves.decelerate));

  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(size.width / 2, size.height / 2);

    final Paint paint = Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = 1;

    Path circlePath = Path();

    Path circlePath2 = Path();

    // shader 属性设置着色器
    List<Color> colors = const [
      Color(0xFFF60C0C),  Color(0xFFF3B913),  Color(0xFFE7F716),
      Color(0xFF3DF30B),  Color(0xFF0DF6EF),  Color(0xFF0829FB),
      Color(0xFFB709F4),
    ];
    colors.addAll(colors.reversed.toList());
    final List<double> pos = List.generate(colors.length, (index) => index / colors.length);
    paint.shader = ui.Gradient.sweep(Offset.zero, colors, pos, TileMode.clamp, 0, 2 * pi);

    // 设置 maskFilter
    paint.maskFilter = MaskFilter.blur(BlurStyle.solid, breatheTween.evaluate(animation));

    circlePath.addOval(Rect.fromCenter(center: const Offset(0, 0), width: 100, height: 100));

    circlePath2.addOval(Rect.fromCenter(center: const Offset(-1, 0), width: 100, height: 100));

    //联合路径
    Path result = Path.combine(PathOperation.difference, circlePath, circlePath2);

    canvas.drawPath(circlePath, paint);
    canvas.save();
    canvas.rotate(animation.value * 2 * pi);
    //颜色填充
    paint..style = PaintingStyle.fill..color = const Color(0xff00abf2);
    canvas.drawPath(result, paint);
    canvas.restore();
  }


 @override
  bool shouldRepaint(covariant HaloCirclePainter oldDelegate) =>
      oldDelegate.animation != animation;

}