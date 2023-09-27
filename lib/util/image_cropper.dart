import 'package:elred/global/global_handler.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';

import '../view/screen2.dart';

class ImageUtil {
  static Future<void> cropAndNavigateToPreviewScreen(
      context, String imagePath) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: imagePath,
      aspectRatioPresets: [
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Edit Photo',
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
      ],
    );

    if (croppedFile != null) {
      GlobalHandler.navigatorPush(
          context, ImagePreviewScreen(imagePath: croppedFile.path));
    }
  }
}
