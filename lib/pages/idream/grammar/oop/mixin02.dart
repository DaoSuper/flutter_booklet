// 混入类不能拥有【构造方法】

void main() {
  C c = C();
  c.log(); // B
}

mixin A {
  
  String name = "A";

  void log() {
    print(name);
  }
}

mixin B {
  String name = "B";

  void log() {
    print(name);
  }
}

//后混入会覆盖先混入的同名变量和方法
class C with A, B {
  @override
  void log() {
    super.log();// B
    print("C");
  }
}