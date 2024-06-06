import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/styles.dart';

class OnboardingViewEnd extends StatelessWidget {
  const OnboardingViewEnd({Key? key}) : super(key: key);

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
          AssetsData.irrigation,
          height:MediaQuery.of(context).size.height*0.3 ,
          width:MediaQuery.of(context).size.width*0.6 ,
        ),
        const Spacer(
          flex: 1,
        ),
        Text(
          'تابع حالة نباتك الخاص ومتى يتم ترويته',
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
