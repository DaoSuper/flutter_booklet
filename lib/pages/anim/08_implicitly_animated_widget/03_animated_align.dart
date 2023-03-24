

import 'package:flutter/material.dart';
import 'package:flutter_booklet/utils/anim_util.dart';

//AnimatedAlign 对齐动画
class AlignAnim extends StatefulWidget {
  const AlignAnim({super.key});

  @override
  State<AlignAnim> createState() => _AlignAnimState();
}

class _AlignAnimState extends State<AlignAnim> {
  final Alignment startAlignment = Alignment.center;
  final Alignment endAlignment = Alignment.bottomRight;

  late Alignment _alignment;

  @override
  void initState() {
    _alignment = startAlignment;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(_alignment == endAlignment) {
          _alignment = startAlignment;
        } else {
          _alignment = endAlignment;
        }
        setState(() {});
      },
      child: Container(
        width: 200,
        height: 100,
        alignment: Alignment.center,
        color: Colors.grey.withAlpha(22),
        child: AnimatedAlign(
          alignment: _alignment,
          duration: AnimUtil.druation,
          curve: Curves.fastOutSlowIn,
          child: const Icon(
            Icons.accessible_forward_sharp,
            color: Colors.green,
            size: 25,
          ),
        ),
      ),
    );
  }
}