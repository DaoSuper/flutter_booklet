
import 'package:flutter/material.dart';
import 'package:flutter_booklet/utils/anim_util.dart';

class TextStyleTweenPage extends StatefulWidget {
  const TextStyleTweenPage({super.key});

  @override
  State<TextStyleTweenPage> createState() => _TextStyleTweenPageState();
}

//自定义 Tween
class _TextStyleTweenPageState extends State<TextStyleTweenPage> with SingleTickerProviderStateMixin{

  late AnimationController _controller;

  final TextStyleTween textStyleTween = TextStyleTween(
    begin: const TextStyle(color: Colors.blue, fontSize: 14, letterSpacing: 4,),
    end: const TextStyle(color: Colors.purple, fontSize: 40, letterSpacing: 10,)
  );

  // TextStyle 动画器
  late Animation<TextStyle> textAnimation;


  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: AnimUtil.druation);
    // 通过 TextStyleTween 创建 TextStyle 动画器
    textAnimation = textStyleTween.animate(_controller);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: const EdgeInsets.only(top: 100),
        alignment: Alignment.center,
        child: Column(
          children: [
            const SizedBox(height: 32,),
            AnimatedBuilder(
              animation: _controller, 
              builder: (_, __) {
                return Text("TextStyleTween", style: textAnimation.value,);              }
            ),
            Wrap(
              spacing: 10,
              children: [
                ElevatedButton(
                  onPressed: (){
                    _controller.forward(from: 0);
                  }, 
                  child: const Text('StartAnim')
                )
              ],
            )
          ],
        )
      ),
    );
  }
}