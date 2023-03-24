

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class TickerPage extends StatefulWidget {
  const TickerPage({super.key});

  @override
  State<TickerPage> createState() => _TickerPageState();
}

class _TickerPageState extends State<TickerPage> {
  late Ticker _ticker;

  @override
  void initState() {
    _ticker = Ticker(_tick);
    super.initState();
  }

  void _tick(Duration elapsed) {
    debugPrint('----elapsed:$elapsed---------------');
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: GestureDetector(
          onTap: _startTicker,
          child: Container(
            width: 60,
            height: 60,
            color: Colors.green,
          )
        ),
      ),
    );
  }

  void _startTicker() {
   if(_ticker.isTicking){
     _ticker.stop();
   }else{
     _ticker.start();
   }
  }
}