import 'package:akhder/core/utils/styles.dart';
import 'package:akhder/features/home/presentation/views/widgets/add_to_cart_button.dart';
import 'package:akhder/features/home/presentation/views/widgets/price_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:akhder/features/Details-screen/presentation/views/widgets/Hidden_text_widget.dart';
import 'package:akhder/features/Details-screen/presentation/views/widgets/favourite_icon.dart';
import 'package:akhder/features/Details-screen/presentation/views/widgets/item_product_page_view.dart';
import 'package:akhder/features/Details-screen/presentation/views/widgets/rating_bar.dart';
import 'package:go_router/go_router.dart';

import '../../../../../palette.dart';
import '../../../data/models/product.dart';

class ItemDetailsViewBody extends StatefulWidget {
  const ItemDetailsViewBody({Key? key, required this.product})
      : super(key: key);
  final Product product;

  @override
  State<ItemDetailsViewBody> createState() => _ItemDetailsViewBodyState();
}

class _ItemDetailsViewBodyState extends State<ItemDetailsViewBody> {
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
                    icon: const Icon(Icons.arrow_back_ios)),],
            ),
          ),
          ItemPicturePageView(
            product: widget.product,
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
                    widget.product.name!,
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
              FavoriteButton(product: widget.product),

            ],
          ),
           Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  widget.product.weight != 0 ? (widget.product.kgOrL == true ? ('${widget.product.weight} كجم') : '${widget.product.weight} لتر'):'',
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
          PriceWidget(product: widget.product),
          const Divider(
            height: 30,
            thickness: 1,
            endIndent: 15,
            indent: 15,
          ),
          const SizedBox(
            height: 1,
          ),
          HiddenTextWidget(product: widget.product,),
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

           AddToCartButton(product: widget.product),
        ],
      ),
    );
  }
}
