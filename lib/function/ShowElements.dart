import 'package:flutter/material.dart';
import 'ShowQRcode.dart';
import 'dart:ui';
import 'package:qr_flutter/qr_flutter.dart';
import 'global.dart';
import 'GenerateQRcode.dart';

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
      return img != null 
            ? Image.file(
                img!,
                width: 150,
                height: 150,
                fit: BoxFit.fill,
            )
            : Image.asset(
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
        crossAxisSpacing: 0,
        mainAxisSpacing: 20,
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
