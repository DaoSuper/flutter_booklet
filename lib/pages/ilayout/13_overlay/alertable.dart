
import 'package:flutter/material.dart';

class Alertable extends StatefulWidget {
  final Widget content;
  final Widget alertContent;

  const Alertable({super.key, required this.content, required this.alertContent});

  @override
  State<Alertable> createState() => _AlertableState();
}

class _AlertableState extends State<Alertable> 
    with SingleTickerProviderStateMixin{
  OverlayEntry? _entry;

  static const Duration _fadeInDuration = Duration(milliseconds: 150);
  static const Duration _fadeOutDuration = Duration(milliseconds: 75);
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: _fadeInDuration,
      reverseDuration: _fadeOutDuration
    )..addStatusListener((status) {
      if (status == AnimationStatus.dismissed && _entry != null) {
        removeEntry();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onTapItem(),
      child: widget.content,
    );
  }

  void _onTapItem() {
    _createNewEntry();
    _controller.forward();
  }

  void _createNewEntry() {
    Size targetSize = Size.zero;
    Offset targetOffset = Offset.zero;

    RenderObject? renderObject = context.findRenderObject();

    const double boxWidth = 250;
    const double marginTop = 4;
    final EdgeInsets padding = EdgeInsets.symmetric(horizontal: 8, vertical: 4);

    double spineOffset = (boxWidth - 6) / 2;
    double winWidth = MediaQuery.of(context).size.width;
    // 获取点击目标尺寸、偏移信息
    if(renderObject != null && renderObject is RenderBox) {
      targetSize = renderObject.size;
      Offset offset = Offset(
        targetSize.width / 2 - boxWidth / 2, 
        targetSize.height + marginTop
      );
      Offset topLeftOffset = renderObject.localToGlobal(Offset.zero);

      //校验是否左侧越界
      bool outLeft = topLeftOffset.dx + targetSize.width / 2 < boxWidth / 2;
      bool outRight = topLeftOffset.dx + targetSize.width / 2 + boxWidth / 2 > winWidth;
      if(outLeft) {
        targetOffset = Offset(
          topLeftOffset.dx,
          topLeftOffset.dy + offset.dy
        );
        spineOffset = (targetSize.width - 6) / 2;
      } else if (outRight) {
        targetOffset = Offset(
          topLeftOffset.dx - boxWidth + targetSize.width,
          topLeftOffset.dy + offset.dy,
        );
        spineOffset = boxWidth - (targetSize.width + 6) / 2;
      } else {
        targetOffset = topLeftOffset + offset;
      }
    }

    //获取OverlaState
    final OverlayState overlayState = Overlay.of(context);

    _entry = OverlayEntry(
      builder: (BuildContext context) => FadeTransition(
        opacity: _controller,
        child: Material(
        color: Colors.transparent,
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: hide,
            child: Stack(
              children: [
                Positioned(
                  width: boxWidth,
                  left: targetOffset.dx,
                  top: targetOffset.dy,
                  child: GestureDetector(
                    onTap: hide,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: const Color(0xff95EC69),
                        border: Border.all(color: Colors.black38),
                        borderRadius: BorderRadius.circular(6)
                      ),
                      child: widget.alertContent,
                    ),
                  )
                )
              ],
            ),
          ),
        ),
      )
    );
    overlayState.insert(_entry!);
  }

  void hide() {
    if(_entry != null) {
      _controller.reverse();
    }
  }

  void removeEntry() {
    if(_entry != null) {
      _entry!.remove();
      _entry == null;
    }
  }
}