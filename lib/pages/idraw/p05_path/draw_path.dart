import 'package:flutter/material.dart';
import 'package:flutter_booklet/pages/idraw/p05_path/01_to_move_line.dart';
import 'package:flutter_booklet/pages/idraw/p05_path/02_relative_move_line.dart';
import 'package:flutter_booklet/pages/idraw/p05_path/03_to_arc.dart';
import 'package:flutter_booklet/pages/idraw/p05_path/04_to_point_arc.dart';
import 'package:flutter_booklet/pages/idraw/p05_path/05_to_conic.dart';
import 'package:flutter_booklet/pages/idraw/p05_path/06_quadratic_bezier.dart';
import 'package:flutter_booklet/pages/idraw/p05_path/07_cubic.dart';
import 'package:flutter_booklet/pages/idraw/p05_path/08_addRRect.dart';
import 'package:flutter_booklet/pages/idraw/p05_path/09_addOval.dart';
import 'package:flutter_booklet/pages/idraw/p05_path/10_addPolygon.dart';
import 'package:flutter_booklet/pages/idraw/p05_path/12_close_reset_shift.dart';
import 'package:flutter_booklet/pages/idraw/p05_path/13_getBounds_contains.dart';
import 'package:flutter_booklet/pages/idraw/p05_path/15_combine.dart';
import 'package:flutter_booklet/pages/idraw/p05_path/17_computeMetrics.dart';
import 'package:flutter_booklet/routes/app_router.dart';
import 'package:flutter_booklet/widgets/dao_button.dart';

class DrawPath extends StatelessWidget {
  const DrawPath({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('绘制路径'),
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
                btnName: 'MoveToLineDemo', 
                onPressed: (){
                  AppRouter.toPage(context, const ToMoveLineDemo());
                }
              ),
              ItemBtn(
                btnName: 'RelativeMoveLineDemo', 
                onPressed: (){
                  AppRouter.toPage(context, const RelativeMoveLineDemo());
                }
              ),
              ItemBtn(
                btnName: 'ArcToDemo', 
                onPressed: (){
                  AppRouter.toPage(context, const ArcToDemo());
                }
              ),
              ItemBtn(
                btnName: 'ArcToPointDemo', 
                onPressed: (){
                  AppRouter.toPage(context, const ArcToPointDemo());
                }
              ),
              ItemBtn(
                btnName: 'ConicToDemo', 
                onPressed: (){
                  AppRouter.toPage(context, const ConicToDemo());
                }
              ),
              ItemBtn(
                btnName: 'QuadraticBezierToDemo', 
                onPressed: (){
                  AppRouter.toPage(context, const QuadraticBezierToDemo());
                }
              ),
              ItemBtn(
                btnName: 'CubicToDemo', 
                onPressed: (){
                  AppRouter.toPage(context, const CubicToDemo());
                }
              ),
              ItemBtn(
                btnName: 'AddRRectDemo', 
                onPressed: (){
                  AppRouter.toPage(context, const AddRRectDemo());
                }
              ),
              ItemBtn(
                btnName: 'AddOvalDemo', 
                onPressed: (){
                  AppRouter.toPage(context, const AddOvalDemo());
                }
              ),
              ItemBtn(
                btnName: 'AddPolygonDemo', 
                onPressed: (){
                  AppRouter.toPage(context, const AddPolygonDemo());
                }
              ),
              ItemBtn(
                btnName: 'CloseResetShiftDemo', 
                onPressed: (){
                  AppRouter.toPage(context, const CloseResetShiftDemo());
                }
              ),
              ItemBtn(
                btnName: 'GetBoundsContainsDemo', 
                onPressed: (){
                  AppRouter.toPage(context, const GetBoundsContainsDemo());
                }
              ),
              ItemBtn(
                btnName: 'CombineDemo', 
                onPressed: (){
                  AppRouter.toPage(context, const CombineDemo());
                }
              ),
              ItemBtn(
                btnName: 'ComputeMetricsDemo', 
                onPressed: (){
                  AppRouter.toPage(context, const ComputeMetricsDemo());
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}