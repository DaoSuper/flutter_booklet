

import 'package:flutter/material.dart';
import 'package:flutter_booklet/utils/anim_util.dart';

//AnimatedDefaultTextStyle 默认文字动画 当其属性发生改变时，会进行动画渐变
class DefaultTextStyleAnim extends StatefulWidget {
  const DefaultTextStyleAnim({super.key});

  @override
  State<DefaultTextStyleAnim> createState() => _DefaultTextStyleAnimState();
}

class _DefaultTextStyleAnimState extends State<DefaultTextStyleAnim> {
  
  final TextStyle startStyle = const TextStyle(
    color: Colors.white,
    fontSize: 50,
    shadows: [
      Shadow(offset: Offset(1, 1), color: Colors.black, blurRadius: 3)
    ]
  );
  final TextStyle endStyle = const TextStyle(
    color: Colors.white,
    fontSize: 20,
    shadows: [
      Shadow(offset: Offset(1, 1), color: Colors.purple, blurRadius: 3)
    ]
  );

  late TextStyle _textStyle;

  @override
  void initState() {
    _textStyle = startStyle;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(_textStyle == endStyle){
          _textStyle = startStyle;
        } else {
          _textStyle = endStyle;
        }
        setState(() {});
      },
      child: Container(
        width: 300,
        height: 100,
        alignment: Alignment.center,
        color: Colors.grey.withAlpha(22),
        child: AnimatedDefaultTextStyle(
          textAlign: TextAlign.start,
          softWrap: true,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          curve: Curves.fastOutSlowIn,
          style: _textStyle, 
          duration: AnimUtil.druation,
          child: const Text('Flutter Dao DefaultTextStyle' )
        ),
      ),
    );
  }
}