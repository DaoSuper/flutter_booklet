

import 'package:flutter/cupertino.dart';

class IndicatorAnim extends StatefulWidget {
  const IndicatorAnim({super.key});

  @override
  State<IndicatorAnim> createState() => _IndicatorAnimState();
}

class _IndicatorAnimState extends State<IndicatorAnim> with SingleTickerProviderStateMixin{
  bool _animating = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
          _animating = !_animating;
        });
      },
      child: CupertinoActivityIndicator(
        animating: _animating,
        radius: 20,
      ),
    );
  }
}