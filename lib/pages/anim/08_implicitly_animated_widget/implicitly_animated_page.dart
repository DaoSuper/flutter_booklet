import 'package:flutter/material.dart';
import 'package:flutter_booklet/pages/anim/08_implicitly_animated_widget/01_animated_opacity_widget.dart';
import 'package:flutter_booklet/pages/anim/08_implicitly_animated_widget/03_animated_align.dart';
import 'package:flutter_booklet/pages/anim/08_implicitly_animated_widget/04_animated_container.dart';
import 'package:flutter_booklet/pages/anim/08_implicitly_animated_widget/05_tween_animation_builder.dart';

import '02_animated_default_textstyle.dart';

//隐式动画 ImplicitlyAnimatedWidget 一族
//更改属性，进行重建
// 优势: 
// [1]. 用户无需操作[动画器]，使用门槛较低。
// [2]. 将动画器[封装]入组件内部，可以进一步避免用户对动画器的误用。
// [3]. 可直接通过 onEnd 方法监听到动画结束回调

// 劣势:
// [1]. 无法随意控制动画 [开启/停止]，必须重建组件才能执行动画。
// [2]. 隐式动画每个动画组件都会创建一个控制器。
class ImplicitlyAnimatedPage extends StatelessWidget {
  const ImplicitlyAnimatedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: const [
            OpacityAnim(),
            SizedBox(height: 20,),
            DefaultTextStyleAnim(),
            SizedBox(height: 20,),
            AlignAnim(),
            SizedBox(height: 20,),
            ContainerAnim(),
            SizedBox(height: 20,),
            TweenAnim()
          ],
        ),
      ),
    );
  }
}