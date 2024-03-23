// import 'package:flutter/material.dart';
// import 'DropdownButton.dart';
import 'package:flutter/material.dart';
import 'DropdownButton.dart'; // Your custom dropdown button implementation
import 'AddElementToBox.dart';
//image picker

// If GenerateQRCode doesn't need to be a StatefulWidget, simplify it to StatelessWidget
class GenerateQRCode extends StatefulWidget {
  GenerateQRCode({Key? key}) : super(key: key);
  @override
  _GenerateQRCodeState createState() => _GenerateQRCodeState();
}

// class GenerateQRCode extends StatelessWidget {
//   GenerateQRCode({Key? key}) : super(key: key);
class _GenerateQRCodeState extends State<GenerateQRCode> {
  final TextEditingController URLcontroller = TextEditingController();
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController etccontroller = TextEditingController();
  String selectedValue = '';
  // Future<void> pickImage() async {
  //   final picker = ImagePicker();
  //   final pickedFile = await picker.pickImage(source: ImageSource.gallery);
  //   if (pickedFile != null) {
  //     setState(() {
  //       img = File(pickedFile.path);
  //     });
  //   }
  // }

  void _showErrorDialog() {
    //error output function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Error"),
          content: Text("error input"),
          actions: [
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // DropdownButtonForSNS _dropdownButtonForSNS =
    //     DropdownButtonForSNS(selectedValue: '');

    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment
              .start, // Aligns children to the start, which is left for a Column
          children: <Widget>[
            Text(
              'Add Link',
              style: TextStyle(
                color: Colors.black, // Assuming you want black text
                fontSize: MediaQuery.of(context).size.width *
                    0.05, // Responsive font size
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 5),
            Text(
              'Add a link to save it as a QR Code.',
              style: TextStyle(
                color: Colors.black.withOpacity(
                    0.6), // Assuming you want slightly dimmed black text for the description
                fontSize: MediaQuery.of(context).size.width *
                    0.035, // Slightly smaller and responsive font size
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'SNS Name*',
              style: TextStyle(
                color: Colors
                    .black, // Assuming you want slightly dimmed black text for the description
                fontSize: MediaQuery.of(context).size.width *
                    0.04, // Slightly smaller and responsive font size
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 5),
            DropdownButtonForSNS(
              //value for choose other or not
              selectedValue: selectedValue,
              onChanged: (newValue) {
                setState(() {
                  selectedValue = newValue ?? '';
                });
              },
            ),
            if (selectedValue == 'Other') ...[
              const SizedBox(height: 10),
              Text(
                'What is your SNS name',
                style: TextStyle(
                  color: Colors
                      .black, // Assuming you want slightly dimmed black text for the description
                  fontSize: MediaQuery.of(context).size.width *
                      0.04, // Slightly smaller and responsive font size
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
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 0.0, horizontal: 10),
                    labelText: 'Enter Here',
                    labelStyle: TextStyle(color: Color.fromARGB(167, 0, 0, 0)),
                    floatingLabelBehavior: FloatingLabelBehavior.never),
              ),
              // const SizedBox(height: 10),
              // Text(
              //   'Upload the SNS icon',
              //   style: TextStyle(
              //     color: Colors
              //         .black, // Assuming you want slightly dimmed black text for the description
              //     fontSize: MediaQuery.of(context).size.width *
              //         0.04, // Slightly smaller and responsive font size
              //     fontWeight: FontWeight.w400,
              //   ),
              // ),
              // FloatingActionButton(
              //   onPressed: pickImage,
              //   tooltip: 'Pick Image From Gallery',
              //   heroTag: 'gallery',
              //   child: const Icon(Icons.add_a_photo),
              // ),
            ],
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
                color: Colors
                    .black, // Assuming you want slightly dimmed black text for the description
                fontSize: MediaQuery.of(context).size.width *
                    0.04, // Slightly smaller and responsive font size
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
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 0.0, horizontal: 10),
                  labelText: 'www.example.com',
                  labelStyle: TextStyle(color: Color.fromARGB(167, 0, 0, 0)),
                  floatingLabelBehavior: FloatingLabelBehavior.never),
            ),
            const SizedBox(height: 15),
            //  when the QR Code button is pressed
            ElevatedButton(
              onPressed: () async {
                if (URLcontroller.text.isNotEmpty && (namecontroller.text.isNotEmpty||selectedValue != 'Other') ){
                  String name = selectedValue;
                  String url = URLcontroller.text;
                  String iconType = selectedValue;
                  // if (selectedValue == 'Other') {
                  //   print("SNS name type is 'Other'");
                  //   name = namecontroller.text;
                  // }
                  AddElement().addElementToglobalBox(name, url, " ", iconType);
                  Navigator.pop(context);
                // } else if (URLcontroller.text.isNotEmpty &&
                //     namecontroller.text.isNotEmpty) {
                //   String name = namecontroller.text;
                //   String url = URLcontroller.text;
                // AddElement().addElementToglobalBox(
                //     name, URLcontroller.text, " ", "");
                } else {
                  _showErrorDialog();
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF613EEA),
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.015),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                minimumSize: Size(
                    double.infinity, MediaQuery.of(context).size.height * 0.03),
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
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.015),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                minimumSize: Size(
                    double.infinity, MediaQuery.of(context).size.height * 0.03),
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
