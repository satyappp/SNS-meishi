// global.dart
import 'package:hive/hive.dart';

Box? globalBox;

Future<void> initGlobalBox() async {
  globalBox = await Hive.openBox('libarybox');
}
