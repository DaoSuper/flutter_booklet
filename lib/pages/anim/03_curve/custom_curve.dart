import 'package:flutter/material.dart';


//自定义Curve 曲线
//加速曲线
class X2Curve extends Curve {
 const X2Curve();

  @override
  double transformInternal(double t) {
    return t * t;
  }
}

//阻尼曲线
class DampingCurve extends Curve {
  const DampingCurve();

  @override
  double transformInternal(double t) {
    t = t - 1.0;
    return t * t * t * t * t + 1.0;
  }
}