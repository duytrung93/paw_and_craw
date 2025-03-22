import 'package:flutter/material.dart';
import 'package:paw_and_craw/functions/global.dart';

class MainScaffold extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;
  const MainScaffold({super.key, required this.child, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: FittedBox(
                fit: BoxFit.contain,
                alignment: Alignment.center,
                child: Container(
                  width: Global.targetPlatform.width,
                  height: Global.targetPlatform.height,
                  color: Colors.black,
                  child: ClipRRect(
                    child: Scaffold(
                      backgroundColor: backgroundColor ?? Global.mainColor,
                      body: child,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
