import 'package:flutter/material.dart';
// SliverCrossAxisGroup：可以容纳多个 Sliver 组件，在交叉轴方向上分组
// SliverConstrainedCrossAxis：指定滑片的交叉轴尺寸。
// SliverCrossAxisExpanded：指定滑片的交叉轴上占据的份额。
class SliverCrossAxisGroupExample extends StatelessWidget {
  const SliverCrossAxisGroupExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SliverCrossAxisGroup')),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverCrossAxisGroup(slivers: <Widget>[
            SliverConstrainedCrossAxis(
              maxExtent: 100, 
              sliver: SliverColorList(
                height: 100.0,
                fontSize: 24,
                count: 24,
                color1: Colors.amber[300],
                color2: Colors.blue[300],
              )
            ),
            SliverCrossAxisExpanded(
              flex: 1, // tag1
              sliver: SliverColorList(
                height: 80.0,
                fontSize: 18,
                count: 45,
                color1: Colors.green[300],
                color2: Colors.red[300],
              ),
            ),
            SliverCrossAxisExpanded(
              flex: 2, // tag2
              sliver: SliverColorList(
                height: 50.0,
                fontSize: 20,
                count: 18,
                color1: Colors.purple[300],
                color2: Colors.orange[300],
              )
            ),
          ])
        ],
      ),
    );
  }
}

class SliverColorList extends StatelessWidget {
  final double height;
  final double fontSize;
  final int count;
  final Color? color1;
  final Color? color2;

  const SliverColorList({
    super.key, 
    required this.height, 
    required this.fontSize, 
    required this.count,
    this.color1, 
    this.color2, 
  });

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: count,
      itemBuilder:(context, index) {
        return Container(
          color: index.isEven ? color1 : color2,
          child: Center(
            child: Text(
              'Item $index',
              style: TextStyle(fontSize: fontSize),
            ),
          ),
        );
      },
    );
  }

}