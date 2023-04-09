 void main() {
  Drawable drawable = Drawable();

  Vec2 vec2 = Vec2(2, 3);
  drawable.draw(vec2);
}

//依赖
class Drawable {
  void draw(Vec2 vec2){
    print("绘制向量(${vec2.x},${vec2.y})");
  }
}


class Vec2 {
  double x;
  double y;

  Vec2(this.x, this.y);
}
