
import 'package:flutter/material.dart';

class AttrAlueDuration extends StatefulWidget {
  const AttrAlueDuration({super.key});

  @override
  State<AttrAlueDuration> createState() => _AttrAlueDurationState();
}

//时长 duration 和初始值 value
class _AttrAlueDurationState extends State<AttrAlueDuration>  with TickerProviderStateMixin {
  late AnimationController _controller;
  final Duration _duration = const Duration(milliseconds: 1000);

  double get radius => 80 * _controller.value;

  late AnimationController _boundController;

  double get boundRdius => _boundController.value;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this, 
      duration: _duration,
      // lowerBound: 32,
      // upperBound: 80,
      value: 0.4
    );
    _boundController = AnimationController(
      vsync: this, 
      duration: _duration,
      lowerBound: 32,
      upperBound: 80,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _boundController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
             GestureDetector(
              onTap: () {
                _controller.forward();
              },
              child: AnimatedBuilder(
                animation: _controller,
                builder: (_, __) {
                  return Container(
                    width: radius * 2,
                    height: radius * 2,
                    decoration: const BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
                  );
                },
              ),
            ),
            const Text('时长 duration 和初始值 value'),
            GestureDetector(
              onTap: () {
                _boundController.forward();
              },
              child: AnimatedBuilder(
                animation: _boundController,
                builder: (_, __) {
                  return Container(
                    width: boundRdius * 2,
                    height: boundRdius * 2,
                    decoration: const BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
                  );
                },
              ),
            ),
            const Text('动画上下界 lowerBound 和 upperBound')
          ],
        )
      ),
    );
  }
}
