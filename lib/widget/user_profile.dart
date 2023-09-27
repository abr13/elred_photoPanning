import 'package:elred/global/global_const.dart';
import 'package:flutter/material.dart';

class UserProfileInfo extends StatelessWidget {
  final String imagePath;
  final String fname;
  final String lname;
  final String designation;
  final String location;
  final bool editable;
  final bool showDesignationAndLocation;

  const UserProfileInfo({
    Key? key,
    required this.imagePath,
    required this.fname,
    required this.lname,
    required this.designation,
    required this.location,
    this.editable = false,
    this.showDesignationAndLocation = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
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
            const SizedBox(height: 20),
            Text(
              fname,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              lname,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            showDesignationAndLocation
                ? Column(
                    children: [
                      Text(
                        designation,
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        location,
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )
                : const SizedBox(),
          ],
        ),
        if (editable)
          Positioned(
            bottom: 110,
            right: 10,
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: whiteColor,
                  width: 1,
                ),
              ),
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: blackColor,
                ),
                child: IconButton(
                  icon: const Icon(
                    Icons.edit,
                    color: whiteColor,
                    size: 12,
                  ),
                  onPressed: () {
                    // Add your edit icon onPressed logic here
                  },
                ),
              ),
            ),
          )
        else
          const SizedBox(),
      ],
    );
  }
}
