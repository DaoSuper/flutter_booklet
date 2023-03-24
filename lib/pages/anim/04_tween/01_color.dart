import 'package:flutter/material.dart';

class TweenColor extends StatefulWidget {
  const TweenColor({super.key});

  @override
  State<TweenColor> createState() => _TweenColorState();
}

class _TweenColorState extends State<TweenColor> with SingleTickerProviderStateMixin{

  late AnimationController _controller;
  final Duration _druation = const Duration(milliseconds: 1000);

  // 未使用ColorTween渐变颜色 获取颜色
 Color? get color => Color.lerp(Colors.blue, Colors.red, _controller.value);

 //定义ColorTween对象
 final ColorTween _colorTween = ColorTween(begin: Colors.blue, end: Colors.red);

 // 使用ColorTween渐变颜色 获取颜色
 Color? get colorTweenTransform => _colorTween.transform(_controller.value);

// evaluate : 入参是 Animation<double> 对象，能通过 transform 计算 动画器 当前值返回 T 类型对象。
 Color? get colorTweenEvaluate => _colorTween.evaluate(_controller);

//animate : 入参是 Animation<double> 对象，作用是通过传入的 动画器 对象，返回一个 T 泛型的动画器 对象。
 Color? get colorTweenAnimate => _colorAnima.value;

 // 1.定义 Color 泛型动画器 
 late Animation<Color?> _colorAnima;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: _druation);
    // 3. 通过 animate 方法创建新动画器
    _colorAnima = _colorTween.animate(_controller);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
            Wrap(
              spacing: 10,
              children: [
                AnimatedBuilder(
                  animation: _controller, 
                  builder: (_, __){
                    return Container(
                      width: 80,
                      height: 80,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: color,
                        shape: BoxShape.circle
                      ),
                      child: const Text('lerp'),
                    );
                  }
                ),
                AnimatedBuilder(
                  animation: _controller, 
                  builder: (_, __){
                    return Container(
                      width: 80,
                      height: 80,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: colorTweenTransform,
                        shape: BoxShape.circle
                      ),
                      child: const Text('Transform'),
                    );
                  }
                ),
                AnimatedBuilder(
                  animation: _controller, 
                  builder: (_, __){
                    return Container(
                      alignment: Alignment.center,
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: colorTweenEvaluate,
                        shape: BoxShape.circle
                      ),
                      child: const Text('Evaluate'),
                    );
                  }
                ),
                AnimatedBuilder(
                  animation: _controller, 
                  builder: (_, __){
                    return Container(
                      alignment: Alignment.center,
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: colorTweenAnimate,
                        shape: BoxShape.circle
                      ),
                      child: const Text('Animate'),
                    );
                  }
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () => _controller.forward(from: 0), 
              child: const Text('StartAnim')
            )
          ],
        )
      ),
    );
  }
}