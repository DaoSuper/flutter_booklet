
import 'package:flutter/material.dart';
import 'package:flutter_booklet/pages/miscellaneous/func_demo/func_demo.dart';
import 'package:flutter_booklet/routes/app_router.dart';
import 'package:flutter_booklet/widgets/dao_button.dart';

class MiscellaneousPage extends StatelessWidget {
  const MiscellaneousPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('杂记'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Center(
          child: Wrap(
            direction: Axis.horizontal,
            alignment: WrapAlignment.center,
            spacing: 10,
            runSpacing: 8,
            children: [
              ItemBtn(
                btnName: '事件节流&防抖', 
                onPressed: () => AppRouter.toPage(context, const FuncDemo())
              ),
            ],
          ),
        ),
      ),
    );
  }
}