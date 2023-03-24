
import 'package:flutter/material.dart';
import 'package:flutter_booklet/pages/anim/03_curve/custom_curve.dart';
import 'package:flutter_booklet/widgets/anim_painter.dart';

class CurvePage extends StatefulWidget {
  const CurvePage({super.key});

  @override
  State<CurvePage> createState() => _CurvePageState();
}

class _CurvePageState extends State<CurvePage>  with SingleTickerProviderStateMixin{

  late AnimationController _controller;
  late Animation<double> _curveAnim; // 1.定义曲线动画
  final Duration _druation = const Duration(milliseconds: 1000);
  PointData pointData = PointData();
  bool useTransform = false;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: _druation)..addListener(() {
      
      if(useTransform){
        pointData.push(Curves.decelerate.transform(_controller.value));
      } else {
        pointData.push(_curveAnim.value);
      }
    });
    // _curveAnim = CurvedAnimation(parent: _controller, curve: Curves.bounceOut); //<--2.创建曲线动画
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    pointData.dispose();
    super.dispose();
  }

  void _startAnim({bool transform = false}) async{
    pointData.clear();
    debugPrint('start!---${DateTime.now().toIso8601String()}----------');
    useTransform = transform;
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
            GestureDetector(
              onTap: _startAnim,
              child: CustomPaint(
                painter: AnimPainter(pointData, showRound: true),
                size: const Size(
                  200,
                  200,
                ),
              ),
            ),
            const SizedBox(height: 32,),
            Wrap(
              spacing: 10,
              children: [
                ElevatedButton(
                  onPressed: (){
                    _curveAnim = CurvedAnimation(parent: _controller, curve: Curves.bounceOut); //<--2.创建曲线动画
                    _startAnim();
                  }, 
                  child: const Text('bounceOut')
                ),
                ElevatedButton(
                  onPressed: (){
                    _curveAnim = CurvedAnimation(parent: _controller, curve: Curves.ease); //<--2.创建曲线动画
                    _startAnim();
                  }, 
                  child: const Text('ease')
                ),
                ElevatedButton(
                  onPressed: (){
                    _curveAnim = CurvedAnimation(parent: _controller, curve: Curves.decelerate); //<--2.创建曲线动画
                    _startAnim();
                  }, 
                  child: const Text('decelerate')
                ),
                ElevatedButton(
                  onPressed: (){
                    _curveAnim = CurvedAnimation(parent: _controller, curve: Curves.elasticOut); //<--2.创建曲线动画
                    _startAnim();
                  }, 
                  child: const Text('elasticOut')
                ),
                ElevatedButton(
                  onPressed: (){
                    _curveAnim = CurvedAnimation(parent: _controller, curve: const SawTooth(3)); //<--2.创建曲线动画
                    _startAnim();
                  }, 
                  child: const Text('SawTooth')
                ),
                ElevatedButton(
                  onPressed: (){
                    _curveAnim = CurvedAnimation(parent: _controller, curve: const X2Curve()); //<--2.创建曲线动画
                    _startAnim();
                  }, 
                  child: const Text('自定义-加速曲线')
                ),
                ElevatedButton(
                  onPressed: (){
                    _curveAnim = CurvedAnimation(parent: _controller, curve: const DampingCurve()); //<--2.创建曲线动画
                    _startAnim();
                  }, 
                  child: const Text('自定义-阻尼曲线')
                ),
                ElevatedButton(
                  onPressed: (){
                    _startAnim(transform: true);
                  }, 
                  child: const Text('Curve Transform')
                )
              ],
            )
          ],
        )
      ),
    );
  }
}