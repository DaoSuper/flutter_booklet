import 'package:flutter/material.dart';
import 'package:flutter_booklet/pages/miscellaneous/func_demo/func_util.dart';

enum FuncType {
  none,
  throttle,
  throttleWithTimeout,
  debounce
}

class FuncWidget extends StatelessWidget {
  final Widget child;
  final Function? onTap;
  final FuncType type;
  final int? timeout;

  const FuncWidget({
    Key? key,
    required this.child,
    this.onTap,
    this.type = FuncType.throttle,
    this.timeout
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: _getOnTap(),
      child: child,
    );
  }

  VoidCallback? _getOnTap() {
    if (type == FuncType.throttle) {
      return onTap?.throttle();
    } else if (type == FuncType.throttleWithTimeout) {
      return onTap?.throttleWithTimeout(timeout: timeout);
    }else if (type == FuncType.debounce) {
      return onTap?.debounce(timeout: timeout);
    }
    return () => onTap?.call();
  }
}