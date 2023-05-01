import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_booklet/pages/app_page.dart';
import 'package:flutter_booklet/pages/idream/timer/app_config.dart';
import 'package:flutter_booklet/pages/idream/timer/app_config_bloc.dart';
import 'package:flutter_booklet/routes/app_router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // 确定初始化
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemUiOverlayStyle overlayStyle = const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark);
        
    return BlocProvider<AppConfigBloc>(
      create: (_) => AppConfigBloc(appConfig: AppConfig.defaultConfig()),
      child: BlocBuilder<AppConfigBloc, AppConfig>(
        builder: (_, state) => MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: state.locale, // 指定语言
          debugShowCheckedModeBanner: false,
          onGenerateRoute: AppRouter.generateRoute,
          theme: ThemeData(
            primaryColor: state.themeColor,
            appBarTheme: AppBarTheme(
              systemOverlayStyle: overlayStyle,
            )
          ),
          home: const AppPage(),
        ),
      ),
    );
  }
}
