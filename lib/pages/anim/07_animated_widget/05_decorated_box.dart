
import 'package:flutter/material.dart';
import 'package:flutter_booklet/utils/anim_util.dart';

//DecoratedBoxTransition对一个组件进行装饰动画
class DecoratedBoxAnim extends StatefulWidget {
  const DecoratedBoxAnim({super.key});

  @override
  State<DecoratedBoxAnim> createState() => _DecoratedBoxAnimState();
}

class _DecoratedBoxAnimState extends State<DecoratedBoxAnim> with SingleTickerProviderStateMixin{

  late AnimationController _controller;
  late Animation<Decoration> _animation;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: AnimUtil.druationTwo);
    _animation = DecorationTween(
      begin: const BoxDecoration(
        color: Colors.deepPurple,
        borderRadius: BorderRadius.all(Radius.circular(30)),
        boxShadow: [
          BoxShadow(
            offset: Offset(1, 1),
            color: Colors.purple,
            blurRadius: 5,
            spreadRadius: 2
          )
        ]
      ),
      end: const BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            offset: Offset(1, 1),
            color: Colors.blue,
            blurRadius: 10,
            spreadRadius: 0
          )
        ]
      )
    ).animate(_controller);
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
        child: DecoratedBoxTransition(
          decoration: _animation,
          child: const Icon(
            Icons.camera_outlined,
            color: Colors.white,
            size: 60,
          ),
        )
      ),
    );
  }
}