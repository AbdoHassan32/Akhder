import 'package:akhder/features/favorites/presentation/views/widgets/favourite_icon.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/styles.dart';

class FavoriteItem extends StatelessWidget {
  const FavoriteItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height:120,
        color: Colors.white,
        child: Row(
          textDirection: TextDirection.rtl,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Image.asset(
                AssetsData.testProduct,
                height: MediaQuery.of(context).size.height*0.1,

              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                textDirection: TextDirection.rtl,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('منتج مصري',
                    textDirection: TextDirection.rtl,
                    style: Styles.textStyle18.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text('1 كجم',
                    textDirection: TextDirection.rtl,
                    style: Styles.textStyle16,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.48,
                    child: const Text('تمت صياغته بعناية ،معبأة مع مجموعة من الخيرات ،تغليف صحي،راجع العبوة للحصول علي معلومات حول الاستخدام',
                      textDirection: TextDirection.rtl,
                      style: Styles.textStyle16,
                      maxLines: 2,

                      overflow: TextOverflow.ellipsis,
                    ),
                  ),

                ],
              ),
            ),
            const Spacer(
              flex: 1,
            ),
            Center(child: FavoriteButton()),
          ],
        ),
      ),
    );
  }
}
