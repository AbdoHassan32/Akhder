import 'package:akhder/core/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:akhder/features/Details-screen/presentation/views/widgets/item_count.dart';
import 'package:akhder/features/Details-screen/presentation/views/widgets/Hidden_text_widget.dart';
import 'package:akhder/features/Details-screen/presentation/views/widgets/favourite_icon.dart';
import 'package:akhder/features/Details-screen/presentation/views/widgets/item_product_page_view.dart';
import 'package:akhder/features/Details-screen/presentation/views/widgets/rating_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ItemDetailsViewBody extends StatelessWidget {
  const ItemDetailsViewBody({Key? key}) : super(key: key);

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
          const ItemPicturePageView(),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FavoriteButton(),
              const Padding(
                padding: EdgeInsets.only(right: 10),
                child: Text(
                  'بذور نعناع شاهين',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('جم'),
                Text('50'),
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
              const Padding(
                padding: EdgeInsets.only(right: 10),
                child: Text(
                  '75' ' EGP',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 25,
                  ),
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
          HiddenTextWidget(),
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
            onPressed: () {
              Fluttertoast.showToast(
                msg: 'تم أضافة المنتج إلي العربة',
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.black,
                textColor: Colors.white,
               fontSize: 20,
              );
            },
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
