

import 'package:flutter/material.dart';
import 'package:flutter_booklet/pages/anim/06_loading/01_halo_circle.dart';
import 'package:flutter_booklet/pages/anim/06_loading/02_rotate_rect.dart';
import 'package:flutter_booklet/pages/anim/06_loading/03_cross_single.dart';
import 'package:flutter_booklet/pages/anim/06_loading/04_oval_single.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: const [
            HaloCircle(),
            SizedBox(height: 20,),
            RotateRect(),
            SizedBox(height: 20,),
            CrossSingle(),
            SizedBox(height: 20,),
            OvalSingle(),
          ],
        ),
      ),
    );
  }
}