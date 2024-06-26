import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:qr_flutter/qr_flutter.dart';
import 'global.dart';

class showElements extends StatefulWidget {
  final Function refreshHomePage;
  List globalBox_keys_list = globalBox!.keys.toList();
  showElements({Key? key, required this.refreshHomePage}) : super(key: key);
  @override
  _showElementsState createState() => _showElementsState();
}

class _showElementsState extends State<showElements> {
  //  constructor

  _imageMatchingWith(String snsName, String iconType) {
    String assetPath = "assets/Icon-$snsName.png";
    if (iconType != "Other") {
      return Image.asset(
        assetPath,
        width: 150,
        height: 150,
        fit: BoxFit.fill,
      );
    } else {
      return Image.asset(
        "assets/Add-Button.png",
        width: 150,
        height: 150,
        fit: BoxFit.fill,
      );
    }
  }

  _QRcodeImage(String snsURL) {
    return QrImageView(
      data: snsURL,
      size: 280,
      // You can include embeddedImageStyle Property if you
      //wanna embed an image from your Asset folder
      embeddedImageStyle: QrEmbeddedImageStyle(
        size: const Size(50, 50),
      ),
    );
  }

  _showQRcode(context, String snsURL) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12.0))),
              backgroundColor: Colors.white,
              surfaceTintColor: Colors.white,
              child: Container(child: _QRcodeImage(snsURL)));
        });
  }

  Future<void> _showDeleteConfirmation(
      BuildContext context, int box_key, data) async {
    final urlController = TextEditingController(text: data.url);
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete this item?'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 10),
                Text(
                  'Change your SNS URL',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: MediaQuery.of(context).size.width * 0.04,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 5),
                TextField(
                  controller: urlController,
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
                      labelStyle:
                          TextStyle(color: Color.fromARGB(167, 0, 0, 0)),
                      floatingLabelBehavior: FloatingLabelBehavior.never),
                ),
                // const SizedBox(height: 10),
                // const Text('This will remove the item permanently.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Delete'),
              onPressed: () async {
                await globalBox!.delete(box_key);
                widget.refreshHomePage();
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Change'),
              onPressed: () async {
                String updatedUrl = urlController.text;
                if (globalBox!.get(box_key) != null) {
                  data.url = updatedUrl;
                  await globalBox!.put(box_key, data);
                }
                widget.refreshHomePage();
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
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 0,
        mainAxisSpacing: 20,
        crossAxisCount: 2,
      ),
      itemCount: widget.globalBox_keys_list.length,
      itemBuilder: (context, int index) {
        final box_key = widget.globalBox_keys_list[index];
        final data = globalBox!.get(box_key);
        String snsName = data.name;
        String snsURL = data.url;
        String iconType = data.iconType;
        String icon = data.icon;
        return GestureDetector(
            onTap: () async {
              print("You tapped");
              await _showQRcode(context, snsURL);
            },
            onLongPress: () => _showDeleteConfirmation(context, box_key, data),
            child: Container(
                child: Column(
              // mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  child: _imageMatchingWith(snsName, iconType),
                ),
                Flexible(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.white.withOpacity(0.3),
                          padding: const EdgeInsets.all(0),
                          child: Text(
                            data.name,
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                // Spacer()
              ],
            )));
      },
    );
  }
}
