import 'package:quran_app/home.dart';
import 'package:quran_app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:quran_app/constant.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialization(null);
  runApp(const MyApp());
}

Future initialization(BuildContext? context) async {
  // await Future.delayed(const Duration(seconds: 3));
  FlutterNativeSplash.remove();
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await readJson();
      await getSettings();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quran',
      theme: ThemeApp.Theme_App,
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        centered: true,
        duration: 2500,
        splashIconSize: 300,
        curve: Curves.easeInQuad,
        nextScreen: const Home(),
        splash: 'assets/logo_drawer.png',
        backgroundColor: Color.fromRGBO(6, 87, 96, 1),
        splashTransition: SplashTransition.fadeTransition,
        animationDuration: const Duration(milliseconds: 3000),
      ),
    );
  }
}
