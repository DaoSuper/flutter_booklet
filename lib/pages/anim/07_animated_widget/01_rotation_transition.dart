
import 'package:flutter/material.dart';
import 'package:flutter_booklet/utils/anim_util.dart';

//RotationTransition 可用让一个组件进行旋转动画
class RotationAnim extends StatefulWidget {
  const RotationAnim({super.key});

  @override
  State<RotationAnim> createState() => _RotationAnimState();
}

class _RotationAnimState extends State<RotationAnim> with SingleTickerProviderStateMixin{

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: AnimUtil.druationTwo);
    _animation = CurveTween(curve: Curves.linear).animate(_controller);
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
        child: RotationTransition(
          turns: _animation,
          child: const Icon(
            Icons.camera_outlined,
            color: Colors.green,
            size: 60,
          ),
        )
      ),
    );
  }
}