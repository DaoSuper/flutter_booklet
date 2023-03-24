
import 'package:flutter/material.dart';
import 'package:flutter_booklet/utils/anim_util.dart';

class FadeAnim extends StatefulWidget {
  const FadeAnim({super.key});

  @override
  State<FadeAnim> createState() => _FadeAnimState();
}

class _FadeAnimState extends State<FadeAnim> with SingleTickerProviderStateMixin{
  var _crossFadeState = CrossFadeState.showFirst;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
          if(_crossFadeState == CrossFadeState.showFirst){
            _crossFadeState = CrossFadeState.showSecond;
          }else{
            _crossFadeState = CrossFadeState.showFirst;
          }
        });
      },
      child: AnimatedCrossFade(
        crossFadeState: _crossFadeState, 
        duration: AnimUtil.druation, 
        firstCurve: Curves.easeInCirc,
        secondCurve: Curves.easeInToLinear,
        firstChild: Container(
          height: 60,
          width: 60,
          color: Colors.grey.withAlpha(22),
          alignment: Alignment.center,
          child: const FlutterLogo(
            size: 40,
          ),
        ), 
        secondChild: Image.asset(
          "assets/images/image1.png",
          height: 100,
          width: 100,
        )
      ),
    );
  }
}