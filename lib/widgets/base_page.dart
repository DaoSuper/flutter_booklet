
import 'package:flutter/material.dart';
import 'package:flutter_booklet/utils/anim_util.dart';

class BasePage extends StatefulWidget {
  const BasePage({super.key});

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> with SingleTickerProviderStateMixin{

  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: AnimUtil.druation);

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: const EdgeInsets.only(top: 100),
        alignment: Alignment.center,
        child: Column(
          children: [
            
            const SizedBox(height: 32,),
            Wrap(
              spacing: 10,
              children: [
                ElevatedButton(
                  onPressed: (){

                  }, 
                  child: const Text('StartAnim')
                )
              ],
            )
          ],
        )
      ),
    );
  }
}