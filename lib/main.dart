import 'package:flutter/material.dart';
import 'package:todo/models/to_do_model.dart';
import 'package:todo/screens/home_page.dart';
import 'package:todo/screens/splash_screen.dart';
import 'package:todo/style.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main(List<String> args) => runApp(
      MaterialApp(
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

  Box? box;

  // Load data from database
  void loadinData() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Future.delayed(const Duration(seconds: 2));
    await Hive.initFlutter();
    Hive.registerAdapter(ToDoModelAdapter());
    box = await Hive.openBox("to_do_list");
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
