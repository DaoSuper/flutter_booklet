
void main() {
  Computer computer = Computer();
  computer.open();
  computer.calculate();
  computer.close();
}

//实现
class Computer implements Calculate, Electric{ 
  @override
  void calculate() {
    print("do calculate by computer");
  }

  @override
  void close() {
    print("computer close");
  }

  @override
  void open() {
    print("computer open");
  }
}

abstract class Calculate{
  void calculate();
}

abstract class Electric{
  void open();
  void close();
}