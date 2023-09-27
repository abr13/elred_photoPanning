import 'dart:io';

import 'package:elred/view_model/image_preview_view_model.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';

import '../global/global_const.dart';
import '../global/global_handler.dart';
import '../widget/custom_appbar.dart';
import '../widget/custom_button.dart';
import 'screen3.dart';

class ImagePreviewScreen extends StatelessWidget {
  final String imagePath;

  const ImagePreviewScreen({Key? key, required this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ImagePreviewViewModel>(
      create: (context) => ImagePreviewViewModel(),
      child: _ImagePreviewScreenContent(imagePath: imagePath),
    );
  }
}

class _ImagePreviewScreenContent extends StatelessWidget {
  final String imagePath;

  const _ImagePreviewScreenContent({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Upload Profile',
        onTapLeading: () {
          GlobalHandler.back(context);
        },
      ),
      body: Container(
        color: whiteColor,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(20.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.file(
                    File(imagePath),
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const Text(
              "Picture ready to be saved",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 50),
            CustomButton(
              onTap: () async {
                context.loaderOverlay.show();
                final viewModel =
                    Provider.of<ImagePreviewViewModel>(context, listen: false);
                final res = await viewModel.uploadImage(File(imagePath));
                context.loaderOverlay.hide();

                if (res != null) {
                  if (res.success!) {
                    GlobalHandler.showSnackbar(context, res.message!, false);
                    GlobalHandler.navigatorPush(
                      context,
                      const CardViewScreen(),
                    );
                  } else {
                    GlobalHandler.showSnackbar(context, res.message!, true);
                  }
                } else {
                  GlobalHandler.showSnackbar(
                      context, 'An error occurred during file upload.', true);
                }
              },
              buttonText: "Save & Continue",
              isOutlined: false,
            ),
          ],
        ),
      ),
    );
  }
}
