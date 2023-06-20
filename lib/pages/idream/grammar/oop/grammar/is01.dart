//  is 关键字来校验一个对象是否是某个类型
// 当一个类 继承、实现 或 混入 某个类，可视为该类型
void main(){
  // Rectangle rectangle = Rectangle(Vec2(10,10));
  // print(rectangle is Shape); // true

  // 通过 as 关键字对类型进行强制转换
  {
    Shape circle = Circle(Vec2(10,10));
    Circle c = circle as Circle;
    print(c.radius); // 10.0
  }

  {
    Shape circle = Circle(Vec2(10,10));
    Rectangle c = circle as Rectangle;
    print(c.width); // 10.0
  }
}

void drawShape(Shape shape){
  shape.draw();
  if(shape is Rectangle){
    print("绘制矩形: 宽高(${shape.width},${shape.height})");
  }
}

abstract class Shape{
  Vec2 center;

  Shape(this.center);

  void move(){
    center.x += 10;
    center.y += 10;
  }

  void draw(){
    String info = "绘制矩形，中心点(${center.x},${center.y})\n"
        "${drawInChild()}";
    print(info);
  }

  String drawInChild();

  void rotate(){

  }
}

class Rectangle extends Shape{
  double width;
  double height;

  Rectangle(Vec2 center,{this.width=10,this.height=10}):super(center);

  @override
  String drawInChild() => "宽:$height, 高: $width";
}

class Circle extends Shape{
  double radius;

  Circle(Vec2 center,{this.radius=10}):super(center);

  @override
  String drawInChild() => "半径:$radius";
}

class Vec2{
  double x;
  double y;

  Vec2(this.x, this.y);
}