import 'package:flutter/material.dart';
import 'package:todo/style.dart';

class CustomIconButton extends StatelessWidget {
  final Function()? onTap;
  final IconData icons;
  const CustomIconButton({
    Key? key,
    this.onTap,
    required this.icons,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      clipBehavior: Clip.antiAlias,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(padding / 2),
            child: Icon(
              icons,
              color: textColor,
              size: iconSize,
            ),
          ),
        ),
      ),
    );
  }
}
