import 'package:flutter/material.dart';
import 'package:flutter_booklet/pages/irender/01_timer/timer_demo.dart';
import 'package:flutter_booklet/pages/irender/04_multi_node/multi_node.dart';
import 'package:flutter_booklet/pages/irender/08_key/global_key_demo/global_key_demo.dart';
import 'package:flutter_booklet/pages/irender/08_key/key_demo.dart';
import 'package:flutter_booklet/pages/irender/08_key/key_demo2.dart';
import 'package:flutter_booklet/pages/irender/08_key/no_key_demo.dart';
import 'package:flutter_booklet/pages/irender/09_proxy/color_provider.dart';
import 'package:flutter_booklet/pages/irender/09_proxy/parent_data_widget_demo.dart';
import 'package:flutter_booklet/pages/irender/state_demo/state_demo.dart';
import 'package:flutter_booklet/routes/app_router.dart';
import 'package:flutter_booklet/widgets/dao_button.dart';

class IRenderPage extends StatelessWidget {
  const IRenderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('渲染机制'),
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
                btnName: 'Timer', 
                onPressed: (){
                  TimerDemo.timerTest();
                  TimerDemo.do2();
                }
              ),
              ItemBtn(
                btnName: 'setStateDemo', 
                onPressed: (){
                  AppRouter.toPage(context, const StateDemo());
                }
              ),
              ItemBtn(
                btnName: 'MultiNode', 
                onPressed: (){
                  AppRouter.toPage(context, const MultiNode());
                }
              ),
              ItemBtn(
                btnName: 'KeyDemo', 
                onPressed: (){
                  AppRouter.toPage(context, const KeyDemo());
                }
              ),
              ItemBtn(
                btnName: 'NoKeyDemo', 
                onPressed: (){
                  AppRouter.toPage(context, const NoKeyDemo());
                }
              ),
              ItemBtn(
                btnName: 'KeyDemo2', 
                onPressed: (){
                  AppRouter.toPage(context, const KeyDemo2());
                }
              ),
              ItemBtn(
                btnName: 'GlobalKeyDemo', 
                onPressed: (){
                  AppRouter.toPage(context, const GlobalKeyDemo());
                }
              ),
              ItemBtn(
                btnName: 'DirectionalityDemo', 
                onPressed: (){
                  AppRouter.toPage(context, const ColorProviderDemo());
                }
              ),
              ItemBtn(
                btnName: 'ParentDataWidgetDemo', 
                onPressed: (){
                  AppRouter.toPage(context, const ParentDataWidgetDemo());
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}

