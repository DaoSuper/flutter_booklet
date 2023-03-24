import 'package:flutter/material.dart';

class ItemBtn extends StatelessWidget {
  final String btnName;
  final String? routeName;
  final VoidCallback? onPressed;

  const ItemBtn({required this.btnName, this.routeName, this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2 - 20,
      child: ElevatedButton(
          onPressed: onPressed??() => Navigator.pushNamed(context, routeName!),
          child: Text(btnName, textAlign: TextAlign.center,)
      ),
    );
  }
}