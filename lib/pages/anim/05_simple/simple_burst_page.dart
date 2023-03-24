
import 'package:flutter/material.dart';
import 'package:flutter_booklet/pages/anim/05_simple/04_burst_anim.dart';

class SimpleBurstPage extends StatefulWidget {
  const SimpleBurstPage({super.key});

  @override
  State<SimpleBurstPage> createState() => _SimpleBurstPageState();
}

class _SimpleBurstPageState extends State<SimpleBurstPage> {
  ValueNotifier<double> angle = ValueNotifier<double>(90);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          Positioned(
            right: 20,
            top: 20,
            child: BurstAnim.topRight(
              curve: Curves.bounceOut,
              radius: 60,
              center: _buildMenu(),
              burstAnimItemClick: _burstAnimItemClick,
              menus: _buildMenuItems(),
            ),
          ),

          Positioned(
            left: 20,
            top: 20,
            child: BurstAnim.topLeft(
              curve: Curves.linearToEaseOut,
              radius: 60,
              center: _buildMenu(),
              burstAnimItemClick: _burstAnimItemClick,
              menus: _buildMenuItems(),
            ),
          ),

          Positioned(
            right: 20,
            bottom: 20,
            child: BurstAnim.bottomRight(
              curve: Curves.decelerate,
              radius: 60,
              center: _buildMenu(),
              burstAnimItemClick: _burstAnimItemClick,
              menus: _buildMenuItems(),
            ),
          ),
          Positioned(
            left: 20,
            bottom: 20,
            child: BurstAnim.bottomLeft(
              curve: Curves.easeOutQuart,
              radius: 60,
              center: _buildMenu(),
              burstAnimItemClick: _burstAnimItemClick,
              menus: _buildMenuItems(),
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width/2-120,
            bottom: 80,
            child: BurstAnim(
              radius: 120,
              burstType: BurstType.halfCircle,
              startAngle: -150,
              swapAngle: 90.0+30,
              center: _buildMenu(),
              burstAnimItemClick: _burstAnimItemClick,
              menus: _buildMenuItems(),
            ),
          ),
        ],
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
            image: AssetImage('assets/images/image4.png'),
            fit: BoxFit.cover
          ),
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