import 'package:akhder/features/home/presentation/views/widgets/item_details_view_body.dart';
import 'package:flutter/material.dart';

class ItemDetailsView extends StatelessWidget {
  const ItemDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: ItemDetailsViewBody()),

    );
  }
}
