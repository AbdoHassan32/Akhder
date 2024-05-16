import 'package:akhder/features/home/presentation/views/widgets/item_details_view_body.dart';
import 'package:flutter/material.dart';

import '../../data/models/product.dart';

class ItemDetailsView extends StatelessWidget {
  const ItemDetailsView({Key? key,required this.product}) : super(key: key);
final Product product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: ItemDetailsViewBody(product: product,)),

    );
  }
}
