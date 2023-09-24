import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:elred/global/global_handler.dart';
import 'package:elred/view/screen4.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:photo_view/photo_view.dart';

import '../global/global_const.dart';
import '../query/post_card_api.dart';
import '../util/bottom_sheet.dart';
import '../widget/custom_button.dart';
import '../widget/user_profile.dart';

class CustomizationScreen extends StatefulWidget {
  late String imageData;

  CustomizationScreen({Key? key, required this.imageData}) : super(key: key);

  @override
  _CustomizationScreenState createState() => _CustomizationScreenState();
}

class _CustomizationScreenState extends State<CustomizationScreen> {
  PhotoViewController photoViewController = PhotoViewController();
  ImageProvider? _currentImageProvider;
  final ImagePicker _picker = ImagePicker();
  bool isNewImagePicked = false;
  String? newUploadedImage;

  @override
  void initState() {
    super.initState();

    _currentImageProvider = NetworkImage(widget.imageData);
    _loadPhotoPositionAndScale();
  }

  Future<void> _showOptionsBottomSheet() async {
    final currentContext = context;
    BottomSheetUtil.showOptionsBottomSheet(currentContext,
        onPressedCamera: () async {
      final XFile? image = await _picker.pickImage(source: ImageSource.camera);

      if (image != null) {
        Navigator.pop(currentContext);

        setState(() {
          // Update the image data with the locally picked image
          widget.imageData = image.path;
          _currentImageProvider = FileImage(File(image.path));
          isNewImagePicked = true;
        });

        photoViewController = PhotoViewController()
          ..value = const PhotoViewControllerValue(
            position: Offset(0.0, 0.0),
            scale: 1.0,
            rotation: 0.0,
            rotationFocusPoint: null,
          );

        // Force a rebuild of the widget to update the PhotoView
        setState(() {});
      }
    }, onPressedGallery: () async {
      final XFile? photo = await _picker.pickImage(source: ImageSource.gallery);

      if (photo != null) {
        Navigator.pop(currentContext);
        setState(() {
          // Update the image data with the locally picked image
          widget.imageData = photo.path;
          _currentImageProvider = FileImage(File(photo.path));
          isNewImagePicked = true;
        });

        photoViewController = PhotoViewController()
          ..value = const PhotoViewControllerValue(
            position: Offset(0.0, 0.0),
            scale: 1.0,
            rotation: 0.0,
            rotationFocusPoint: null,
          );

        // Force a rebuild of the widget to update the PhotoView
        setState(() {});
      }
    });
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

  uploadImage(BuildContext context) async {
    var res = await uploadToServer(File(widget.imageData));

    if (res != null) {
      if (res.success!) {
        GlobalHandler.showSnackbar(context, res.message!, false);
        setState(() {
          newUploadedImage = res.result![0].profileBannerImageURL!;
        });
      } else {
        GlobalHandler.showSnackbar(context, res.message!, true);
      }
    } else {
      GlobalHandler.showSnackbar(
          context, 'An error occurred during file upload.', true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Customize Your Card',
          style: TextStyle(color: blackColor),
        ),
        backgroundColor: whiteColor,
        actions: [
          GestureDetector(
            onTap: () {
              GlobalHandler.navigatorPushReplacement(
                  context,
                  EditCardScreen(
                    imageDataUrl:
                        isNewImagePicked ? newUploadedImage! : widget.imageData,
                  ));
            },
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Icon(
                Icons.close,
                color: blackColor,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        color: whiteColor,
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(10.0),
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      _showOptionsBottomSheet();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: blueColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      margin: const EdgeInsets.all(15),
                      child: DottedBorder(
                        radius: const Radius.circular(10),
                        color: blueColor.withOpacity(0.3),
                        padding: const EdgeInsets.all(15),
                        borderType: BorderType.RRect,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.photo_library,
                              color: Colors.blue,
                            ),
                            SizedBox(width: 8.0),
                            Text(
                              'Change Picture Here and Adjust',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    margin: const EdgeInsets.all(10.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: PhotoView(
                        controller: photoViewController,
                        imageProvider: _currentImageProvider,
                        minScale: PhotoViewComputedScale.contained,
                        maxScale: PhotoViewComputedScale.covered * 2,
                        backgroundDecoration: const BoxDecoration(
                          color: whiteColor,
                        ),
                        heroAttributes: const PhotoViewHeroAttributes(
                            tag: "background_image"),
                      ),
                    ),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: 65,
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
            ),
            const SizedBox(height: 20),
            CustomButton(
              onTap: () async {
                final customizedImage = photoViewController.value;

                GlobalHandler.setPhotoPosition(customizedImage.position);
                GlobalHandler.setPhotoScale(customizedImage.scale!);
                GlobalHandler.showSnackbar(
                    context, "Adjustments Saved!", false);

                if (isNewImagePicked) {
                  // Call uploadImage only if a new image is picked
                  await uploadImage(context);
                }
              },
              buttonText: "Save",
              isOutlined: false,
            ),
          ],
        ),
      ),
    );
  }
}
