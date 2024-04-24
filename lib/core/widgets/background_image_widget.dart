import 'package:akhder/core/utils/assets.dart';
import 'package:flutter/material.dart';

class BackgroundImageWidget extends StatelessWidget {
  const BackgroundImageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AssetsData.blurredBackground,
      fit: BoxFit.fill,
      height: double.infinity,
      width: double.infinity,
    );
  }
}
