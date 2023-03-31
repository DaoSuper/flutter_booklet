import 'package:flutter/material.dart';

class ParentDataWidgetDemo extends StatelessWidget {
  const ParentDataWidgetDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Row(
        // textDirection:TextDirection.ltr,
        children: const [
          Flexible(
            child: SizedBox(
              width: 100,
              height: 100,
              child: ColoredBox(
                color: Colors.blue,
              ),
            ),
          ),
          SizedBox(
            width: 100,
            height: 100,
            child: ColoredBox(
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
