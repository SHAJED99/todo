import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/models/data_management.dart';
import 'package:todo/screens/home_page.dart';
import 'package:todo/screens/splash_screen.dart';
import 'package:todo/style.dart';

void main(List<String> args) => runApp(
      GetMaterialApp(
        scrollBehavior: const MaterialScrollBehavior().copyWith(dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
        }),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: primarySwatch),
        home: const MyApp(),
      ),
    );

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLoaded = false;
  bool isShowingSplash = false;
  final DataManagement dataManagement = Get.put(DataManagement());

  // Load data from database
  void loadinData() async {
    WidgetsFlutterBinding.ensureInitialized();
    await dataManagement.init();
    setState(() => isLoaded = true);
  }

  // SplashScreen Load time
  void splashScreenShow() async {
    Future.delayed(const Duration(seconds: 5)).then((value) => setState(() => isShowingSplash = true));
  }

  @override
  void initState() {
    loadinData();
    splashScreenShow();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Showing splash screen at least 5 seconds, while loading data
    if (!isLoaded || !isShowingSplash) return SplashScreen(status: isLoaded ? "Database Loaded" : "Loading Database");
    // Home Page is the screen where all those task will be shown
    return HomePage();
  }
}
