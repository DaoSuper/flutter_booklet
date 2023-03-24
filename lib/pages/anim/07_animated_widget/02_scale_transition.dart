
import 'package:flutter/material.dart';
import 'package:flutter_booklet/utils/anim_util.dart';

//ScaleTransition 可用让一个组件进行缩放动画
class ScaleAnim extends StatefulWidget {
  const ScaleAnim({super.key});

  @override
  State<ScaleAnim> createState() => _ScaleAnimState();
}

class _ScaleAnimState extends State<ScaleAnim> with SingleTickerProviderStateMixin{

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: AnimUtil.druationTwo);
    _animation = Tween<double>(begin: 0.3, end: 1).chain(CurveTween(curve: Curves.ease)).animate(_controller);
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
      onTap: () => _controller.forward(from: 0),
      child: SizedBox(
        width: 100,
        height: 100,
        child: ScaleTransition(
          scale: _animation,
          child: const Icon(
            Icons.stars_outlined,
            color: Colors.yellow,
            size: 60,
          ),
        )
      ),
    );
  }
}