import 'package:flutter/material.dart';
import 'package:flutter_booklet/pages/anim/anim_page.dart';
import 'package:flutter_booklet/pages/irender/irender_page.dart';
import 'package:flutter_booklet/pages/miscellaneous/miscellaneous_page.dart';

class AppPage extends StatefulWidget {
  const AppPage({ Key? key }) : super(key: key);

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage>{

  final PageController controller = PageController();
  final List<Map<String, dynamic>> navigations = [
    {'name': '渲染机制', "icon": Icons.motion_photos_paused,},
    {'name': '动画探索', "icon": Icons.flutter_dash,},
    {'name': '杂记', "icon": Icons.menu_book,},
    // {'name': '手势', "icon": Icons.gesture,},
    // {'name': '滑动', "icon": Icons.toll_outlined,},
  ];
  int currentIndex = 0;

  @override
  void dispose() {
    controller.dispose(); //释放控制器
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        onPageChanged: (index) {
          setState(() {
            currentIndex = controller.page!.round();
          });
        },
        children: const [
          IRenderPage(),
          AnimPage(),
          MiscellaneousPage()
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.horizontal(left: Radius.circular(20))
          ),
          child: Flex(
            direction: Axis.horizontal,
            children: navigations.asMap().keys.map((index) => _bottomAppBarItem(index)).toList()
          ),
        ),
      ),
    );
  }

  Widget _bottomAppBarItem(int index){
    Map<String, dynamic> item = navigations[index];
    Color color = Colors.blue.shade600;
    double fontSize = 14;
    if(currentIndex == index){
      color = Colors.red.shade600; 
      fontSize = 15;
    }
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: (){
          controller.animateToPage(
            index,
            duration: const Duration(milliseconds: 200),
            curve: Curves.ease,
          );
        },
        child: Container(
          margin: const EdgeInsets.only(top: 8),
          height: 48,
          child: Column(
            children: [
              Icon(
                item['icon'],
                size: 24,
                color: color,
              ),
              Text(item['name'], style: TextStyle(color: color, fontSize: fontSize),)
            ],
          ),
        )
      )
    );
  }
}