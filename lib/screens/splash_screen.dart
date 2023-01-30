import 'package:flutter/material.dart';
import 'package:todo/style.dart';

class SplashScreen extends StatelessWidget {
  final String status;
  const SplashScreen({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
          child: Text(
        status,
        style: subTitle1,
      )),
    );
  }
}
