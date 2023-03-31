import 'package:flutter/material.dart';

class ColorProviderDemo extends StatefulWidget {
  const ColorProviderDemo({Key? key}) : super(key: key);

  @override
  State<ColorProviderDemo> createState() => _ColorProviderDemoState();
}

class _ColorProviderDemoState extends State<ColorProviderDemo> {
  bool _red = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: toggle,
        child: const Icon(Icons.refresh),
      ),
      body: Center(
          child: ColorProvider(
        color: _red ? Colors.red : Colors.blue,
        child: const StfA(),
      )),
    );
  }

  void toggle() {
    setState(() {
      _red = !_red;
    });
  }
}

class StfA extends StatefulWidget {
  const StfA({Key? key}) : super(key: key);

  @override
  State<StfA> createState() => _StfAState();
}

//    Color? color =  ColorProvider.maybeOf(context);
//     print(color);
class _StfAState extends State<StfA> {
  @override
  void initState() {
    super.initState();

  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Color? color = ColorProvider.maybeOf(context);
    print(color);
    print('========didChangeDependencies===========');
  }

  @override
  Widget build(BuildContext context) {
    Color? color = ColorProvider.maybeOf(context);
    print('========build===========');
    return Container(
      width: 200,
      height: 200,
      color: color,
    );
  }
}

class ColorProvider extends InheritedWidget {

  const ColorProvider({
    Key? key,
    required this.color,
    required Widget child,
  }) : super(key: key, child: child);

  final Color color;

  static Color? maybeOf(BuildContext context) {
    final ColorProvider? widget = context.dependOnInheritedWidgetOfExactType<ColorProvider>();
    return widget?.color;
  }

  @override
  bool updateShouldNotify(ColorProvider oldWidget) => color != oldWidget.color;
}