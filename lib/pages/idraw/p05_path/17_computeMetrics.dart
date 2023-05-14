import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_booklet/widgets/coordinate.dart';

// PathMetrics对象可以获得
//路径长度 length、
//路径索引 contourIndex 
//及 isClosed路径是否闭合isClosed。
class ComputeMetricsDemo extends StatefulWidget {
  const ComputeMetricsDemo({super.key});

  @override
  State<ComputeMetricsDemo> createState() => _ComputeMetricsDemoState();
}

class _ComputeMetricsDemoState extends State<ComputeMetricsDemo> with SingleTickerProviderStateMixin{
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(vsync: this,
    duration: Duration(milliseconds: 3000))..forward();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: CustomPaint(painter: PaperPainter(controller))
      ),
    );
  }
}

class PaperPainter extends CustomPainter {
  final Coordinate coordinate = Coordinate();
  final Animation<double> animation;

  PaperPainter(this.animation) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    coordinate.paint(canvas, size);
    canvas.translate(size.width / 2, size.height / 2);

    Path path = Path();
    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..color = Colors.purpleAccent;

    path
      ..relativeMoveTo(0, 0)
      ..relativeLineTo(-30, 120)
      ..relativeLineTo(30, -30)
      ..relativeLineTo(30, 30)
      ..close();

      path.addOval(Rect.fromCenter(center: Offset.zero, width: 60, height: 60));
      
      PathMetrics pms = path.computeMetrics();
      pms.forEach((pm) {
        //获取路径长度50%的点的信息
        Tangent? tangent = pm.getTangentForOffset(pm.length * animation.value);
        if(tangent==null) return;
        print("---position:-${tangent.position}----angle:-${tangent.angle}----vector:-${tangent.vector}----");

        canvas.drawCircle(tangent.position, 5, Paint()..color = Colors.deepOrange);
      });
      canvas.drawPath(path, paint);
  }
  
  @override
  bool shouldRepaint(covariant PaperPainter oldDelegate) {
    return oldDelegate.animation != animation;
  }
}