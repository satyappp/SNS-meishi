import 'package:flutter/material.dart';
import 'package:external_app_launcher/external_app_launcher.dart';
import 'SettingPage.dart';
import '../function/GenerateQRcode.dart';

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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _openCamera() async {
    var openAppResult = await LaunchApp.openApp(
        androidPackageName: 'com.google.android.GoogleCamera',
        iosUrlScheme: 'camera://',
        appStoreLink: 'itms-apps:/apps.apple.com/jp/app/カメラ/id1584216193',
        openStore: false);
    // ignore: avoid_print
    print('openAppResult => $openAppResult ${openAppResult.runtimeType}');
    // Enter thr package name of the App you want to open and for iOS add the URLscheme to the Info.plist file.
    // The second arguments decide wether the app redirects PlayStore or AppStore.
    // For testing purpose you can enter com.instagram.android
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Container(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/Home-Screen.png"),
            fit: BoxFit.fill,
          ),
        ),
      ),
      // button settings
      /// FloatingActionButtion
      floatingActionButton: SizedBox(
        width: 90,
        height: 90,
        child: FloatingActionButton(
          onPressed: () {
            setState(() {});
          },
          tooltip: 'Increment',
          child: const Icon(Icons.home, color: Color(0xFFFFFFFF), size: 35),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      /// bottomNavigationBar
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(), // 下部ナビゲーションバーの形状を設定
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            // camera button
            IconButton(
              icon: const Icon(Icons.camera_alt,
                  color: Color(0xFFFFFFFF), size: 30),
              onPressed: _openCamera,
            ),
            // settings button
          
            IconButton(
              icon:
                  const Icon(Icons.qr_code, color: Color(0xFFFFFFFF), size: 30),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const GenerateQRCode()), //jump to settingpage
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
