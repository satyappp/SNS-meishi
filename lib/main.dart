import 'package:flutter/material.dart';
import 'package:flutter_practice/SNSInfo.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'function/global.dart';
import 'pages/SplashScreen.dart';
Future<void> main() async {
  Hive.registerAdapter(SNSInfoAdapter());
  await Hive.initFlutter();
  await initGlobalBox(); 
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      title: 'SNS MEISHI',
      debugShowCheckedModeBanner: false,
      
      theme: ThemeData(
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          sizeConstraints: BoxConstraints.tightFor(
            width: 90.0,
            height: 90.0,
          ),
        ),
        colorScheme: const ColorScheme(
          primary: Color(0xFF613EEA),
          secondary: Color(0xFF613EEA),
          surface: Color.fromARGB(255, 30, 30, 30),
          background: Color.fromARGB(255, 255, 255, 255),
          error: Color(0xFFB00020),
          onPrimary: Color(0xFF613EEA),
          onSecondary: Color(0xFF000000),
          onSurface: Color.fromARGB(255, 0, 0, 0),
          onBackground: Color(0xFFFFFFFF),
          onError: Color.fromARGB(223, 0, 0, 0),
          brightness: Brightness.dark,
      )),
      home: const SplashScreen(),
    );
  }
}
