

import 'package:flutter/material.dart';
import 'package:flutter_booklet/pages/anim/07_animated_widget/01_rotation_transition.dart';
import 'package:flutter_booklet/pages/anim/07_animated_widget/02_scale_transition.dart';
import 'package:flutter_booklet/pages/anim/07_animated_widget/03_slide_transition.dart';
import 'package:flutter_booklet/pages/anim/07_animated_widget/04_align_transition.dart';
import 'package:flutter_booklet/pages/anim/07_animated_widget/05_decorated_box.dart';

//AnimatedWidget 一族
// 显式动画 需要使用者自己提供 动画器, ImplicitlyAnimatedWidget (隐式动画)不需要
// 优势: 
// [1]. 用户可以传入[动画器],这使得操作更加灵活，比如
//   |--- 可以通过 Animatable 变换动画器，使用 TweenSequence。
//   |--- 可以随时 [开启/停止] 动画。
// [2]. [一个] 动画器控制器可服务于 [多个] 显式动画组件，而隐式动画每个动画组件都会创建一个控制器。
// [3]. [无需重建] 显式动画，就可以完成动画。
// [4]. 组件本身是局部构建的，在一定程度上可以避免用户误用动画刷新。

// 劣势:
// [1]. 用户需要了解 [动画器] 的使用方式，所以使用门槛较高。
class AnimatedWidgetPage extends StatelessWidget {
  const AnimatedWidgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: const [
            RotationAnim(),
            SizedBox(height: 20,),
            ScaleAnim(),
            SizedBox(height: 20,),
            SlideAnim(),
            SizedBox(height: 20,),
            AlignAnim(),
            SizedBox(height: 20,),
            DecoratedBoxAnim(),
          ],
        ),
      ),
    );
  }
}