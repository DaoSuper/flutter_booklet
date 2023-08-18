import 'package:flutter/material.dart';

//对 Sliver 进行装饰
class DecoratedSliverExample extends StatelessWidget {
  const DecoratedSliverExample({super.key});

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(title: Text('DecoratedSliver')),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            sliver: DecoratedSliver(
             decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                      color: Color(0xFF111133),
                      blurRadius: 2,
                      offset: Offset(-2, -1))
                ],
                gradient: LinearGradient(
                  colors: const <Color>[
                    Color(0xFFEEEEEE),
                    Color(0xFF111133),
                  ],
                  stops: const <double>[0.1, 1.0],
                ),
              ),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (_, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        'Flutter-$index',
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      )
                    ),
                  ),
                  childCount: 120
                )
              ),
            ),
          )
        ]
      ),
    );
  }
}