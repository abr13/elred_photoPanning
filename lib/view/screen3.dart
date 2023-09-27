import 'package:elred/global/global_handler.dart';
import 'package:elred/view/screen4.dart';
import 'package:elred/view_model/card_view_view_model.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:provider/provider.dart';

import '../global/global_const.dart';
import '../query/model/selected_card_model.dart';
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
  PhotoViewController photoViewController = PhotoViewController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<CardViewViewModel>(context, listen: false)
          .getSelectedCard(context, cardId);
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
          Consumer<CardViewViewModel>(builder: (context, value, child) {
            if (value.isLoading) {
              return _buildLoadingScreen();
            }
            final data = value.selectedCardResponse;
            _loadPhotoPositionAndScale();
            return _buildCardView(
                data!,
                data.result![0].customImageCardDesignInfo!
                    .profileBannerImageURL!);
          }),
        ],
      ),
    );
  }

  bool _isLoading(cardData) {
    return cardData == null;
  }

  Widget _buildLoadingScreen() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildCardView(SelectedCardResponse cardData, String imageUrl) {
    return Scaffold(
      appBar: _isLoading(cardData)
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
                        imageProvider: NetworkImage(imageUrl),
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
                            fname: "Alexandra",
                            lname: "Stanton",
                            imagePath: 'assets/profile.png',
                            designation: 'Realtor | VP design',
                            location: 'Bangalore, India',
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
                    context, EditCardScreen(imageDataUrl: imageUrl));
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
