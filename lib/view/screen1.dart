import 'dart:io';

import 'package:elred/global/global_const.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../util/bottom_sheet.dart';
import '../util/image_cropper.dart';

class ChangeDesignScreen extends StatefulWidget {
  const ChangeDesignScreen({super.key});

  @override
  _ChangeDesignScreenState createState() => _ChangeDesignScreenState();
}

class _ChangeDesignScreenState extends State<ChangeDesignScreen> {
  final ImagePicker _picker = ImagePicker();

  void _showOptionsBottomSheet(context) {
    BottomSheetUtil.showOptionsBottomSheet(context, onPressedCamera: () async {
      // Camera
      final XFile? image = await _picker.pickImage(source: ImageSource.camera);

      if (image != null) {
        ImageUtil.cropAndNavigateToPreviewScreen(
          context,
          File(image.path).path,
        );
      }
    }, onPressedGallery: () async {
      // Gallery
      final XFile? photo = await _picker.pickImage(source: ImageSource.gallery);

      if (photo != null) {
        ImageUtil.cropAndNavigateToPreviewScreen(
            context, File(photo.path).path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Change Design',
          style: TextStyle(color: blackColor),
        ),
        backgroundColor: whiteColor,
      ),
      body: Container(
        color: whiteColor,
        child: GestureDetector(
          onTap: () {
            _showOptionsBottomSheet(context);
          },
          child: Container(
            height: 80,
            margin: const EdgeInsets.all(20.0),
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.25),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Image.asset(
                    "assets/stars.png",
                    height: 20,
                  ),
                  const Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        'Upload Picture',
                        style: TextStyle(
                          color: blueColor,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Transform.rotate(
                    angle: 45,
                    child: Image.asset(
                      "assets/stars.png",
                      height: 15,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
