import 'package:akhder/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/styles.dart';

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
        ),
        const Spacer(
          flex: 1,
        ),
        SvgPicture.asset(
          AssetsData.market_place,
          height:MediaQuery.of(context).size.height*0.3 ,
          width:MediaQuery.of(context).size.width*0.6 ,
        ),
        const Spacer(
          flex: 1,
        ),
         Text(
          'ابدأ في البحث عن اهم احتياجاتك الزراعية من خلال متجر متخصص سريع وسهل',
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
