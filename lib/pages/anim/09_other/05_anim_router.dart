import 'package:flutter/material.dart';

class GreenPage extends StatelessWidget {
  const GreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: const Text('GreenPage'),
        actions: [
          IconButton(
            onPressed: () => _toRed(context),
            icon: const Icon(Icons.navigate_next),
          )
        ],
      ),
    );
  }

  void _toRed(BuildContext context) {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (ctx, a1, a2) => const RedPage(),
        transitionDuration: const Duration(milliseconds: 1000),
        reverseTransitionDuration: const Duration(milliseconds: 1000),
        transitionsBuilder: _buildTransitions
      ),
    );
  }

  Widget _buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(1.0, 0),
        end: Offset.zero
      ).animate(animation),
      child: FadeTransition(
        opacity: Tween<double>(
          begin: 0.5,
          end: 1.0
        ).animate(animation),
        child: child,
      ),
    );
  }
}

class RedPage extends StatelessWidget {
  const RedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: const Text('RedPage'),
      ),
    );
  }
}