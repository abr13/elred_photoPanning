import 'dart:io';

import 'package:flutter/material.dart';

import '../query/model/post_card_model.dart';
import '../query/post_card_api.dart';

class ImagePreviewViewModel extends ChangeNotifier {
  Future<ImageUploadResponse?> uploadImage(File imageFile) async {
    try {
      final response = await uploadToServer(imageFile);
      return response;
    } catch (error) {
      print('Error uploading image: $error');
      return null;
    }
  }
}
