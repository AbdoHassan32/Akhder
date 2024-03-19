import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';
import '../../../../../palette.dart';

class CustomCategoryTitleWidget extends StatelessWidget {
  const CustomCategoryTitleWidget({required this.categoryTitle,required this.onPressed,Key? key}) : super(key: key);
  final String categoryTitle;
  final VoidCallback ? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        textDirection: TextDirection.rtl,
        children: [

           Text(
            categoryTitle,
            style: Styles.textStyle24,
          ),
          const Spacer(
            flex: 1,
          ),
          TextButton(
            onPressed: onPressed ,
            child:Text(
              'عرض المزيد',
              textDirection: TextDirection.rtl,
              style: Styles.textStyle16.copyWith(
                color: kPrimaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
