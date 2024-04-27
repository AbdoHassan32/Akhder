import 'package:akhder/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:akhder/features/Details-screen/presentation/views/widgets/item_count.dart';

import '../../../../../core/utils/styles.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key});

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
                textDirection:TextDirection.rtl,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Text('منتج مصري',
                      textDirection:TextDirection.rtl,
                      style: Styles.textStyle18.copyWith(
                          fontWeight: FontWeight.bold,

                        ),
                    ),
                  ),
                    const Padding(
                      padding:  EdgeInsets.only(right: 12),
                      child:  Text('1 كجم',
                        textDirection:TextDirection.rtl,
                        style: Styles.textStyle16,
                      ),
                    ),
                  const Spacer(
                    flex: 2,
                  ),
                  ItemCount(),
                  const Spacer(
                    flex: 1,
                  ),
                ],
              ),
            ),
            const Spacer(
              flex: 1,
            ),
            Column(
              textDirection: TextDirection.rtl,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.close)),
                const Spacer(
                  flex: 2,
                ),
                const Text('100 ج.م',
                    textDirection: TextDirection.rtl,
                    style: Styles.textStyle18),
               const Spacer(
                  flex:2 ,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
