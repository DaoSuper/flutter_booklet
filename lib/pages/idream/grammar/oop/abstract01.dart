
void main() {
  Circle circle = Circle(Vec2(2, 2));
  circle.move();
  circle.debugLabelName();
}

class Circle extends Shape {
  Circle(super.center);

  @override
  String debugLabelName() {
    return 'Circle';
  }

}

//抽象类中【允许】只声明成员方法，不进行实现
abstract class Shape {

  Vec2 center;
  Shape(this.center);

  String debugLabelName();

  void printInfo(){
    String name = debugLabelName();
    print("【$name】center:(${center.x},${center.y})");
  }

  void move() {
    center.x += 10;
    center.y += 10;
    print("$runtimeType:center:(${center.x}, ${center.y})");
  }
}

class Vec2 {
  double x;
  double y;

  Vec2(this.x, this.y);
}

