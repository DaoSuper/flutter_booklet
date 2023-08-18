import 'package:flutter/material.dart';
import 'package:flutter_booklet/pages/iwidget/layout/layout_page.dart';
import 'package:flutter_booklet/routes/app_router.dart';
import 'package:flutter_booklet/widgets/dao_button.dart';

class IWidgetPage extends StatelessWidget {
  const IWidgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('组件集'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Wrap(
          direction: Axis.horizontal,
          alignment: WrapAlignment.spaceBetween,
          spacing: 10,
          runSpacing: 8,
          children:  [
            ItemBtn(
              btnName: 'Layout', 
              onPressed: (){
                  AppRouter.toPage(context, const LayoutPage());
              }
            ),
            
          ],
        ),
      ),
    );
  }
}