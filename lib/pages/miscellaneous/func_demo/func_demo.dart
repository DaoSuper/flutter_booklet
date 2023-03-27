import 'package:flutter/material.dart';
import 'package:flutter_booklet/pages/miscellaneous/func_demo/func_widget.dart';

class FuncDemo extends StatefulWidget {
  const FuncDemo({super.key});

  @override
  State<FuncDemo> createState() => _FuncDemoState();
}

class _FuncDemoState extends State<FuncDemo> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("事件节流&防抖"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$count', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            GestureDetector(
              onTap: increase,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                margin: const EdgeInsetsDirectional.only(top: 12, bottom: 12,),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(6)
                ),
                child: const Text("普通"),
              ),
            ),
            FuncWidget(
              onTap: increase,
              type: FuncType.throttle,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                margin: const EdgeInsetsDirectional.only(bottom: 12),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(6)
                ),
                child: const Text("节流"),
              ),
            ),
            FuncWidget(
              type: FuncType.throttleWithTimeout,
              timeout: 1000,
              onTap: increase,
              child: Container(
                margin: const EdgeInsetsDirectional.only(bottom: 12),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(6)
                ),
                child: const Text("指定时间节流"),
              ),
            ),
            FuncWidget(
              type: FuncType.debounce,
              timeout: 1000,
              onTap: increase,
              child: Container(
                margin: const EdgeInsetsDirectional.only(bottom: 12),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(6)
                ),
                child: const Text("防抖"),
              ),
            )
          ],
        )
      ),
    );
  }

  Future increase() async{
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      count += 1; 
    });
  }
    
}