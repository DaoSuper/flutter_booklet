import 'package:flutter/material.dart';
import 'package:flutter_booklet/pages/anim/anim_page.dart';
import 'package:flutter_booklet/pages/home/example_page.dart';
import 'package:flutter_booklet/pages/idraw/idraw_page.dart';
import 'package:flutter_booklet/pages/idream/idream_page.dart';
import 'package:flutter_booklet/pages/ilayout/ilayout_page.dart';
import 'package:flutter_booklet/pages/irender/irender_page.dart';
import 'package:flutter_booklet/routes/app_router.dart';
import 'package:flutter_booklet/widgets/dao_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Wrap(
                direction: Axis.horizontal,
                alignment: WrapAlignment.center,
                spacing: 10,
                runSpacing: 8,
                children: [
                  ItemBtn(btnName: '语言基础', onPressed: ()=> AppRouter.toPage(context, const IDreamPage()),),
                  ItemBtn(btnName: '绘制指南', onPressed: ()=> AppRouter.toPage(context, const IDrawPage()),),
                  ItemBtn(btnName: '动画探索', onPressed: ()=> AppRouter.toPage(context, const AnimPage()),),
                  ItemBtn(btnName: '布局探索', onPressed: ()=> AppRouter.toPage(context, const ILayoutPage()),),
                  ItemBtn(btnName: '渲染机制', onPressed: ()=> AppRouter.toPage(context, const IRenderPage()),),
                  ItemBtn(btnName: '事例效果', onPressed: ()=> AppRouter.toPage(context, const ExamplePage()),),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

