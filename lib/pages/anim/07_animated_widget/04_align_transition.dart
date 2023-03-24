
import 'package:flutter/material.dart';
import 'package:flutter_booklet/utils/anim_util.dart';

// AlignTransition 可用让一个组件在父级区域内进行对齐动画
class AlignAnim extends StatefulWidget {
  const AlignAnim({super.key});

  @override
  State<AlignAnim> createState() => _AlignAnimState();
}

class _AlignAnimState extends State<AlignAnim> with SingleTickerProviderStateMixin{

  late AnimationController _controller;
  late Animation<AlignmentGeometry> _animation;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: AnimUtil.druationTwo);
    _animation = Tween<AlignmentGeometry>(
      begin: Alignment.center,
      end: Alignment.bottomRight,
    ).chain(CurveTween(curve: Curves.ease)).animate(_controller);
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
      child: Container(
        width: 200,
        height: 100,
        color: Colors.grey.withAlpha(33),
        child: AlignTransition(
          alignment: _animation,
          child: const Icon(
            Icons.accessible_forward_sharp,
            color: Colors.green,
            size: 60,
          ),
        )
      ),
    );
  }
}