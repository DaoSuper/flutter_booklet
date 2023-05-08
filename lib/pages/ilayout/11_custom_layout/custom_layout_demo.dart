

import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CustomLayoutDemo extends StatefulWidget {
  const CustomLayoutDemo({super.key});

  @override
  State<CustomLayoutDemo> createState() => _CustomLayoutDemoState();
}

class _CustomLayoutDemoState extends State<CustomLayoutDemo> {
  ValueNotifier<Polar> polar = ValueNotifier(Polar(len: 0.6, deg: 45 * pi / 180));

  @override
  void dispose() {
    polar.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Expanded(child: Align(
              alignment: Alignment.center,
              child: ColoredBox(
                color: Colors.orange.withOpacity(0.2),
                child: CustomSingleChildLayout(
                  delegate: PolarLayoutDelegate(
                    polar: polar
                  ),
                  child: const SizedBox(
                    width: 20,
                    height: 20,
                    child: ColoredBox(
                      color: Colors.blue,
                      child: Center(
                        child: Text('子', style: TextStyle(color: Colors.white),),
                      ),
                    ),
                  ),
                ),
              ),
            )),
            _buildTools()
          ],
        ),
      ),
    );
  }

  Widget _buildTools() {
    return ValueListenableBuilder<Polar>(
      valueListenable: polar, 
      builder: (_, Polar value, __) => Row(
        children: [
          Expanded(
            flex: 2,
            child: Slider(
              value: value.deg,
              max: 2 * pi,
              min: 0,
              onChanged: (v) {
                polar.value = Polar(len: value.len, deg: v);
              }
            ),
          ),
          Expanded(flex: 1, child: Text("角度: ${(value.deg * 180 / pi).toStringAsFixed(1)}")),
          Expanded(
            flex: 2,
            child: Slider(
              value: value.len,
              max: 1,
              min: 0,
              onChanged: (v) {
                polar.value = Polar(len: v, deg: value.deg);
              }
            ),
          ),
          Expanded(child: Text("长度分率:${value.len.toStringAsFixed(1)}")),
        ],
      )
    );
  }
}


class PolarLayoutDelegate extends SingleChildLayoutDelegate {
  final ValueListenable<Polar> polar;

  PolarLayoutDelegate({required this.polar}) : super(relayout: polar);

  @override
  bool shouldRelayout(covariant PolarLayoutDelegate oldDelegate) => oldDelegate.polar != polar;

  //传入父级约束，返回值就是组件区域尺寸
  @override
  Size getSize(BoxConstraints constraints) {
    final radius = constraints.biggest.shortestSide;
    return Size(radius, radius);
  }

  //对子级进行偏移定位
  @override
  Offset getPositionForChild(Size size, Size childSize) {
    double r = size.width / 2 * polar.value.len;
    Offset center = Offset(size.width / 2, size.height / 2);
    Offset offset = Offset(r * cos(polar.value.deg), r * sin(polar.value.deg));
    Offset childSizeOffset = Offset(childSize.width / 2, childSize.height / 2);
    return center + offset - childSizeOffset;
  }

  //通过父级约束去生成传递约束
  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    return constraints.loosen();
  }
}


// len 是区域半径的分率，deg 是 角度
class Polar{
  final double len;
  final double deg;

  Polar({required this.len, required this.deg});
}