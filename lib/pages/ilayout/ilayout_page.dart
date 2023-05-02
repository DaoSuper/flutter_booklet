import 'package:flutter/material.dart';
import 'package:flutter_booklet/pages/idream/timer/timer_page.dart';
import 'package:flutter_booklet/pages/ilayout/01_constraints/constraints_demo.dart';
import 'package:flutter_booklet/pages/ilayout/02_common_constraints/nxm_demo.dart';
import 'package:flutter_booklet/routes/app_router.dart';
import 'package:flutter_booklet/widgets/dao_button.dart';

import '02_common_constraints/01_layout_demo.dart';

class ILayoutPage extends StatelessWidget {
  const ILayoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('布局探索'),
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
              ItemBtn(
                btnName: 'ConstraintsDemo', 
                onPressed: (){
                  AppRouter.toPage(context, const ConstraintsDemo());
                }
              ),
              ItemBtn(
                btnName: 'LayoutDemo', 
                onPressed: (){
                  AppRouter.toPage(context, const LayoutDemo());
                }
              ),
              ItemBtn(
                btnName: 'NXMDemo', 
                onPressed: (){
                  AppRouter.toPage(context, const NXMDemo());
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}

