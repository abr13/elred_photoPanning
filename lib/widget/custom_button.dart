import 'package:flutter/material.dart';

import '../global/global_const.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onTap;
  final bool isOutlined;
  final String buttonText;

  const CustomButton({
    Key? key,
    this.onTap,
    this.isOutlined = false,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final buttonTextStyle = TextStyle(
      color: isOutlined ? redColor : whiteColor,
      fontSize: 20.0,
    );

    return Container(
      margin: const EdgeInsets.all(20.0),
      child: isOutlined
          ? OutlinedButton(
              onPressed: onTap,
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: redColor),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              child: buildButtonContent(buttonText, buttonTextStyle),
            )
          : ElevatedButton(
              onPressed: onTap,
              style: ElevatedButton.styleFrom(
                backgroundColor: redColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              child: buildButtonContent(buttonText, buttonTextStyle),
            ),
    );
  }

  Widget buildButtonContent(String text, TextStyle textStyle) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Center(
        child: Text(
          text,
          style: textStyle,
        ),
      ),
    );
  }
}
