import 'package:flutter/material.dart';

class FixedImage extends StatefulWidget {
  final Widget child;
  final double top;
  final double left;
  final bool dragable;
  final Function(double x, double y)? onDrag;
  const FixedImage({
    super.key,
    required this.top,
    required this.left,
    required this.child,
    this.dragable = false,
    this.onDrag,
  });

  @override
  State<FixedImage> createState() => _FixedImageState();
}

class _FixedImageState extends State<FixedImage> {
  double top = 0;
  double left = 0;
  double rotate = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    top = widget.top;
    left = widget.left;
  }

  double deltaY = 0;
  double deltaX = 0;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print('${widget.top} - ${widget.left}');
  }
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      child: GestureDetector(
        // onTapDown: widget.dragable
        //     ? (details) {
        //         print('tapdown');
        //         print('${top}, ${left}');
        //         print(
        //             '${details.globalPosition.dy}, ${details.globalPosition.dx}');
        //         deltaY = details.globalPosition.dy - top;
        //         deltaX = details.globalPosition.dx - left;
        //       }
        //     : null,
        onVerticalDragUpdate: widget.dragable
            ? (details) {
                print('onVerticalDragUpdate');
                // print('${details.globalPosition.dy}, ${details.globalPosition.dx}');
                setState(() {
                  top = details.globalPosition.dy - deltaY;
                  left = details.globalPosition.dx - deltaX;
                  onDrag();
                });
              }
            : null,
        onHorizontalDragUpdate: widget.dragable
            ? (details) {
                print('onHorizontalDragUpdate');
                // print('${details.globalPosition.dy}, ${details.globalPosition.dx}');
                setState(() {
                  top = details.globalPosition.dy - deltaY;
                  left = details.globalPosition.dx - deltaX;
                  onDrag();
                });
              }
            : null,
        onVerticalDragStart: widget.dragable
            ? (details) {
                print('onVerticalDragStart');
                print('${top}, ${left}');
                print(
                    '${details.globalPosition.dy}, ${details.globalPosition.dx}');
                deltaY = details.globalPosition.dy - top;
                deltaX = details.globalPosition.dx - left;
              }
            : null,
        onHorizontalDragStart: widget.dragable
            ? (details) {
                print('onHorizontalDragStart');
                print('${top}, ${left}');
                print(
                    '${details.globalPosition.dy}, ${details.globalPosition.dx}');
                deltaY = details.globalPosition.dy - top;
                deltaX = details.globalPosition.dx - left;
              }
            : null,
        // onVerticalDragUpdate: widget.dragable
        //     ? (details) {
        //         print('onVerticalDragUpdate');
        //         // print('${details.globalPosition.dy}, ${details.globalPosition.dx}');
        //         setState(() {
        //           top = details.globalPosition.dy - deltaY;
        //           left = details.globalPosition.dx - deltaX;
        //         });
        //       }
        //     : null,
        // onPanUpdate: (details) {
        //   print('${details.globalPosition.dy}, ${details.globalPosition.dx}');
        //   setState(() {
        //     top = details.globalPosition.dy - deltaY;
        //     left = details.globalPosition.dx - deltaX;
        //   });
        // },
        // onPanEnd: (details) {
        //   print(details.globalPosition);
        // },
        child: Column(
          children: [
            widget.child,
            // widget.dragable
            //     ? Text('${top.toInt()}, ${left.toInt()}')
            //     : Container(),
          ],
        ),
      ),
    );
  }

  onDrag() {
    if (widget.onDrag != null) {
      widget.onDrag!(left, top);
    }
  }
}
