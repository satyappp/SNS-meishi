import 'package:flutter/material.dart';
import 'pages/HomePage.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      title: 'SNS Meishi',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: const ColorScheme(
        primary: Color.fromARGB(255, 159, 71, 71),
        secondary: Color(0xFF613EEA),
        surface: Color.fromARGB(255, 181, 141, 141),
        background: Colors.transparent,
        error: Color(0xFFB00020),
        onPrimary: Color(0xFF613EEA),
        onSecondary: Color(0xFF000000),
        onSurface: Color(0xFF000000),
        onBackground: Color(0xFFFFFFFF),
        onError: Color.fromARGB(223, 0, 0, 0),
        brightness: Brightness.dark,
      )),
      home: const MyHomePage(title: 'SNS Meishi'),
    );
  }
}
