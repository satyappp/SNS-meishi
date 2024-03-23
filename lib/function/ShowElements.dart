import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'global.dart';

class showElements extends StatelessWidget {
  //  constructor
  const showElements({Key? key}) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
      ),
      itemCount: globalBox!.length,
      itemBuilder: (context, int index) {
        final data = globalBox!.get(index);
        String snsName = data.name;
        String snsURL = data.url;
        String iconType = data.iconType;
        String icon = data.icon;
        return GestureDetector(
            onTap: () async {
              print("You tapped");
              await _showQRcode(context, snsURL);
            },
            child: Container(
                child: Column(
              children: [
                SizedBox(
                  child: _imageMatchingWith(snsName, iconType),
                ),
                Text(data.url,
                    style: TextStyle(
                      color: Colors.black,
                    ))
              ],
            )));
      },
    );
  }
}
