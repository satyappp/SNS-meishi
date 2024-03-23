// global.dart
import 'package:hive/hive.dart';
import 'dart:io';
Box? globalBox;

Future<void> initGlobalBox() async {
  globalBox = await Hive.openBox('libarybox');
}

File? img;