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
    this.width = 40,
    this.height = 40,
    this.iconSize = 24,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: greyColor.shade700.withOpacity(0.8),
        borderRadius: BorderRadius.circular(iconSize / 2),
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
