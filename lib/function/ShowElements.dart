import 'package:flutter/material.dart';
import '../SNSInfo.dart';
import 'global.dart';

class showElements extends StatelessWidget {
  //  constructor
  const showElements({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: globalBox!.length,
        itemBuilder: (context, index) {
          final data = globalBox!.get(index);
          return ListTile(
            title: Text(data.name + " " + data.url), // データを表示
          );
        });
  }
}
