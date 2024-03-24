import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:external_app_launcher/external_app_launcher.dart';
import '../function/GenerateQRcode.dart';
import 'package:camera/camera.dart';
import '../function/AddElement.dart';
import '../function/ShowElements.dart';

class MyHomePage extends StatefulWidget {
  //  constructor
  const MyHomePage({super.key, required this.title});
  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _openCamera() async {
    WidgetsFlutterBinding.ensureInitialized();
    final cameras = await availableCameras();
    final firstCamera = cameras.first;
    // var openAppResult = await LaunchApp.openApp(
    //     androidPackageName: 'com.google.android.GoogleCamera',
    //     iosUrlScheme: 'camera://',
    //     appStoreLink: 'itms-apps:/apps.apple.com/jp/app/カメラ/id1584216193',
    //     openStore: false);
    // // ignore: avoid_print
    // print('openAppResult => $openAppResult ${openAppResult.runtimeType}');
    // Enter thr package name of the App you want to open and for iOS add the URLscheme to the Info.plist file.
    // The second arguments decide wether the app redirects PlayStore or AppStore.
    // For testing purpose you can enter com.instagram.android
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double horizontalPadding = screenWidth * 0.05;
    double verticalPadding = screenHeight * 0.05;
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('SNS MEISHI', style: GoogleFonts.kodchasan()),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: screenWidth * 0.057,
          fontWeight: FontWeight.w700,
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(
          top: verticalPadding,
          left: horizontalPadding,
          right: horizontalPadding,
        ),
        child: showElements(
          refreshHomePage: () {
            setState(() {});
          },
        ),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/Home-Screen-bg.png"),
            fit: BoxFit.fill,
          ),
        ),
      ),
      floatingActionButton: Container(
        width: screenWidth * 0.17,
        height: screenWidth * 0.17,
        child: FloatingActionButton(
          elevation: 3,
          shape: CircleBorder(),
          hoverColor: Color.fromARGB(255, 132, 107, 231),
          focusColor: Color.fromARGB(255, 132, 107, 231),
          onPressed: () {
            setState(() {});
          },
          tooltip: 'Home',
          child: const Icon(Icons.home, color: Color(0xFFFFFFFF), size: 35),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            // camera button
            IconButton(
              icon: const Icon(Icons.camera_alt,
                  color: Color(0xFFFFFFFF), size: 30),
              onPressed: _openCamera,
            ),
            IconButton(
              icon:
                  const Icon(Icons.qr_code, color: Color(0xFFFFFFFF), size: 30),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Dialog(
                      shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(12.0))),
                      backgroundColor: Colors.white,
                      surfaceTintColor: Colors.white,
                      child: Container(
                        // padding: const EdgeInsets.all(0),
                        // width: double.infinity,
                        child: GenerateQRCode(
                          refreshHomePage: () {
                            setState(() {});
                          },
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
