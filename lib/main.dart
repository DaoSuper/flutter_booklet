import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_booklet/pages/app_page.dart';
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
    return MaterialApp(
      title: 'Anim',
      onGenerateRoute: AppRouter.generateRoute,
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: const AppPage(),
    );
  }
}
