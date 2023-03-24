import 'package:flutter/material.dart';
import 'package:flutter_booklet/pages/anim/01_text/03_typer.dart';
import 'package:flutter_booklet/pages/anim/02_use_anictr/anim_function.dart';
import 'package:flutter_booklet/pages/anim/02_use_anictr/attr_value_duration.dart';
import 'package:flutter_booklet/pages/anim/03_curve/curve_page.dart';
import 'package:flutter_booklet/pages/anim/04_tween/01_color.dart';
import 'package:flutter_booklet/pages/anim/04_tween/02_curve_tween.dart';
import 'package:flutter_booklet/pages/anim/04_tween/03_tween_sequence.dart';
import 'package:flutter_booklet/pages/anim/04_tween/04_text_style_tween.dart';
import 'package:flutter_booklet/pages/anim/04_tween/05_custom_tween.dart';
import 'package:flutter_booklet/pages/anim/05_simple/simple_burst_page.dart';
import 'package:flutter_booklet/pages/anim/05_simple/simple_page.dart';
import 'package:flutter_booklet/pages/anim/06_loading/loading_page.dart';
import 'package:flutter_booklet/pages/anim/07_animated_widget/animated_widget_page.dart';
import 'package:flutter_booklet/pages/anim/08_implicitly_animated_widget/implicitly_animated_page.dart';
import 'package:flutter_booklet/pages/anim/09_other/other_page.dart';
import 'package:flutter_booklet/pages/anim/anim_page.dart';
import 'package:flutter_booklet/pages/anim/clock/clock_page.dart';
import 'package:flutter_booklet/pages/miscellaneous/miscellaneous_page.dart';
import 'package:flutter_booklet/routes/router_utils.dart';

import '../pages/anim/01_text/01_color_static.dart';
import '../pages/anim/01_text/02_skew_shadow.dart';

class AppRouter {

  static const String textColorStatic = 'TextColorStatic';
  static const String skewShadowText = 'SkewShadowText';
  static const String typerText = 'TyperText';
  static const String attrAlueDuration = 'AttrAlueDuration';
  static const String ainmaFunction = 'AinmaFunction';
  static const String curvePage = 'CurvePage';
  static const String tweenColor = 'TweenColor';
  static const String teweenCurve = 'TeweenCurve';
  static const String teweenSequencePage = 'TeweenSequencePage';
  static const String textStyleTweenPage = 'TextStyleTweenPage';
  static const String customTweenPage = 'CustomTweenPage';
  static const String simplePage = 'SimplePage';
  static const String simpleBurstPage = 'SimpleBurstPage';
  static const String loadingPage = 'LoadingPage';
  static const String animatedWidgetPage = 'AnimatedWidgetPage';
  static const String implicitlyAnimatedPage = 'ImplicitlyAnimatedPage';
  static const String otherPage = 'OtherPage';
  static const String miscellaneousPage = 'MiscellaneousPage';
  static const String animPage = 'AnimPage';
  static const String clockPage = 'ClockPage';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    debugPrint('arguments>>>>>>>>>${settings.arguments}');

    switch(settings.name) {
      case AppRouter.clockPage:
        return Right2LeftRouter(child: const ClockPage());

      case AppRouter.miscellaneousPage:
        return Right2LeftRouter(child: const MiscellaneousPage());
      
      case AppRouter.otherPage:
        return Right2LeftRouter(child: const OtherPage());

      case AppRouter.implicitlyAnimatedPage:
        return Right2LeftRouter(child: const ImplicitlyAnimatedPage());

      case AppRouter.animatedWidgetPage:
        return Right2LeftRouter(child: const AnimatedWidgetPage());

      case AppRouter.loadingPage:
        return Right2LeftRouter(child: const LoadingPage());

      case AppRouter.simpleBurstPage:
        return Right2LeftRouter(child: const SimpleBurstPage());

      case AppRouter.simplePage:
        return Right2LeftRouter(child: const SimplePage());

      case AppRouter.customTweenPage:
        return Right2LeftRouter(child: const CustomTweenPage());

      case AppRouter.textStyleTweenPage:
        return Right2LeftRouter(child: const TextStyleTweenPage());

      case AppRouter.teweenSequencePage:
        return Right2LeftRouter(child: const TeweenSequencePage());

      case AppRouter.teweenCurve:
        return Right2LeftRouter(child: const TeweenCurve());

      case AppRouter.tweenColor:
        return Right2LeftRouter(child: const TweenColor());

      case AppRouter.curvePage:
        return Right2LeftRouter(child: const CurvePage());

      case AppRouter.textColorStatic:
        return Right2LeftRouter(child: const TextColorStatic());

      case AppRouter.skewShadowText:
        return Right2LeftRouter(child: const SkewShadowText());

      case AppRouter.typerText:
        return Right2LeftRouter(child: const TyperText());

      case AppRouter.attrAlueDuration:
        return Right2LeftRouter(child: const AttrAlueDuration());

      case AppRouter.ainmaFunction:
        return Right2LeftRouter(child: const AinmaFunction());

      case AppRouter.animPage:
        return Right2LeftRouter(child: const AnimPage());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          )
        );
    }
  }

  static toPage(BuildContext context, Widget page){
    Navigator.push(context, Right2LeftRouter(child: page));
  }
}