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
        height: MediaQuery.of(context).size.height*0.15,
        color: Colors.white,
        child: Row(
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
              padding: const EdgeInsets.symmetric(
                vertical: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('منتج مصري',
                      style: Styles.textStyle18.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                  ),
                    const Text('1kg, Price',
                      style: Styles.textStyle16,
                    ),
                  ItemCount(),
                ],
              ),
            ),
            const Spacer(
              flex: 1,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.close)),
                const SizedBox(
                  height: 18,
                ),
                const Text('\$1.99',
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.w500)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
