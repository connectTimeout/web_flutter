import 'package:flutter/material.dart';

BorderSide borderSide = const BorderSide(color: Colors.yellow, width: 3.0);

class BorderCell extends StatelessWidget {
  const BorderCell({
    super.key,
    required this.child,
    this.top,
    this.right,
    this.bottom,
    this.left,
  });
  final Widget child;
  final BorderSide? top;
  final BorderSide? right;
  final BorderSide? bottom;
  final BorderSide? left;
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border(
          top: top ?? borderSide,
          right: right ?? borderSide,
          bottom: bottom ?? borderSide,
          left: left ?? borderSide,
        ),
      ),
      child: child,
    );
  }
}
