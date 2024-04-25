import 'package:akhder/core/utils/assets.dart';
import 'package:flutter/material.dart';

class ItemPicturePageView extends StatelessWidget {
  const ItemPicturePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height*0.25,
      child: PageView(
        children: [
          Image.asset(
            AssetsData.testProduct2,
          ),
          Image.asset(
            AssetsData.testProduct3,
          )
        ],
      ),
    );
  }
}

