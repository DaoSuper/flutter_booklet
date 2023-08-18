import 'package:flutter/material.dart';

//可以容纳多个 Sliver 组件，在主轴方向上分组
class SliverMainAxisGroupExample extends StatefulWidget {
  const SliverMainAxisGroupExample({super.key});

  @override
  State<SliverMainAxisGroupExample> createState() => _SliverMainAxisGroupExampleState();
}

class _SliverMainAxisGroupExampleState extends State<SliverMainAxisGroupExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(title: Text('SliverMainAxisGroup')),
      body: CustomScrollView(
        slivers: ItemData.testData.map(_buildGroup).toList(),
      ),
    );
  }

  Widget _buildGroup(ItemData itemData) {
    return SliverMainAxisGroup(slivers: [
      SliverPersistentHeader(
        pinned: true,
        delegate: HeaderDelegate(itemData.groupName),
      ),
      SliverList(
        delegate: SliverChildBuilderDelegate(
          (_, index) => _buildItemByUser(itemData.users[index]),
          childCount: itemData.users.length
        )
      )
    ]);
  }

  Widget _buildItemByUser(String user){
    return Container(
      alignment: Alignment.center,
      height: 56,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 10),
            child: FlutterLogo(size: 30,),
          ),
          Text(
            user,
            style: const TextStyle(fontSize: 16),
          )
        ],
      ),
    );
  }
}

class HeaderDelegate extends SliverPersistentHeaderDelegate {
  const HeaderDelegate(this.title);

  final String title;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      alignment: Alignment.centerLeft,
      color: const Color(0xffF6F6F6),
      padding: const EdgeInsets.only(left: 20),
      height: 40,
      child: Text(title)
    );
  }

  @override
  double get maxExtent => minExtent;

  @override
  double get minExtent => 40;

  @override
  bool shouldRebuild(covariant HeaderDelegate oldDelegate) {
    return title!=oldDelegate.title;
  }

}

class ItemData {
  final String groupName;
  final List<String> users;

  ItemData({required this.groupName, this.users = const []});

  static List<ItemData> get testData => [
    ItemData(groupName: '幻将术士', users: ['梦小梦', '梦千']),
    ItemData(groupName: '幻将剑客', users: ['捷特', '龙少', '莫向阳', '何解连', '浪封', '梦飞烟']),
    ItemData(groupName: '幻将弓者', users: ['巫缨', '巫妻孋', '摄王', '裔王', '梦童']),
    ItemData(groupName: '其他', users: List.generate(20, (index) => '小兵$index')),
  ];
}