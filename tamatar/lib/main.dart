import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tamatar/Pages/pomo_home.dart';
import 'package:tamatar/Shared/theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      theme: customTheme,
      home: const Scaffold(
        body: Center(
          child: HomeScreen(),
        ),
      ),
    );
  }
}
