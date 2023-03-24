import 'package:flutter/material.dart';
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
                  ItemBtn(btnName: '渲染', onPressed: ()=> AppRouter.toPage(context, const IRenderPage()),),
                  const ItemBtn(btnName: '动画探索', routeName: AppRouter.animPage),
                  const ItemBtn(btnName: '杂记', routeName: AppRouter.miscellaneousPage),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

