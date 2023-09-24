import 'package:elred/global/global_handler.dart';
import 'package:elred/view/screen4.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

import '../global/global_const.dart';
import '../query/selected_card_api.dart';
import '../widget/circular_icon_btn.dart';
import '../widget/custom_appbar.dart';
import '../widget/custom_button.dart';
import '../widget/user_profile.dart';

class CardViewScreen extends StatefulWidget {
  const CardViewScreen({
    super.key,
  });

  @override
  State<CardViewScreen> createState() => _CardViewScreenState();
}

class _CardViewScreenState extends State<CardViewScreen> {
  Future<SelectedCardResponse?>? _cardData;
  late String imageDataUrl;
  PhotoViewController photoViewController = PhotoViewController();

  @override
  void initState() {
    super.initState();
    _cardData =
        postSelectedCard(context, SelectedCardParams(cardImageId: cardId));
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
      setState(() {
        photoViewController.value = position;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Disable app bar when loading
          if (_isLoading())
            const ModalBarrier(
              dismissible: false,
              color: Colors.transparent,
            ),
          // Actual content
          FutureBuilder<SelectedCardResponse?>(
            future: _cardData,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                // If data is not available, show loading or error state
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return _buildLoadingScreen();
                } else if (snapshot.hasError) {
                  // Handle error
                  return Center(
                    child: Text('Error: ${snapshot.error.toString()}'),
                  );
                } else {
                  // Handle no data case
                  return const Center(
                    child: Text('No data available.'),
                  );
                }
              } else {
                final imageUrl = snapshot.data!.result![0]
                    .customImageCardDesignInfo!.profileBannerImageURL;
                imageDataUrl = imageUrl!;
                _loadPhotoPositionAndScale();
                return _buildCardView(snapshot.data!, imageUrl);
              }
            },
          ),
        ],
      ),
    );
  }

  bool _isLoading() {
    return _cardData == null;
  }

  Widget _buildLoadingScreen() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildCardView(SelectedCardResponse cardData, String imageUrl) {
    return Scaffold(
      appBar: _isLoading()
          ? null
          : CustomAppBar(
              title: 'Artist',
              onTapLeading: () {
                GlobalHandler.back(context);
              },
            ),
      body: Container(
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
                        initialScale: 1.0,
                        disableGestures: true,
                        controller: photoViewController,
                        imageProvider: NetworkImage(imageDataUrl),
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
                    mainAxisAlignment: MainAxisAlignment
                        .spaceBetween, // Center icons vertically
                    children: <Widget>[
                      const Column(
                        children: [
                          SizedBox(
                            height: 70,
                          ),
                          UserProfileInfo(
                            name: "Abdur Rahman",
                            imagePath: 'assets/profile_image.png',
                            designation: 'Senior Software Engineer',
                            location: 'Kolkata, India',
                          ),
                          SizedBox(height: 200),
                        ],
                      ),
                      // Icon buttons in a row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CircularIconButton(
                            iconData: Icons.phone,
                            onPressed: () {},
                          ),
                          CircularIconButton(
                            iconData: Icons.email,
                            onPressed: () {},
                          ),
                          CircularIconButton(
                            iconData: Icons.location_pin,
                            onPressed: () {},
                          ),
                          CircularIconButton(
                            iconData: Icons.add_circle_outline_sharp,
                            onPressed: () {},
                          ),
                          CircularIconButton(
                            iconData: Icons.facebook,
                            onPressed: () {},
                          ),
                        ],
                      ),
                      // Additional icons at bottom corners
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            margin: const EdgeInsets.only(left: 25, bottom: 25),
                            child: Image.asset(
                              "assets/logo.png",
                              width: 50,
                              color: whiteColor,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            margin:
                                const EdgeInsets.only(right: 25, bottom: 25),
                            child: Row(
                              children: [
                                CircularIconButton(
                                  iconData: Icons.account_circle,
                                  iconSize: 12,
                                  width: 28,
                                  height: 28,
                                  onPressed: () {},
                                ),
                                const Text(
                                  "Profile",
                                  style: TextStyle(color: whiteColor),
                                )
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            CustomButton(
              onTap: () {
                GlobalHandler.navigatorPush(
                    context, EditCardScreen(imageDataUrl: imageDataUrl));
              },
              buttonText: "Edit Card",
              isOutlined: true,
            ),
          ],
        ),
      ),
    );
  }
}
