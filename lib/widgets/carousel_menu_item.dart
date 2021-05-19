import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CarouselMenuItem extends StatefulWidget {
  final int index;
  final bool isCenter;

  const CarouselMenuItem({
    Key? key,
    required this.index,
    required this.isCenter,
  }) : super(key: key);

  @override
  _CarouselMenuItemState createState() => _CarouselMenuItemState();
}

class _CarouselMenuItemState extends State<CarouselMenuItem> {
  final key = GlobalKey();
  double paddingBottom = 0, paddingTop = 0;

  void setItemPadding() {
    if (!mounted) return;
    var screenWidth = MediaQuery.of(context).size.width;

    if (key.currentContext?.findRenderObject() == null) return;
    final renderBox = (key.currentContext?.findRenderObject() as RenderBox);
    final post = renderBox.localToGlobal(Offset.zero);
    var dx = post.dx + renderBox.size.width / 2;
    if (dx < 0 || dx > screenWidth) return;
    if (dx > screenWidth) return;
    if (dx > screenWidth / 2) {
      dx = screenWidth - dx;
    }
    setState(() {
      paddingBottom = dx;
    });
  }

  @override
  Widget build(BuildContext context) {
    setItemPadding();
    return Container(
      padding: EdgeInsets.only(bottom: paddingBottom),
      child: Container(
        key: key,
        width: widget.isCenter ? 100 : 80.0,
        height: widget.isCenter ? 100 : 80.0,
        decoration: BoxDecoration(
          color: widget.isCenter ? Colors.amber : Colors.red,
          shape: BoxShape.circle,
        ),
        child: Center(child: Text(widget.index.toString())),
      ),
    );
  }
}
