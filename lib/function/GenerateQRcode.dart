import 'package:flutter/material.dart';
import 'ShowQRcode.dart';
import 'DropdownButton.dart';

//https://medium.com/podiihq/generating-qr-code-in-a-flutter-app-50de15e39830

class GenerateQRCode extends StatefulWidget {
  const GenerateQRCode({super.key});

  @override
  GenerateQRCodeState createState() => GenerateQRCodeState();
}

class GenerateQRCodeState extends State<GenerateQRCode> {
  TextEditingController URLcontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController etccontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    DropdownButtonForSNS _dropdownButtonForSNS = DropdownButtonForSNS(
      selectedValue: '',
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('create SNS LIBRARY'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            child: _dropdownButtonForSNS,
            // child: TextField(
            //   controller: namecontroller,
            //   decoration: const InputDecoration(
            //       border: OutlineInputBorder(),
            //       labelText: 'Enter your SNS NAME'),
            // ),
          ),
          Container(
            margin: const EdgeInsets.all(20),
            child: TextField(
              controller: URLcontroller,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter your SNS URL'),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(20),
            child: TextField(
              controller: etccontroller,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter your etc description'),
            ),
          ),
          //This button when pressed navigates to QR code generation
          ElevatedButton(
              onPressed: () async {
                // ignore: avoid_print
                print(_dropdownButtonForSNS.selectedValue); //for debugging
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) {
                      return QRImage(URLcontroller);
                    }),
                  ),
                );
              },
              child: const Text('GENERATE QR CODE')),
        ],
      ),
    );
  }
}
