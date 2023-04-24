
// 关键字	      类关系	耦合性
// extend	      继承	  高
// implements	  实现	  低
// with	        混入	  中
class A {
  String name = "A";

  void log() {
    print(name);
  }
}

abstract class B{
  void log();
}

class C with A, B {

  @override
  void log() {
    super.log();// B
    print("C");
  }
}

void main(){
  C c = C();
  c.log();
  print(c.name);
}
