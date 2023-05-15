import 'package:flutter/material.dart';
import 'package:flutter_booklet/pages/idraw/p06_color/s02_colors.dart';
import 'package:flutter_booklet/pages/idraw/p06_color/s03_blendMode.dart';
import 'package:flutter_booklet/pages/idraw/p06_color/s05_image_color.dart';
import 'package:flutter_booklet/routes/app_router.dart';
import 'package:flutter_booklet/widgets/dao_button.dart';

class DrawColor extends StatelessWidget {
  const DrawColor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('绘制Color'),
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
                btnName: 'RectColorsDemo', 
                onPressed: (){
                  AppRouter.toPage(context, const RectColorsDemo());
                }
              ),
              ItemBtn(
                btnName: 'BlendModeDemo', 
                onPressed: (){
                  AppRouter.toPage(context, const BlendModeDemo());
                }
              ),
              ItemBtn(
                btnName: 'ImageColorDemo', 
                onPressed: (){
                  AppRouter.toPage(context, const ImageColorDemo());
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}