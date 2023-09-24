import 'package:elred/global/global_handler.dart';
import 'package:elred/view/screen3.dart';
import 'package:elred/view/screen5.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

import '../global/global_const.dart';
import '../widget/custom_appbar.dart';
import '../widget/custom_button.dart';
import '../widget/user_profile.dart';

class EditCardScreen extends StatefulWidget {
  final String imageDataUrl;

  EditCardScreen({super.key, required this.imageDataUrl});

  @override
  State<EditCardScreen> createState() => _EditCardScreenState();
}

class _EditCardScreenState extends State<EditCardScreen> {
  PhotoViewController photoViewController = PhotoViewController();

  @override
  initState() {
    super.initState();
    _loadPhotoPositionAndScale();
  }

  Future<void> _loadPhotoPositionAndScale() async {
    final scale = await GlobalHandler.getPhotoScale();
    final offset = await GlobalHandler.getPhotoOffset();

    if (scale != null && offset != null) {
      final position = PhotoViewControllerValue(
        rotation: 0.0,
        position: Offset(double.parse(offset.split(',')[0]),
            double.parse(offset.split(',')[1])),
        scale: scale,
        rotationFocusPoint: null,
      );
      photoViewController.value = position;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Custom Image Card',
        onTapLeading: () {
          GlobalHandler.back(context);
        },
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 1.1,
          color: whiteColor,
          child: Column(
            children: <Widget>[
              Expanded(
                child: Stack(
                  children: <Widget>[
                    // Background image
                    Container(
                      margin: const EdgeInsets.all(10.0),
                      padding: const EdgeInsets.all(10.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: PhotoView(
                          initialScale: 1.6,
                          disableGestures: true,
                          controller: photoViewController,
                          imageProvider: NetworkImage(widget.imageDataUrl),
                          backgroundDecoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          heroAttributes: const PhotoViewHeroAttributes(
                              tag: "background_image"),
                        ),
                      ),
                    ),
                    // Profile content
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => CustomizationScreen(
                                        imageData: widget.imageDataUrl,
                                      ),
                                    )).then((result) {
                                  _loadPhotoPositionAndScale();
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.all(4),
                                margin:
                                    const EdgeInsets.only(top: 30, right: 30),
                                decoration: BoxDecoration(
                                  color: whiteColor,
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: const Row(
                                  children: [
                                    Icon(
                                      Icons.edit,
                                      color: redColor,
                                      size: 18,
                                    ),
                                    Text(
                                      "Customize",
                                      style: TextStyle(
                                          color: redColor, fontSize: 16),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                SizedBox(
                                  height: 40,
                                ),
                                UserProfileInfo(
                                  name: "Abdur Rahman",
                                  imagePath: 'assets/profile_image.png',
                                  designation: 'Senior Software Engineer',
                                  location: 'Kolkata, India',
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              CustomButton(
                onTap: () {
                  GlobalHandler.navigatorPushReplacement(
                      context, const CardViewScreen());
                },
                buttonText: "Save",
                isOutlined: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
