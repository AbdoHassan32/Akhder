import 'package:akhder/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../palette.dart';

class CustomItemWidget extends StatelessWidget {
  const CustomItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        GoRouter.of(context).push(AppRouter.kItemDetailsView);
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.32,
        width: MediaQuery.of(context).size.width * 0.47,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Colors.grey.withOpacity(0.3),
            width: 1,
          ),
        ),
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          textDirection: TextDirection.rtl,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                AssetsData.testProduct,
                height: MediaQuery.of(context).size.height * 0.13,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              'مبيد حشري',
              style: Styles.textStyle16.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Text(
              '125 مللي',
              style: Styles.textStyle14,
              textDirection: TextDirection.rtl,
            ),
            const Spacer(
              flex: 1,
            ),
            Row(
              children: [
                Text(
                  '100 EGP',
                  style: Styles.textStyle18.copyWith(
                    fontFamily: 'Arial',
                  ),
                ),
                const Spacer(
                  flex: 1,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
