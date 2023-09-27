import 'package:elred/global/global_const.dart';
import 'package:elred/view/screen1.dart';
import 'package:elred/view_model/card_view_view_model.dart';
import 'package:elred/view_model/image_preview_view_model.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<CardViewViewModel>(
          create: (_) => CardViewViewModel(),
        ),
        ChangeNotifierProvider<ImagePreviewViewModel>(
          create: (_) => ImagePreviewViewModel(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GlobalLoaderOverlay(
      overlayColor: whiteColor,
      overlayOpacity: 1.0,
      overlayWidget: CircularProgressIndicator(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: GlobalLoaderOverlay(
            overlayColor: greyColor,
            overlayOpacity: 1.0,
            overlayWidget: CircularProgressIndicator(),
            child: ChangeDesignScreen()),
      ),
    );
  }
}
