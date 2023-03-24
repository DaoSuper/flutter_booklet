
import 'package:flutter/material.dart';
import 'package:flutter_booklet/utils/anim_util.dart';

//定义圆信息
class Circle {
  final Color? color;
  final double? radius;
  final Offset? center;

  Circle({this.color, this.radius, this.center});
}

class CustomTweenPage extends StatefulWidget {
  const CustomTweenPage({super.key});

  @override
  State<CustomTweenPage> createState() => _CustomTweenPageState();
}

class _CustomTweenPageState extends State<CustomTweenPage> with SingleTickerProviderStateMixin{

  late AnimationController _controller;

  final CircleTween _tween = CircleTween(
    begin: Circle(center: Offset.zero, radius: 15, color: Colors.blue),
    end: Circle(center: const Offset(100, 0), radius: 30, color: Colors.red),
  );

  late Animation<Circle> _animation;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: AnimUtil.druation);
    _animation = _tween.animate(_controller);
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
            AnimatedBuilder(
              animation: _controller, 
              builder: (_, __){
                return CircleWidget(circle: _animation.value);
              }
            ),
            const SizedBox(height: 32,),
            Wrap(
              spacing: 10,
              children: [
                ElevatedButton(
                  onPressed: (){
                    _controller.forward(from: 0);
                  }, 
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

class CircleTween extends Tween<Circle> {
  CircleTween({required Circle begin, required Circle end}) : super(begin: begin, end: end);
  
  @override
  Circle lerp(double t) {
    return Circle(
      color: Color.lerp(begin!.color, end!.color, t), 
      radius: (begin!.radius! + (end!.radius! - begin!.radius!) * t),
      center: Offset.lerp(begin!.center, end!.center, t)
    );
  }
}


class CircleWidget extends StatelessWidget {
  final Circle circle;
  const CircleWidget({Key? key, required this.circle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      transform: Matrix4.translationValues(circle.center!.dx,
          circle.center!.dy, 0),
      width: circle.radius! * 2,
      height: circle.radius! * 2,
      decoration: BoxDecoration(
          color: circle.color, shape: BoxShape.circle),
    );
  }
}