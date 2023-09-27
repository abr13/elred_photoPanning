import 'package:flutter/material.dart';

import '../global/global_const.dart';

class BottomSheetUtil {
  static Widget _buildOptionButton({
    required IconData icon,
    required String text,
    required VoidCallback onPressed,
  }) {
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50), // Circular shape
            border: Border.all(
              color: Colors.grey.withOpacity(0.5), // Light gray border
            ),
          ),
          child: IconButton(
            icon: Icon(
              icon,
              color: redColor, // Red icon color
            ),
            onPressed: onPressed,
            tooltip: text,
          ),
        ),
        const SizedBox(height: 8.0), // Add spacing between icon and text
        Text(
          text,
          style: const TextStyle(
            color: Colors.black, // Text color
          ),
        ),
      ],
    );
  }

  static void showOptionsBottomSheet(BuildContext context,
      {required VoidCallback onPressedCamera,
      required VoidCallback onPressedGallery}) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 130,
          color: whiteColor,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    const SizedBox(
                      width: 10,
                    ),
                    _buildOptionButton(
                      icon: Icons.camera_alt_rounded,
                      text: 'Camera',
                      onPressed: onPressedCamera,
                    ),
                    _buildOptionButton(
                      icon: Icons.photo_library,
                      text: 'Gallery',
                      onPressed: onPressedGallery,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
