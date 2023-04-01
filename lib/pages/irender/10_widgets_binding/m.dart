
// 如果一个 mixin 依赖于(on) 一个抽象类，那么被混入的类必须要继承自该 抽象类
// class A with B{ // Error
// class A with C, B { // Error
class A extends D with C, B {
  @override
  void say() {
    print(count);
  }
}

////可以依赖于 普通类 或 抽象类 的
mixin B on D, C {
  int get count => _count;

  void log() => say();
}

mixin C {}

abstract class D {
  int _count = 0;

  void say();
}