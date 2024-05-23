import 'package:akhder/core/utils/app_router.dart';
import 'package:akhder/features/Details-screen/presentation/views/widgets/favourite_icon.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/styles.dart';
import '../../../../home/data/models/product.dart';

class FavoriteItem extends StatelessWidget {
  const FavoriteItem({Key? key, required this.favProduct}) : super(key: key);
  final Product favProduct;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        GoRouter.of(context).push(AppRouter.kItemDetailsView,extra: favProduct);
      },
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
              child: CachedNetworkImage(
                imageUrl: favProduct.imageUrl!,
                fit: BoxFit.fill,
                height: MediaQuery.of(context).size.height*0.1,

              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                textDirection: TextDirection.rtl,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(favProduct.name!,
                    textDirection: TextDirection.rtl,
                    style: Styles.textStyle18.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                   Text(favProduct.kgOrL! ? '${favProduct.weight!} كجم ' : '${favProduct.weight!} لتر ',
                    textDirection: TextDirection.rtl,
                    style: Styles.textStyle16,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.48,
                    child: Text(
                      favProduct.description!,
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
            Center(child: FavoriteButton(product: favProduct)),
          ],
        ),
      ),
    );
  }
}
