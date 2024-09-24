import 'package:e_commerce/consts/consts.dart';
import 'package:e_commerce/views/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //MaterialApp thành GetMaterialApp vì có getX ở Splash screen nhó~ UwU
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: appname,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.red,
        appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent),
        fontFamily: regular,
      ),
      home: const SplashScreen(),
    );
  }
}

