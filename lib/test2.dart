import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Image> images = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            // 画像をボタンとして表示
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('タイトル'),
                      content: Column(
                        children: <Widget>[
                          // ウィンドウ内に画像を追加
                          ListView.builder(
                            itemCount: images.length,
                            itemBuilder: (context, index) {
                              return images[index];
                            },
                          ),
                          // 画像追加ボタン
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                images.add(Image.asset('assets/image.png'));
                              });
                            },
                            child: Text('画像を追加'),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: Image.asset('assets/image.png'),
            ),
          ],
        ),
      ),
    );
  }
}
