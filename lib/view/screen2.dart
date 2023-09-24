import 'dart:io';

import 'package:elred/global/global_handler.dart';
import 'package:elred/query/post_card_api.dart';
import 'package:elred/view/screen3.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../global/global_const.dart';
import '../widget/custom_appbar.dart';
import '../widget/custom_button.dart';

class ImagePreviewScreen extends StatefulWidget {
  final String imagePath;

  const ImagePreviewScreen({Key? key, required this.imagePath})
      : super(key: key);

  @override
  _ImagePreviewScreenState createState() => _ImagePreviewScreenState();
}

class _ImagePreviewScreenState extends State<ImagePreviewScreen> {
  void uploadImage() async {
    context.loaderOverlay.show();
    var res = await uploadToServer(File(widget.imagePath));
    context.loaderOverlay.hide();

    if (res != null) {
      if (res.success!) {
        GlobalHandler.showSnackbar(context, res.message!, false);
        GlobalHandler.navigatorPush(
          context,
          const CardViewScreen(),
        );
      } else {
        GlobalHandler.showSnackbar(context, res.message!, true);
      }
    } else {
      GlobalHandler.showSnackbar(
          context, 'An error occurred during file upload.', true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Upload Profile',
        onTapLeading: () {
          GlobalHandler.back(context);
        },
      ),
      body: Container(
        color: whiteColor,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(20.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.file(
                    File(widget.imagePath),
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const Text(
              "Picture ready to be saved",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 50),
            CustomButton(
              onTap: () async {
                uploadImage();
              },
              buttonText: "Save & Continue",
              isOutlined: false,
            ),
          ],
        ),
      ),
    );
  }
}
