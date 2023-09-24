import 'package:flutter/material.dart';

import '../global/global_const.dart';

class CircularIconButton extends StatelessWidget {
  final IconData iconData;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final double iconSize;

  const CircularIconButton({
    Key? key,
    required this.iconData,
    required this.onPressed,
    this.width = 40, // Default width
    this.height = 40, // Default height
    this.iconSize = 24, // Default icon size
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      width: width,
      // Use the provided width
      height: height,
      // Use the provided height
      decoration: BoxDecoration(
        color: greyColor.withOpacity(0.5),
        borderRadius: BorderRadius.circular(
            iconSize / 2), // Calculate radius based on width
      ),
      child: IconButton(
        icon: Icon(
          iconData,
          color: whiteColor,
          size: iconSize,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
