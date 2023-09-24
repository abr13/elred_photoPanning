import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback onTapLeading;
  final IconData leadingIcon;
  final Color titleColor;
  final Color backgroundColor;

  const CustomAppBar({
    Key? key,
    required this.title,
    required this.onTapLeading,
    this.leadingIcon = Icons.arrow_back_ios_new,
    this.titleColor = Colors.black,
    this.backgroundColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: GestureDetector(
        onTap: onTapLeading,
        child: Icon(
          leadingIcon,
          color: titleColor,
        ),
      ),
      elevation: 0,
      title: Text(
        title,
        style: TextStyle(color: titleColor),
      ),
      backgroundColor: backgroundColor,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
