

import 'package:flutter/material.dart';

class ExamplePage extends StatefulWidget {
  const ExamplePage({super.key});

  @override
  State<ExamplePage> createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  Offset _dragGesturePosition = Offset.zero;
  bool _show = false;
  final Size magnifierSize = Size(30, 30);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('事例效果'),
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            GestureDetector(
              onPanDown: (DragDownDetails details) {
                _dragGesturePosition = details.localPosition-Offset(magnifierSize.width/2,magnifierSize.height/2);
                _show = true;
                setState(() { });
              },
              onPanEnd: (DragEndDetails details){
                setState(() => _show = false);
              },
              onPanUpdate: (details) {
                _dragGesturePosition = details.localPosition-Offset(magnifierSize.width/2,magnifierSize.height/2);
                setState(() {
                });
              },
              onPanCancel: () {
                setState(() => _show = false);
              },
              child: Image.asset('assets/images/blr.jpeg'),
            ),
            if(_show)Positioned(
              left: _dragGesturePosition.dx,
              top: _dragGesturePosition.dy,
              child: _buildMagnifier(),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildMagnifier() {
    return RawMagnifier(
      size: magnifierSize,
      decoration: MagnifierDecoration(
        shape: CircleBorder(
          side: BorderSide(color: Colors.blue, width: 2),
        ),
      ),
      magnificationScale: 3,
    );
  }
}