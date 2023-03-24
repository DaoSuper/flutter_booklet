
import 'package:flutter/material.dart';
import 'package:flutter_booklet/pages/anim/05_simple/02_toggle_rotate.dart';
import 'package:flutter_booklet/pages/anim/05_simple/03_burst_menu.dart';

class SimplePage extends StatefulWidget {
  const SimplePage({super.key});

  @override
  State<SimplePage> createState() => _SimplePageState();
}

class _SimplePageState extends State<SimplePage> {
  ValueNotifier<double> angle = ValueNotifier<double>(90);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // const CircleShineImage(image: AssetImage('assets/images/image1.png'),),
            const SizedBox(height: 20,),
            ToggleRotate(
              child: Container(
                width: 60,
                height: 60,
                decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/images/image3.png',), fit: BoxFit.cover),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            const SizedBox(height: 20,),
            SizedBox(
              width: 300,
              child: ValueListenableBuilder(
                valueListenable: angle, 
                builder: (_, value, __){
                  return Wrap(
                    alignment: WrapAlignment.center,
                    children: [
                      Row(
                        children: [
                          Slider(
                            value: value,
                            min: 0,
                            max: 360,
                            onChanged: ((v) => angle.value = v)
                          ),
                          Text('旋转角度：${value.floor()}'),
                        ],
                      ),
                      ToggleRotate(
                      beginAngle: 0,
                      endAngle: value,
                      curve: Curves.ease,
                      child: const Image(
                        width: 60,
                        height: 60,
                        image: AssetImage("assets/images/image4.png")
                      ),
                    )
                    ],
                  );
                }
              ),
            ),
            Container(
              width: 200,
              height: 200,
              alignment: Alignment.center,
              child: IconTheme(
                data: IconTheme.of(context).copyWith(color: Colors.white, size: 18),
                child: BurstMenu(
                  center: _buildMenu(),
                  menus: _buildMenuItems(),
                  burstMenuItemClick: (index) {
                    debugPrint(">>>>>>>>>>>>onTap: $index");
                    if(index != 0) return false;
                    return true;
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _burstAnimItemClick(int index) {
    debugPrint("index:$index");
    if (index == 0) {
      return false;
    }
    return true;
  }

  Widget _buildMenu() {
    return Container(
      width: 36,
      height: 36,
      padding: const EdgeInsets.all(2),
      decoration: const BoxDecoration(
        color: Colors.blue,
        shape: BoxShape.circle,
      ),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.blue,
          shape: BoxShape.circle,
          image: DecorationImage(
              image: AssetImage('assets/images/image4.png')),
        ),
      ),
    );
  }

  // 构建 菜单 item
  List<Widget> _buildMenuItems() => [
    Colors.red,
    Colors.yellow,
    Colors.blue,
    Colors.green,
  ].map((Color color) => Container(
    width: 15.0 * 2,
    height: 15.0 * 2,
    decoration: BoxDecoration(
      color: color,
      borderRadius: const BorderRadius.all(Radius.circular(15.0))
    ),
  )).toList();
}