

import 'package:flutter/material.dart';
import 'package:flutter_booklet/utils/anim_util.dart';

//TweenAnimationBuilder 渐变动画器
class TweenAnim extends StatefulWidget {
  const TweenAnim({super.key});

  @override
  State<TweenAnim> createState() => _TweenAnimState();
}

class _TweenAnimState extends State<TweenAnim> {
  Color color1 = Colors.red;
  Color color2 = Colors.orange;

  bool _selected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selected = !_selected;
        });
      },
      child: TweenAnimationBuilder<Color?>(
        duration: AnimUtil.druation,
        tween: ColorTween(begin: Colors.blue, end: _selected?color1:color2),
        builder: (context, value, child) {
          return Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: value,
              borderRadius: BorderRadius.circular(8),
            ),
            child: child!,
          );
        },
        child: const Icon(
          Icons.camera_outlined,
          size: 30,
          color: Colors.white,
        ),
      ),
    );
  }
}