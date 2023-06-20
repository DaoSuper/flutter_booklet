import 'package:flutter/painting.dart';

void main(){
  Shape shape = Shape();
  shape.speed = 20; 
  shape.move();//=====Shape move====
  shape.paint();
}

//混入类通过 mixin 关键字进行声明
mixin MoveAble{
  double speed = 10;
  void move(){
    print("=====$runtimeType move====");
  }
}

//对混入类通过 with 关键字进行使用
//可以混入若干个类，通过 , 号隔开
class Shape with MoveAble, PaintAble{
  @override
  void init() {
    painter = Paint();
  }

}

mixin PaintAble{
  late Paint painter;
  void paint(){
    print("=====$runtimeType paint====");
  }
  void init();
}