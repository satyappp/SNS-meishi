import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import '../SNSInfo.dart';
import 'package:hive/hive.dart';
import 'global.dart';

//https://note.com/hatchoutschool/n/n071d5d93e948  【Flutter】【Dart】Image Pickerで画像を選択する
class AddElement extends StatefulWidget {
  const AddElement({super.key});

  @override
  AddElementState createState() => AddElementState();
}

class AddElementState extends State<AddElement> {
  TextEditingController icon = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController url = TextEditingController();
  TextEditingController etc = TextEditingController();
  Image? _img;
  XFile? _tmp_img;
  String? _imgPath; //fordebug
  List<String> assetImages = [
    'assets/icon/Icon-discord.png',
    'assets/icon/Icon-facebook.png',
    'assets/icon/Icon-Github.png',
    'assets/icon/Icon-Instagram.png',
    'assets/icon/Icon-linkedin.png',
    'assets/icon/Icon-X.png',
  ];

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _tmp_img = XFile(pickedFile.path);
        _img = Image.file(File(_tmp_img!.path));
      });
    }
  }

  void selectAssetImageFromAssets() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select an image'),
          content: SingleChildScrollView(
            child: Column(
              children: assetImages
                  .map((imagePath) => GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                          setState(() {
                            _imgPath = imagePath; //for debug
                            _img =
                                Image.asset(_imgPath!, width: 100, height: 100);
                          });
                        },
                        child: Image.asset(imagePath, width: 100, height: 100),
                      ))
                  .toList(),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create SNS Library'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 800,
              child: _img == null ? const Text('No image selected.') : _img,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FloatingActionButton(
                onPressed: selectAssetImageFromAssets,
                tooltip: 'Pick Image From Assets',
                heroTag: 'assets',
                child: const Icon(Icons.panorama_wide_angle),
              ),
              FloatingActionButton(
                onPressed: pickImage,
                tooltip: 'Pick Image From Gallery',
                heroTag: 'gallery',
                child: const Icon(Icons.photo_library),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.all(20),
            child: TextField(
              controller: name,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter SNS Name',
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(20),
            child: TextField(
              controller: url,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter SNS URL',
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(20),
            child: TextField(
              controller: etc,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Your Etc Description',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              // TODO: Handle Confirm button press
              // ignore: unused_local_variable
              var Librarydata = SNSInfo(
                icon: icon.text,
                name: name.text,
                url: url.text,
                etc: etc.text,
              );
              var box = Hive.box('libarybox');
              box.add(Librarydata);
              print('Info added to box!');
            },
            child: const Text('Confirm'),
          ),
          ElevatedButton(
              onPressed: () async {
                // TODO: Handle Confirm button press
                // ignore: unused_local_variable
                var box = globalBox;
                if (box != null) {
                  printBoxContents(box);
                }
              },
              child: const Text('check')),
        ],
      ),
    );
  }
}

void printBoxContents(Box box) {
  final keys = box.keys;
  print('Contents of Box:');
  for (var key in keys) {
    var value = box.get(key);
    print('$key: $value');
  }
}
