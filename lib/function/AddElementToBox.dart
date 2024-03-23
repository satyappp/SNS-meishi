import 'package:hive/hive.dart';
import '../SNSInfo.dart';
import 'global.dart';

class AddElement {
  void addElementToglobalBox(name, url, icon, iconType) async {
    var Librarydata = SNSInfo(
      icon: icon,
      name: name,
      url: url,
      iconType: iconType,
    );
    var box = Hive.box('libarybox');
    await box.add(Librarydata);
    // database update
    print('Info added to box!');
    if (globalBox != null) {
      _printBoxContents(globalBox!);
    }
  }

  void _printBoxContents(Box box) {
    final keys = box.keys;
    print('Contents of Box:');
    for (var key in keys) {
      var value = box.get(key);
      print('$key: ${value.name}');
    }
  }
}
