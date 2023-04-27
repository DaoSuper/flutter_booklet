// 支持在某类定义文件之外，拓展该类的方法，在其中可以访问类成员。
extension JudgeStringExt on String{

  bool isPhone(){
    const String reg = r'^(13[0-9]|14[01456879]|15[0-35-9]|16[2567]|17[0-8]|18[0-9]|19[0-35-9])\d{8}$';
    RegExp(reg).hasMatch(this);
    return RegExp(reg).hasMatch(this);
  }

}

void main() {
  String input = "18715079839";
  bool checked = input.isPhone();
  print(checked); // true
}