import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final Widget child;
  final Function()? action;
  final Color? color;
  const ActionButton({
    super.key,
    required this.child,
    this.action,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return buildButton();
  }

  Widget buildButton() {
    return SizedBox(
      width: 220,
      child: ElevatedButton(
        onPressed: () {
          if (action != null) {
            action!();
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 0.5, color: Color(0xffc6c0a9)),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: child,
        ),
      ),
    );
  }
}
