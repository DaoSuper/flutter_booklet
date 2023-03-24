
import 'dart:math';

import 'package:flutter/material.dart';

class ToggleRotate extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  final ValueChanged<bool>? onEnd;
  final double beginAngle;
  final double endAngle;
  final int durationMs;
  final bool clockwise;
  final Curve curve;
  
  const ToggleRotate({
    super.key, 
    required this.child, 
    this.onTap, 
    this.onEnd, 
    this.beginAngle = 0, 
    this.endAngle = 90, 
    this.durationMs = 200, 
    this.clockwise = true, 
    this.curve = Curves.fastOutSlowIn
  });

  @override
  State<ToggleRotate> createState() => _ToggleRotateState();
}

class _ToggleRotateState extends State<ToggleRotate> with SingleTickerProviderStateMixin{

  bool _rotated = false;
  late AnimationController _controller;
  late Animation<double> _rotateAnim;

  double get rad => widget.clockwise ? _rotateAnim.value : -_rotateAnim.value;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: Duration(microseconds: widget.durationMs));
   _initTweenAnim();
    super.initState();
  }

  @override
  void didUpdateWidget(ToggleRotate oldWidget) {
    super.didUpdateWidget(oldWidget);
    
    if (widget.durationMs != oldWidget.durationMs) {
      _controller.dispose();
      _controller = AnimationController(
          duration: Duration(milliseconds: widget.durationMs), vsync: this);
    }
    
    if (widget.beginAngle != oldWidget.beginAngle ||
        widget.endAngle != oldWidget.endAngle ||
        widget.curve != oldWidget.curve ||
        widget.durationMs != oldWidget.durationMs) {
      _initTweenAnim();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  _initTweenAnim() async {
    _rotateAnim = Tween<double>(
      begin: widget.beginAngle / 180 * pi,
      end: widget.endAngle / 180 * pi)
    .chain(CurveTween(curve: widget.curve))
    .animate(_controller);
  }

  void _toggleRotate() async {
    widget.onTap?.call();
    if (_rotated) {
      await _controller.reverse();
    } else {
      await _controller.forward();
    }
    _rotated = !_rotated;
    widget.onEnd?.call(_rotated);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: _toggleRotate,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (_, __){
          return Transform(
            transform: Matrix4.rotationZ(rad),
            alignment: Alignment.center,
            child: widget.child,
          );
        },
      ),
    );
  }
}