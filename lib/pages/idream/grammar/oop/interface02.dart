// 接口就是为了解决多继承二义性的问题，而引入的概念
void main() {
  C c = C();
  c.run();
}

abstract class A{
  void run();
}

abstract class B{
  void run();
}

class C implements A,B{
  @override
  void run() {
    print("C");
  }
}