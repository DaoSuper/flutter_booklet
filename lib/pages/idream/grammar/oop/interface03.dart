void main() {
  C c = C();
  c.log();
  c.run();
}

class A{
  final String name;
  A(this.name);
  void run(){
    print("run in a");
  }
}

class B{
  final String name;
  B(this.name);
  void run(){
    print("run in a");
  }

  void log(){
    print("log in a");
  }
}

//当 C 类实现 A 、B 接口，必须强制覆写 所有 成员方法
//必须强制覆为 所有 成员变量提供 get 方法
class C implements A,B{

  @override
  void log() {
    print("log in c");
  }
  
  @override
  void run() {
    print("run in c");
  }
  
  @override
  String get name => 'C';
}