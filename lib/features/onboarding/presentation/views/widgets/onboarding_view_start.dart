import 'package:akhder/core/utils/assets.dart';
import 'package:flutter/material.dart';

class OnboardingViewStart extends StatelessWidget {
  const OnboardingViewStart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        Image.asset(
            AssetsData.logoWhite,
        height: MediaQuery.of(context).size.height*0.1,
        )
      ],
    );
  }
}
