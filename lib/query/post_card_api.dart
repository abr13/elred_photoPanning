import 'dart:convert';
import 'dart:io';

import 'package:elred/global/global_const.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';

Future<ImageUploadResponse?> uploadToServer(File file) async {
  try {
    // Check file size
    const int maxSize = 10 * 1024 * 1024; // 10MB
    if (file.lengthSync() > maxSize) {
      // File size exceeds the limit
      return ImageUploadResponse(
        success: false,
        message: 'File size exceeds 10MB.',
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
    );
  }
}

class ImageUploadResponse {
  bool? success;
  bool? isAuth;
  String? message;
  List<Result>? result;

  ImageUploadResponse({this.success, this.isAuth, this.message, this.result});

  ImageUploadResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    isAuth = json['isAuth'];
    message = json['message'];
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(new Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['isAuth'] = this.isAuth;
    data['message'] = this.message;
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  String? uid;
  String? profileBannerImageURL;

  Result({this.uid, this.profileBannerImageURL});

  Result.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    profileBannerImageURL = json['profileBannerImageURL'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['profileBannerImageURL'] = this.profileBannerImageURL;
    return data;
  }
}
