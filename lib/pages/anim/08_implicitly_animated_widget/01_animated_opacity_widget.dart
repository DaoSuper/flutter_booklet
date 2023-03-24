

import 'package:flutter/material.dart';
import 'package:flutter_booklet/utils/anim_util.dart';

//AnimatedOpacity 可用让一个组件进行透明度渐变动画
class OpacityAnim extends StatefulWidget {
  const OpacityAnim({super.key});

  @override
  State<OpacityAnim> createState() => _OpacityAnimState();
}

class _OpacityAnimState extends State<OpacityAnim> {
  final double _begin = 1.0;
  final double _end = 0;

  late double _opacity;

  bool get selected => _opacity == 0;

  @override
  void initState() {
    _opacity = _begin;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Switch(
          value: selected, 
          onChanged: (value) {
            setState(() {
              _opacity = value ? _end : _begin;
            });
          }
        ),
        Container(
          color: Colors.grey.withAlpha(22),
          width: 100,
          height: 100,
          child: AnimatedOpacity(
            opacity: _opacity, 
            duration: AnimUtil.druation,
            curve: Curves.fastOutSlowIn,
            child: const Icon(
              Icons.camera_outlined,
              color: Colors.green,
              size: 60,
            ),
          ),
        )
      ],
    );
  }
}