import 'package:flutter/material.dart';
import 'package:todo/style.dart';

class PopupBackground extends StatelessWidget {
  final Widget? child;
  const PopupBackground({
    super.key,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: padding),
        padding: const EdgeInsets.symmetric(horizontal: padding, vertical: padding),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(padding),
          boxShadow: shadow,
        ),
        child: child,
      ),
    );
  }
}