import 'package:flutter/material.dart';

// Container/Background Style
const MaterialColor primarySwatch = Colors.green;
const double defaultBoxHeight = 40;
const double padding = 16;

const List<BoxShadow> shadow = [
  BoxShadow(
    color: Colors.black26,
    blurStyle: BlurStyle.inner,
    blurRadius: 0.5,
    offset: Offset(0, 2),
  ),
];

// Text Styles
const Color textColor = Colors.white;

const TextStyle title = TextStyle(
  color: textColor,
  fontSize: 24,
  fontWeight: FontWeight.bold,
);

const TextStyle head1 = TextStyle(
  color: textColor,
  fontSize: 16,
  fontWeight: FontWeight.bold,
  shadows: shadow,
);

TextStyle subTitle1 = TextStyle(
  color: textColor.withOpacity(0.8),
  fontSize: 10,
  fontWeight: FontWeight.bold,
);

// Button Style
const double iconSize = 16;

// Animation Duration
const Duration duration = Duration(milliseconds: 100);
