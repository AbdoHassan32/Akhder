import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../home/data/models/product.dart';

class ItemPicturePageView extends StatelessWidget {
  const ItemPicturePageView({super.key,required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height*0.25,
      child: CachedNetworkImage(
        imageUrl:product.imageUrl!,
        fit: BoxFit.fill,
        errorWidget: (context, url, error) => const Icon(
          Icons.error,
          color: Colors.black,
        ),
      ),
    );
  }
}

