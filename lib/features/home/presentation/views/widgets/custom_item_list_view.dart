import 'package:flutter/cupertino.dart';

import 'custom_item_widget.dart';

class CustomItemListView extends StatelessWidget {
  const CustomItemListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height*0.32,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        itemCount: 10,
        itemBuilder: (context, index) => const Padding(
          padding: EdgeInsets.only(
            right: 10,
            left: 10,
          ),
          child: CustomItemWidget(),
        ),
      ),
    );
  }
}
