import 'package:akhder/core/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:akhder/features/Details-screen/presentation/views/widgets/item_count.dart';
import 'package:akhder/features/Details-screen/presentation/views/widgets/Hidden_text_widget.dart';
import 'package:akhder/features/Details-screen/presentation/views/widgets/favourite_icon.dart';
import 'package:akhder/features/Details-screen/presentation/views/widgets/item_product_page_view.dart';
import 'package:akhder/features/Details-screen/presentation/views/widgets/rating_bar.dart';
import 'package:go_router/go_router.dart';

import '../../../../../palette.dart';
import '../../../data/models/product.dart';

class ItemDetailsViewBody extends StatelessWidget {
  const ItemDetailsViewBody({Key? key, required this.product})
      : super(key: key);
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 25,
        right: 25,
        bottom: 30,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      GoRouter.of(context).pop();
                    },
                    icon: const Icon(Icons.arrow_back_ios)),
                const Icon(Icons.upload_rounded),
              ],
            ),
          ),
          ItemPicturePageView(
            product: product,
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            textDirection: TextDirection.rtl,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width*0.6,
                  child: Text(
                    product.name!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                    overflow: TextOverflow.ellipsis,
                    textDirection: TextDirection.rtl,
                    maxLines: 2,
                    softWrap: true,
                  ),
                ),
              ),
              FavoriteButton(),

            ],
          ),
           Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  product.weight != 0 ? (product.kgOrL == true ? ('${product.weight} كجم') : '${product.weight} لتر'):'',
                  style: Styles.textStyle14.copyWith(
                      color: kGreyTextColor,
                      fontWeight: FontWeight.w500
                  ),
                  textDirection: TextDirection.rtl,
                ),

              ],
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Row(
            children: [
              ItemCount(),
              const Spacer(),
              Padding(
                padding:const EdgeInsets.only(right: 10),
                child: Text(
                  '${product.price} ج',
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 25,
                  ),
                  textDirection: TextDirection.rtl,
                ),
              ),
            ],
          ),
          const Divider(
            height: 30,
            thickness: 1,
            endIndent: 15,
            indent: 15,
          ),
          const SizedBox(
            height: 1,
          ),
          HiddenTextWidget(product: product,),
          const Divider(
            height: 30,
            thickness: 1,
            endIndent: 15,
            indent: 15,
          ),
          const Row(
            children: [
              Icon(Icons.keyboard_arrow_left),
              StarRate(),
              Spacer(),
              Text(
                'تقيم المنتج',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const Spacer(
            flex: 1,
          ),
          TextButton(
            onPressed: () {},
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(16),
              ),
              height: 50,
              width: 250,
              child: Center(
                child: Text(
                  'أضف للعربة',
                  style: Styles.textStyle20.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
