import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final Widget child;
  final Function()? action;
  final Color? color;
  final Color? backgroundColor;
  final Color? borderColor;
  final double width;
  final EdgeInsets? contentPadding;
  const ActionButton({
    super.key,
    required this.child,
    this.action,
    this.color,
    this.backgroundColor,
    this.borderColor,
    this.width = 220,
    this.contentPadding,
  });

  @override
  Widget build(BuildContext context) {
    return buildButton();
  }

  Widget buildButton() {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        onPressed: () {
          if (action != null) {
            action!();
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? Colors.transparent,
          shadowColor: backgroundColor ?? Colors.transparent,
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: borderColor ?? Color(0xffc6c0a9)),
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        child: Padding(
          padding: contentPadding ?? const EdgeInsets.all(0.0),
          child: child,
        ),
      ),
    );
  }
}
