import 'dart:convert';
import 'dart:io';

import 'package:elred/global/global_const.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';

import 'model/post_card_model.dart';

Future<ImageUploadResponse?> uploadToServer(File file) async {
  try {
    // Check file size
    const int maxSize = 10 * 1024 * 1024; // 10MB
    if (file.lengthSync() > maxSize) {
      // File size exceeds the limit
      return ImageUploadResponse(
        success: false,
        message: 'File size exceeds 10MB.',
        isAuth: null,
        result: [],
      );
    }

    // Check file type based on content
    final mimeType = lookupMimeType(file.path);
    if (mimeType == null ||
        (!mimeType.startsWith('image/jpeg') &&
            !mimeType.startsWith('image/png') &&
            !mimeType.startsWith('image/jpg') &&
            !mimeType.startsWith('image/svg'))) {
      // Invalid or unsupported file type
      return ImageUploadResponse(
        success: false,
        message: 'Invalid or unsupported file type.',
        isAuth: null,
        result: [],
      );
    }

    // Continue with the upload if file size and type are valid
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('$baseUrl/postProfileBannerImage'),
    );

    request.files.add(
      await http.MultipartFile.fromPath(
        'profileBannerImageURL',
        file.path,
        contentType: MediaType(mimeType.split("/")[0], mimeType.split("/")[1]),
      ),
    );

    request.headers['Authorization'] = token;
    request.headers['Content-Type'] = 'multipart/form-data';
    http.StreamedResponse response = await request.send();
    var res = await response.stream.bytesToString();
    var js = json.decode(res);

    ImageUploadResponse uploadedImageResponse =
        ImageUploadResponse.fromJson(js);

    return uploadedImageResponse;
  } catch (e) {
    return ImageUploadResponse(
      success: false,
      message: 'An error occurred: $e',
      isAuth: null,
      result: [],
    );
  }
}
