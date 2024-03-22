import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'HomePage.dart'; 
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(Duration(seconds: 3), () {});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyHomePage(title: 'SNS Meishi')));
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white, // Adjust the background color as needed
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Spacer(),
            Image.asset(
              'assets/Loading-page-logo.png', 
              width: screenSize.width * 0.8,
            ), // Spacing between the image and the text
            Text(
              'SNS MEISHI',
              style: GoogleFonts.kodchasan(
                color: const Color(0xFF613EEA),
                fontSize: MediaQuery.of(context).size.width * 0.07, // Slightly smaller and responsive font size 
                fontWeight: FontWeight.w700,
                // Add other TextStyle properties as needed
              ),
            ),
            Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
