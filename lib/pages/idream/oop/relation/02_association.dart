
void main() {
  Computer computer = Computer("mac ari");
  User user = User(computer);
  user.actionOpen();
}

//关联
class User {

  Computer computer;
  User(this.computer);

  void actionOpen(){
    computer.open();
  }
}

class Computer {
  String name;
  Computer(this.name);

  void open(){
    print("====电脑开机:[$name]=====");
  }
}