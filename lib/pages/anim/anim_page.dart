import 'package:flutter/material.dart';
import 'package:flutter_booklet/pages/anim/10_ticker/ticker_page.dart';
import 'package:flutter_booklet/routes/app_router.dart';
import 'package:flutter_booklet/widgets/dao_button.dart';

class AnimPage extends StatelessWidget {
  const AnimPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('动画探索'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Center(
          child: Wrap(
            direction: Axis.horizontal,
            alignment: WrapAlignment.center,
            spacing: 10,
            runSpacing: 8,
            children:  [
              const ItemBtn(btnName: '渐变斜阴影', routeName: AppRouter.textColorStatic),
              const ItemBtn(btnName: '渐变斜阴影', routeName: AppRouter.skewShadowText),
              const ItemBtn(btnName: 'Timer', routeName: AppRouter.typerText),
              const ItemBtn(btnName: 'Timer', routeName: AppRouter.typerText),
              const ItemBtn(btnName: 'AnimationController属性', routeName: AppRouter.attrAlueDuration),
              const ItemBtn(btnName: '动画方法', routeName: AppRouter.ainmaFunction),
              const ItemBtn(btnName: 'Curve使用', routeName: AppRouter.curvePage),
              const ItemBtn(btnName: 'TweenColor', routeName: AppRouter.tweenColor),
              const ItemBtn(btnName: 'TweenCurve', routeName: AppRouter.teweenCurve),
              const ItemBtn(btnName: 'TweenSequence', routeName: AppRouter.teweenSequencePage),
              const ItemBtn(btnName: 'TextStyleTween', routeName: AppRouter.textStyleTweenPage),
              const ItemBtn(btnName: '自定义Tween', routeName: AppRouter.customTweenPage),
              const ItemBtn(btnName: '动画例子', routeName: AppRouter.simplePage),
              const ItemBtn(btnName: '动画例子2', routeName: AppRouter.simpleBurstPage),
              const ItemBtn(btnName: '加载动画', routeName: AppRouter.loadingPage),
              const ItemBtn(btnName: '显式动画', routeName: AppRouter.animatedWidgetPage),
              const ItemBtn(btnName: '隐式动画', routeName: AppRouter.implicitlyAnimatedPage),
              const ItemBtn(btnName: '其他动画', routeName: AppRouter.otherPage),
              ItemBtn(
                btnName: 'Ticker',
                onPressed: (){
                  AppRouter.toPage(context, const TickerPage());
                }
              ),
              const ItemBtn(
                btnName: 'clockPage', 
                routeName: AppRouter.clockPage,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

