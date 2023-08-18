import 'package:flutter/material.dart';
import 'package:flutter_booklet/pages/iwidget/layout/sliver/DecoratedSliver/sliver_example.dart';
import 'package:flutter_booklet/pages/iwidget/layout/sliver/SliverCrossAxisGroupExample/sliver_example.dart';
import 'package:flutter_booklet/pages/iwidget/layout/sliver/SliverMainAxisGroup/sliver_example.dart';
import 'package:flutter_booklet/routes/app_router.dart';
import 'package:flutter_booklet/widgets/dao_button.dart';

class LayoutPage extends StatelessWidget {
  const LayoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('布局'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text('排列其他组件的列、行、网格和许多其他布局。'),
            ),
            SizedBox(height: 10,),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              color: Colors.grey[200],
              child: Text('Sliver'),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Wrap(
                direction: Axis.horizontal,
                alignment: WrapAlignment.spaceBetween,
                spacing: 20,
                runSpacing: 10,
                children:  [
                  ItemBtn(
                    btnName: 'SliverMainAxisGroup', 
                    onPressed: (){
                      AppRouter.toPage(context, SliverMainAxisGroupExample());
                    }
                  ),
                  ItemBtn(
                    btnName: 'SliverCrossAxisGroup', 
                    onPressed: (){
                      AppRouter.toPage(context, SliverCrossAxisGroupExample());
                    }
                  ),
                  ItemBtn(
                    btnName: 'DecoratedSliver', 
                    onPressed: (){
                      AppRouter.toPage(context, DecoratedSliverExample());
                    }
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}