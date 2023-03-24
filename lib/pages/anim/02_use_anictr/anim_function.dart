
import 'package:flutter/material.dart';
import 'package:flutter_booklet/widgets/anim_painter.dart';

class AinmaFunction extends StatefulWidget{
  const AinmaFunction({super.key});

  @override
  State<AinmaFunction> createState() => _AinmaFunctionState();
}

class _AinmaFunctionState extends State<AinmaFunction>  with SingleTickerProviderStateMixin{

  PointData pointData = PointData();

  late AnimationController _controller;
 
  //弹簧和速度驱动动画
  void _startFling() async{
    pointData.clear();
    _controller.reset();
    debugPrint('fling start!---${DateTime.now().toIso8601String()}----------');
    await _controller.fling(
      velocity: 10.0, //速度
      springDescription:  SpringDescription.withDampingRatio(
        mass: 1.0,  // 质量
        stiffness: 500.0,  // 刚度
        ratio: 3.0 // 阻尼
      )
    );
    debugPrint('fling end!---${DateTime.now().toIso8601String()}----------');
  }

  void _startForward() async{
    pointData.clear();
    debugPrint('start!---${DateTime.now().toIso8601String()}----------');
    await _controller.forward(from: 0);
    // await _controller.forward(from: 0.4);
    debugPrint('done!---${DateTime.now().toIso8601String()}----------');
  }

  void _startReverse() async{
    pointData.clear();
    debugPrint('start!---${DateTime.now().toIso8601String()}----------');
    await _controller.reverse(from: 1);
    // await _controller.forward(from: 0.4);
    debugPrint('done!---${DateTime.now().toIso8601String()}----------');
  }

  void _startRepeat() async{
    debugPrint('start!---${DateTime.now().toIso8601String()}----------');
    await _controller.repeat(reverse: false);
    debugPrint('done!---${DateTime.now().toIso8601String()}----------');
  }

  void _startReset() {
    _controller.reset();
  }

  void _startStop() {
    _controller.stop();
  }

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000)
    )..addListener(() {
      pointData.push(_controller.value);
    })..addStatusListener((status) {
      //监听动画控制器状态
      switch (status) {
        case AnimationStatus.dismissed:
          debugPrint('$status>>>>>>>动画结束是数值在下界');
          break;
        case AnimationStatus.forward:
          debugPrint('$status>>>>>>>动画开始从 [下界-->上界] 运动 (即正向)');
          break;
        case AnimationStatus.reverse:
          debugPrint('$status>>>>>>>动画开始从 [上界-->下界 运动 (即反向)');
          break;
        case AnimationStatus.completed:
          debugPrint('$status>>>>>>>动画结束是数值在上界');
          break;
        default: 
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    pointData.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 60,),
            CustomPaint(
              painter: AnimPainter(pointData),
              size: const Size(
                200,
                200,
              ),
            ),
            const SizedBox(height: 30,),
            Wrap(
              // mainAxisAlignment: MainAxisAlignment.center,
              spacing: 10,
              children: [
                ElevatedButton(
                  onPressed: _startFling, 
                  child: const Text('Fling'),
                ),
                ElevatedButton(
                  onPressed: _startForward, 
                  child: const Text('Forward'),
                ),
                ElevatedButton(
                  onPressed: _startReverse, 
                  child: const Text('Reverse'),
                ),
                ElevatedButton(
                  onPressed: _startRepeat, 
                  child: const Text('Reverse'),
                ),
                ElevatedButton(
                  onPressed: _startReset, 
                  child: const Text('Reset'),
                ),
                ElevatedButton(
                  onPressed: _startStop, 
                  child: const Text('Stop'),
                ),
                ElevatedButton(
                  onPressed: () => pointData.clear(), 
                  child: const Text('clear'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}