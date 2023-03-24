
import 'package:flutter/material.dart';
import 'package:flutter_booklet/utils/anim_util.dart';

//SlideTransition让一个组件在父级区域内进行平移动画
class SlideAnim extends StatefulWidget {
  const SlideAnim({super.key});

  @override
  State<SlideAnim> createState() => _SlideAnimState();
}

class _SlideAnimState extends State<SlideAnim> with SingleTickerProviderStateMixin{

  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: AnimUtil.druationTwo);
    _animation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0.5, 0)
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
        child: SlideTransition(
          position: _animation,
          textDirection: TextDirection.rtl,
          child: const Icon(
            Icons.rowing_outlined,
            color: Colors.green,
            size: 60,
          ),
        )
      ),
    );
  }
}