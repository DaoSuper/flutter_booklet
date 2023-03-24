
import 'package:flutter/material.dart';
import 'package:flutter_booklet/utils/anim_util.dart';

//AnimatedSwitcher 则是一个组件的动画切换
class SwitcherAnim extends StatefulWidget {
  const SwitcherAnim({super.key});

  @override
  State<SwitcherAnim> createState() => _SwitcherAnimState();
}

class _SwitcherAnimState extends State<SwitcherAnim> {
  int _count = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        _buildBtn(Icons.remove,Colors.red,_doMinus),
        SizedBox(
          width:80,
          child: AnimatedSwitcher(
            duration: AnimUtil.druation,
            transitionBuilder: (child, animation){
              return ScaleTransition(
                scale: animation,
                child: RotationTransition(turns: animation, child: child,),
              );
            },
            child: Text(
              '$_count',
              key: ValueKey<int>(_count),
              style: Theme.of(context).textTheme.displaySmall,
            ),
          )
        ),
        _buildBtn(Icons.add,Colors.blue,_doAdd)
      ],
    );
  }

  void _doMinus() {
    setState(() => _count -= 1);
  }

  void _doAdd() {
    setState(() => _count += 1);
  }

  Widget _buildBtn(IconData icon, Color color, VoidCallback onPressed){
    return MaterialButton(
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      textColor: const Color(0xffFfffff),
      elevation: 3,
      color: color,
      highlightColor: const Color(0xffF88B0A),
      splashColor: Colors.red,
      shape: const CircleBorder(
        side: BorderSide(width: 2.0, color: Color(0xFFFFDFDFDF)),
      ),
      child: Icon(icon, color: Colors.white,),
    );
  }
}