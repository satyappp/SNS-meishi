import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:external_app_launcher/external_app_launcher.dart';

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
      theme: ThemeData(
          colorScheme: const ColorScheme(
        primary: Color.fromARGB(255, 159, 71, 71),
        secondary: Color(0xFF613EEA),
        surface: Color.fromARGB(255, 181, 141, 141),
        background: Color(0xFF121212),
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

// DropdoenMenuItem
const _SNSitems = [
  DropdownMenuItem(
    value: 'X(Twitter)',
    child: Text('X(Twitter)'),
  ),
  DropdownMenuItem(
    value: 'Instagram',
    child: Text('Instagram'),
  ),
  DropdownMenuItem(
    value: 'Facebook',
    child: Text('Facebook'),
  ),
  DropdownMenuItem(
    value: 'LINE',
    child: Text('LINE'),
  ),
  DropdownMenuItem(
    value: 'WhatApp',
    child: Text('WhatApp'),
  ),
  DropdownMenuItem(
    value: 'Snapchat',
    child: Text('Snapchat'),
  ),
  DropdownMenuItem(
    value: 'KakaoTalk',
    child: Text('KakaoTalk'),
  ),
  DropdownMenuItem(
    value: 'Discord',
    child: Text('Discord'),
  ),
  DropdownMenuItem(
    value: 'TikTok',
    child: Text('TikTok'),
  ),
  DropdownMenuItem(
    value: 'Youtube',
    child: Text('Youtube'),
  ),
  DropdownMenuItem(
    value: 'Twitch',
    child: Text('Twitch'),
  ),
  DropdownMenuItem(
    value: 'Pinterest',
    child: Text('Pinterest'),
  ),
  DropdownMenuItem(
    value: 'GitHub',
    child: Text('GitHub'),
  ),
  DropdownMenuItem(
    value: 'pixiv',
    child: Text('pixiv'),
  ),
  DropdownMenuItem(
    value: 'other1',
    child: Text('other1'),
  ),
  DropdownMenuItem(
    value: 'other2',
    child: Text('other2'),
  ),
];

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  // icon image
  List<Image> images = [];

  String _value = _SNSitems[0].value!;

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

      body: Center(
          child: Column(children: <Widget>[
        GestureDetector(onTap: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  insetPadding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                  content: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 15),
                        child: const Text(
                          'Add Link',
                          style: TextStyle(),
                        ),
                      ),
                      Column(
                        children: [
                          DropdownButton(
                            value: _value,
                            items: _SNSitems,
                            onChanged: (value) {
                              setState(() {
                                _value = value!;
                              });
                            },
                          ),
                          TextField(
                            decoration: InputDecoration(
                                labelText: 'Link*',
                                hintText: 'www.example.com'),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              });
        }),
      ])),

      // 画像をボタンとして表示

      // button settings

      // add Button

      /// FloatingActionButtion
      floatingActionButton: SizedBox(
        width: 60,
        height: 60,
        child: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child:
              const Icon(Icons.qr_code_2, color: Color(0xFFFFFFFF), size: 35),
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
              icon: const Icon(Icons.settings,
                  color: Color(0xFFFFFFFF), size: 30),
              onPressed: () {
                // Add your onPressed functionality here
              },
            ),
          ],
        ),
      ),
    );
  }
}
