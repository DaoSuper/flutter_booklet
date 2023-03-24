

import 'package:flutter/material.dart';
import 'package:flutter_booklet/utils/anim_util.dart';

//AnimatedContainer 容器动画
//让 Container 中的各个属性都进行动画
class ContainerAnim extends StatefulWidget {
  const ContainerAnim({super.key});

  @override
  State<ContainerAnim> createState() => _ContainerAnimState();
}

class _ContainerAnimState extends State<ContainerAnim> {
  final Decoration startDecoration =  const BoxDecoration(
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
  );
  
  final Decoration endDecoration = const BoxDecoration(
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
  );

  final Alignment startAlignment = Alignment.topLeft+ const Alignment(0.2,0.2);
  final Alignment endAlignment = Alignment.center;

  final double startHeight = 150.0;
  final double endHeight = 100.0;

  late Decoration _decoration;
  late double _height;
  late Alignment _alignment;

  @override
  void initState() {
    _decoration = startDecoration;
    _height = startHeight;
    _alignment = startAlignment;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        bool value = _height == startHeight;
        setState(() {
          setState(() {
          _height = value ? endHeight : startHeight;
          _decoration = value ? endDecoration : startDecoration;
          _alignment = value ? endAlignment : startAlignment;
        });
        });
      },
      child: AnimatedContainer(
        duration: AnimUtil.druation,
        curve: Curves.fastOutSlowIn,
        decoration: _decoration,
        alignment: _alignment,
        height: _height,
        width: _height,
        child: const Icon(
          Icons.camera_outlined,
          size: 30,
          color: Colors.white,
        )
      ),
    );
  }
}