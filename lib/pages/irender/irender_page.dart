import 'package:flutter/material.dart';
import 'package:flutter_booklet/pages/anim/10_ticker/ticker_page.dart';
import 'package:flutter_booklet/widgets/dao_button.dart';

class IRenderPage extends StatelessWidget {
  const IRenderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('渲染机制'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Center(
          child: Wrap(
            direction: Axis.horizontal,
            alignment: WrapAlignment.center,
            spacing: 10,
            runSpacing: 8,
            children:  [
              ItemBtn(
                btnName: 'Ticker', 
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const TickerPage()));
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}

