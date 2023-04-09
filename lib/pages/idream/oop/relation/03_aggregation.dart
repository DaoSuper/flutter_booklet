
void main() {
  Memory memory = Memory("Apple M1", 16);
  GraphicsCard graphicsCard = GraphicsCard("Apple M1");
  Computer computer = Computer("mac air", memory, graphicsCard);
  computer.printConfig();
}

//聚合关系
class Computer {
  String name;
  Memory memory;
  GraphicsCard graphicsCard;

  Computer(this.name, this.memory, this.graphicsCard);

  void printConfig(){
    print("====电脑名称:[$name]=====");
    print("====电脑显卡:[${graphicsCard.name}]=====");
    print("====电脑内存:[${memory.type}:${memory.size}GB]=====");
  }
}

class GraphicsCard{ // 显卡
  String name;
  GraphicsCard(this.name);
}

class Memory{ // 内存
  double size;
  String type;

  Memory(this.type,this.size);
}