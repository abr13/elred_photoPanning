import 'package:flutter/material.dart';

class UserProfileInfo extends StatelessWidget {
  final String imagePath;
  final String name;
  final String designation;
  final String location;

  const UserProfileInfo({
    Key? key,
    required this.imagePath,
    required this.name,
    required this.designation,
    required this.location,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.white,
              width: 3,
            ),
          ),
          child: CircleAvatar(
            backgroundImage: AssetImage(imagePath),
            radius: 60,
          ),
        ),
        SizedBox(height: 20),
        Text(
          name,
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 10),
        Text(
          designation,
          style: TextStyle(
            fontSize: 22,
            color: Colors.white,
          ),
        ),
        Text(
          location,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
