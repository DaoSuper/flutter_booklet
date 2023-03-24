
import 'package:flutter/material.dart';
import 'package:flutter_booklet/utils/anim_util.dart';
import 'package:flutter_booklet/widgets/anim_painter.dart';

class TeweenCurve extends StatefulWidget {
  const TeweenCurve({super.key});

  @override
  State<TeweenCurve> createState() => _TeweenCurveState();
}

//CurveTween 是使用 Curve 的一种途径，它和 CurvedAnimation 的作用类似
class _TeweenCurveState extends State<TeweenCurve> with SingleTickerProviderStateMixin{
  PointData pointData = PointData();

  late AnimationController _controller;
  late Animation<double> _curveAnim;


  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: AnimUtil.druation)..addListener(() {
      pointData.push(_curveAnim.value);
    });

    //CurveTween 是使用 Curve 的一种途径，它和 CurvedAnimation 的作用类似
    _curveAnim = CurveTween(curve:  Curves.bounceOut).animate(_controller);
    super.initState();
  }
  
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startAnim() async{
    pointData.clear();
    debugPrint('start!---${DateTime.now().toIso8601String()}----------');
    // await _ctrl.forward(from: 0);
    await _controller.forward(from: 0);
    debugPrint('done!---${DateTime.now().toIso8601String()}----------');
  }

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: const EdgeInsets.only(top: 100),
        alignment: Alignment.center,
        child: Column(
          children: [
            CustomPaint(
              painter: AnimPainter(pointData, showRound: true),
              size: const Size(
                200,
                200,
              ),
            ),
            const SizedBox(height: 32,),
            Wrap(
              spacing: 10,
              children: [
                ElevatedButton(
                  onPressed: _startAnim, 
                  child: const Text('StartAnim')
                )
              ],
            )
          ],
        )
      ),
    );
  }
}