
void main() {
  Shape shape = Shape();
  shape.move();
}

mixin Position {
  Vec2 vec2 = Vec2(0, 0);
}

//通过 on 关键字产生类似于 继承 的关系
mixin MoveAble on Position {
  double speed = 10;

  void move() {
    vec2.x += speed;
    vec2.y += speed;
    print("$runtimeType move: (${vec2.x}, ${vec2.y})");
  }
}

class Shape with Position,MoveAble{

}

class Vec2 {
  double x;
  double y;

  Vec2(this.x, this.y);
}