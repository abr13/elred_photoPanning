import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'global_const.dart';

class GlobalHandler {
  static Future setPhotoScale(double scale) async {
    await SharedPreferences.getInstance().then((prefs) {
      prefs.setDouble("photo_scale", scale);
    });
  }

  static Future setPhotoPosition(Offset offset) async {
    String resultOffset =
        offset.toString().replaceAll(RegExp(r'Offset|\(|\)|\s'), '');
    await SharedPreferences.getInstance().then((prefs) {
      prefs.setString("photo_offset", resultOffset);
    });
  }

  static Future<double?> getPhotoScale() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var scale = prefs.getDouble("photo_scale");
    return scale;
  }

  static Future<String?> getPhotoOffset() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var offset = prefs.getString("photo_offset");
    return offset;
  }

  static Future<Map<String, String>?> getHeaders() async {
    return {
      "Accept": "application/json",
      'Authorization': token ?? "",
      'Content-Type': 'application/x-www-form-urlencoded'
    };
  }

  static Future<http.Response> requestPost(String path, Object? body) async {
    var headers = await getHeaders();

    var response = await http.post(
      Uri.parse(baseUrl + path),
      body: body,
      headers: headers,
    );

    return response;
  }

  static void showSnackbar(BuildContext context, String message, bool isError) {
    final snackBar = SnackBar(
      content: Text(
        message.toUpperCase(),
        style: const TextStyle(
          color: whiteColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor:
          isError ? redColor.withOpacity(0.9) : greenColor.withOpacity(0.9),
      duration: const Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static void showActionSnackbar(
    BuildContext context,
    String message,
    String actionLabel,
    VoidCallback onPressedAction,
  ) {
    final snackBar = SnackBar(
      content: Text(
        message.toUpperCase(),
        style: const TextStyle(
          color: whiteColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: greenColor.withOpacity(0.9),
      duration: const Duration(seconds: 2),
      action: SnackBarAction(
        backgroundColor: whiteColor,
        label: actionLabel,
        textColor: greenColor,
        onPressed: onPressedAction,
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static void navigatorPush(BuildContext context, Widget child) {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return child;
      },
    ));
  }

  static void navigatorPushReplacement(BuildContext context, Widget child) {
    Navigator.of(context).popUntil((route) => route.isCurrent);
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) {
        return child;
      },
    ));
  }

  static back(BuildContext context) {
    Navigator.pop(context);
  }
}
