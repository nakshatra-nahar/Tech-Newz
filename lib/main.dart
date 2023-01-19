import 'package:flutter/material.dart';
import 'package:technewz/pages/home.dart';
import 'utils/colors.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: AppColors.primary
      ),
      home: Home(),
    );
  }
}
