import 'package:flutter/material.dart';
import 'package:flutter_booklet/pages/idraw/p04_canvas/14_image/paper.dart';
import 'package:flutter_booklet/routes/app_router.dart';
import 'package:flutter_booklet/widgets/dao_button.dart';

class IDrawPage extends StatelessWidget {
  const IDrawPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('绘制指南'),
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
                btnName: 'PaperDemo', 
                onPressed: (){
                  AppRouter.toPage(context, const PaperDemo());
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}