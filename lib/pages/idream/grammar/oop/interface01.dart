void main() {
  C c = C('c');
  c.run();

  // C c = C("hello")
  // c.run(); // 如果多继承，该执行哪个基类的 run 方法 ??
}

// class C extends A , B {
//   C(String name) : super(name); // 如果多继承，该为哪个基类的 name 成员赋值 ??
// }

class C extends A{
  C(super.name);
  
}

class A{
  String name;
  
  A(this.name);

  void run(){  print("B"); }
}

class B{
  String name;

  B(this.name);

  void run(){ print("B"); }
}