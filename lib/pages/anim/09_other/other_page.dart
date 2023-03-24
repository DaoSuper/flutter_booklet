import 'package:flutter/material.dart';
import 'package:flutter_booklet/pages/anim/09_other/01_animated_icon.dart';
import 'package:flutter_booklet/pages/anim/09_other/02_cupertino_activity_indicator.dart';
import 'package:flutter_booklet/pages/anim/09_other/03_animated_cross_fade.dart';
import 'package:flutter_booklet/pages/anim/09_other/04_animated_switcher.dart';
import 'package:flutter_booklet/pages/anim/09_other/05_anim_router.dart';

//[1] .绘制型动画组件 ：比如 CupertinoActivityIndicator 、LinearProgressIndicator 、AnimatedIcon 等组件是框架层的绘制组件
//[2]. 其他可用于动画处理的组件：比如 AnimatedCrossFade 、AnimatedSwitcher、AnimatedSize
//[3]. 有动画效果的组件：依赖于其他动画组件实现的，比如 Dismissible、FlutterLogo、DrawerHeader、Stepper 、ExpandIcon、RefreshIndicator 等组件都会基于显式/隐式动画 进行某些动画效果
//[4]. 路由动画 ：指定两个界面间的切换动画
class OtherPage extends StatelessWidget {
  const OtherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            const IconAnim(),
            const SizedBox(height: 10,),
            const IndicatorAnim(),
            const SizedBox(height: 10,),
            const FadeAnim(),
            const SizedBox(height: 10,),
            const SwitcherAnim(),
            const SizedBox(height: 10,),
            ElevatedButton(
              onPressed: (){
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const GreenPage())
                );
              },
              child: const Text('动画路由')
            )
          ],
        ),
      ),
    );
  }
}