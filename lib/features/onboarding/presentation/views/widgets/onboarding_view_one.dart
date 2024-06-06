import 'package:akhder/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/assets.dart';

class OnboardingViewOne extends StatelessWidget {
  const OnboardingViewOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 30,
        ),
        Image.asset(
          AssetsData.logoWhite,
          height: MediaQuery.of(context).size.height*0.1,
        ),
        const Spacer(
          flex: 1,
        ),
        SvgPicture.asset(
          AssetsData.detect_disease,
          height:MediaQuery.of(context).size.height*0.3 ,
          width:MediaQuery.of(context).size.width*0.6 ,
        ),
        const Spacer(
          flex: 1,
        ),
         Text(
          'اكتشف إصابة نباتك بالمرض عن طريق فحصه من خلال جهازك المحمول',
          textDirection: TextDirection.rtl,
          style: Styles.textStyle18.copyWith(
            color: Colors.white,
          ),
        ),

        const Spacer(
          flex: 2,
        ),

      ],
    );
  }
}
