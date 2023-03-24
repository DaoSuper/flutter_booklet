
import 'package:flutter/material.dart';
import 'package:flutter_booklet/utils/anim_util.dart';
import 'package:flutter_booklet/widgets/anim_painter.dart';

class TeweenSequencePage extends StatefulWidget {
  const TeweenSequencePage({super.key});

  @override
  State<TeweenSequencePage> createState() => _TeweenSequencePageState();
}


class _TeweenSequencePageState extends State<TeweenSequencePage> with SingleTickerProviderStateMixin{
  PointData pointData = PointData();

  late AnimationController _controller;

  late Animation<double> _sequence;


  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: AnimUtil.druation)..addListener(() {
      pointData.push(_sequence.value);
    });
    
    //TweenSequence 继承自 Animatable, 让多个同泛型的 Animatable 序列执行
    //weight 表示该段序列的时长权重
    _sequence = TweenSequence<double>(
      <TweenSequenceItem<double>>[
        TweenSequenceItem(
          tween: Tween<double>(begin: 0, end: 0.5).chain(CurveTween(curve: Curves.ease)),
          weight: 4.0
        ),
        TweenSequenceItem(
          tween: ConstantTween(0.5),
          weight: 2.0
        ),
        TweenSequenceItem(
          tween: Tween<double>(begin: 0.5, end: 1.0).chain(CurveTween(curve: Curves.decelerate)), 
          weight: 4.0
        )
      ]
    ).animate(_controller);
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