
import 'package:flutter/material.dart';
import 'package:flutter_booklet/utils/anim_util.dart';

class IconAnim extends StatefulWidget {
  const IconAnim({super.key});

  @override
  State<IconAnim> createState() => _IconAnimState();
}

class _IconAnimState extends State<IconAnim> with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  bool _animating = true;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: AnimUtil.druation);
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
      onTap: () {
        if(_animating){
          _controller.forward();
        } else {
          _controller.reverse();
        }
        _animating = !_animating;
      },
      child: AnimatedIcon(
        size: 50,
        color: Colors.green,
        icon: AnimatedIcons.arrow_menu,
        progress: _controller,
      ),
    );
  }
}