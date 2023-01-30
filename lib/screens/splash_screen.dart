import 'package:flutter/material.dart';
import 'package:todo/style.dart';

class SplashScreen extends StatelessWidget {
  final String status;
  const SplashScreen({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              // Space at top
              Flexible(flex: 4, child: Container()),

              // Logo and status
              Flexible(
                child: Column(
                  children: [
                    SizedBox(width: 150, child: Image.asset("lib/assets/logo/ostad.png")),
                    const SizedBox(height: padding),
                    Text(status, style: subTitle1),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
