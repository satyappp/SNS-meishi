// import 'package:flutter/material.dart';
import 'ShowQRcode.dart';
// import 'DropdownButton.dart';

// //https://medium.com/podiihq/generating-qr-code-in-a-flutter-app-50de15e39830

// class GenerateQRCode extends StatefulWidget {
//   const GenerateQRCode({super.key});

//   @override
//   GenerateQRCodeState createState() => GenerateQRCodeState();
// }

// class GenerateQRCodeState extends State<GenerateQRCode> {
//   TextEditingController URLcontroller = TextEditingController();
//   TextEditingController namecontroller = TextEditingController();
//   TextEditingController etccontroller = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     DropdownButtonForSNS _dropdownButtonForSNS = DropdownButtonForSNS(
//       selectedValue: '',
//     );
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('create SNS LIBRARY'),
//         centerTitle: true,
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Container(
//             margin: const EdgeInsets.all(20),
//             child: _dropdownButtonForSNS,
//             // child: TextField(
//             //   controller: namecontroller,
//             //   decoration: const InputDecoration(
//             //       border: OutlineInputBorder(),
//             //       labelText: 'Enter your SNS NAME'),
//             // ),
//           ),
//           const SizedBox(height: 15),
//           const Text("Others (Name)",
//               style: TextStyle(fontSize: 16)),
//           Container(
//             margin: const EdgeInsets.all(20),
//             child: TextField(
//               controller: namecontroller,
//               decoration: const InputDecoration(
//                   border: OutlineInputBorder(), labelText: 'others'),
//             ),
//           ),
//           Container(
//             margin: const EdgeInsets.all(20),
//             child: TextField(
//               controller: URLcontroller,
//               decoration: const InputDecoration(
//                   border: OutlineInputBorder(),
//                   labelText: 'Enter your SNS URL'),
//             ),
//           ),
//           Container(
//             margin: const EdgeInsets.all(20),
//             child: TextField(
//               controller: etccontroller,
//               decoration: const InputDecoration(
//                   border: OutlineInputBorder(),
//                   labelText: 'Enter your etc description'),
//             ),
//           ),
//           //This button when pressed navigates to QR code generation
//           ElevatedButton(
//               onPressed: () async {
//                 if (_dropdownButtonForSNS.selectedValue == 'others') {
//                   print("SNS name type is 'others'");
//                 }
//                 // ignore: avoid_print
//                 print(_dropdownButtonForSNS.selectedValue); //for debugging
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: ((context) {
//                       return QRImage(URLcontroller);
//                     }),
//                   ),
//                 );
//               },
//               child: const Text('GENERATE QR CODE')),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'DropdownButton.dart'; // Your custom dropdown button implementation

// If GenerateQRCode doesn't need to be a StatefulWidget, simplify it to StatelessWidget
class GenerateQRCode extends StatelessWidget {
  GenerateQRCode({Key? key}) : super(key: key);

  final TextEditingController URLcontroller = TextEditingController();
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController etccontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    DropdownButtonForSNS _dropdownButtonForSNS = DropdownButtonForSNS(selectedValue: '');

    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start, // Aligns children to the start, which is left for a Column
          children: <Widget>[
            Text(
              'Add Link',
              style: TextStyle(
                color: Colors.black, // Assuming you want black text
                fontSize: MediaQuery.of(context).size.width * 0.05, // Responsive font size
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 5),
            Text(
              'Add a link to save it as a QR Code.',
              style: TextStyle(
                color: Colors.black.withOpacity(0.6), // Assuming you want slightly dimmed black text for the description
                fontSize: MediaQuery.of(context).size.width * 0.035, // Slightly smaller and responsive font size
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'SNS Name*',
              style: TextStyle(
                color: Colors.black, // Assuming you want slightly dimmed black text for the description
                fontSize: MediaQuery.of(context).size.width * 0.04, // Slightly smaller and responsive font size
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 5),
            _dropdownButtonForSNS,
            const SizedBox(height: 10),
            Text(
              'Others',
              style: TextStyle(
                color: Colors.black, // Assuming you want slightly dimmed black text for the description
                fontSize: MediaQuery.of(context).size.width * 0.04, // Slightly smaller and responsive font size
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 5),
            TextField(
                controller: namecontroller,
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFCFD4DC)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF613EEA)),
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 10),
                  labelText: 'Enter Here',
                  labelStyle: TextStyle(
                    color: Color.fromARGB(167, 0, 0, 0)
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.never
              ),
            ),
            // if (_dropdownButtonForSNS.selectedValue == 'others') ...[
            //   TextField(
            //     controller: etccontroller,
            //     decoration: const InputDecoration(
            //       border: OutlineInputBorder(),
            //       contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 10),
            //       labelText: 'Others',
            //     ),
            //   ),
            // ],
            const SizedBox(height: 10),
            Text(
              'Link*',
              style: TextStyle(
                color: Colors.black, // Assuming you want slightly dimmed black text for the description
                fontSize: MediaQuery.of(context).size.width * 0.04, // Slightly smaller and responsive font size
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 5),
            TextField(
              controller: URLcontroller,
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFCFD4DC)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF613EEA)),
                  ),
                contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 10),
                labelText: 'www.example.com',
                labelStyle: TextStyle(
                  color: Color.fromARGB(167, 0, 0, 0)
                ),
                floatingLabelBehavior: FloatingLabelBehavior.never
              ),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () async {
                if (_dropdownButtonForSNS.selectedValue == 'others') {
                  print("SNS name type is 'others'");
                }
                print(_dropdownButtonForSNS.selectedValue);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) {
                      return QRImage(URLcontroller);
                    }),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF613EEA), 
                padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.015), 
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                minimumSize: Size(double.infinity, MediaQuery.of(context).size.height * 0.03), 
              ),
              child: FittedBox(
                fit: BoxFit.scaleDown, 
                child: Text(
                  'Confirm',
                  style: TextStyle(
                    color: Colors.white, 
                    fontSize: MediaQuery.of(context).size.width * 0.04, 
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10), 
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); 
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 255, 255, 255), 
                padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.015),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8), 
                ),
                minimumSize: Size(double.infinity, MediaQuery.of(context).size.height * 0.03), 
              ),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  'Cancel',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 52, 64, 84),
                    fontSize: MediaQuery.of(context).size.width * 0.04, 
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
