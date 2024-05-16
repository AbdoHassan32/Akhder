import 'package:akhder/core/utils/app_router.dart';
import 'package:akhder/features/home/data/models/product.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/styles.dart';
import '../../../../../palette.dart';

class CustomItemWidget extends StatelessWidget {
  const CustomItemWidget({Key? key, required this.product}) : super(key: key);
final Product product;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        GoRouter.of(context).push(AppRouter.kItemDetailsView , extra: product);
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
              child: CachedNetworkImage(
                imageUrl: product.imageUrl!,
                height: MediaQuery.of(context).size.height * 0.13,
                fit: BoxFit.fill,
                errorWidget: (context, url, error) => const Icon(
                  Icons.error,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.03,
              child: Text(
                product.name!,
                style: Styles.textStyle16.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
                overflow: TextOverflow.ellipsis,
                textDirection: TextDirection.rtl,
              ),
            ),
             Text(
              product.weight != 0 ? (product.kgOrL == true ? ('${product.weight} كجم') : '${product.weight} لتر'):'',
              style: Styles.textStyle14.copyWith(
                  color: kGreyTextColor,
                  fontWeight: FontWeight.w500
              ),
              textDirection: TextDirection.rtl,
            ),
            const Spacer(
              flex: 1,
            ),
            Row(
              children: [
                Text(
                  '${product.price} ج',
                  style: Styles.textStyle18,
                  textDirection: TextDirection.rtl,
                  overflow: TextOverflow.ellipsis,
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


