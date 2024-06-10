import 'package:akhder/features/home/presentation/views/widgets/seeds_item_list_view.dart';
import 'package:flutter/material.dart';

class SeedsItemViewBody extends StatelessWidget {
  const SeedsItemViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        textDirection: TextDirection.rtl,
        children: [
          Expanded(child: SizedBox(
              width: MediaQuery.of(context).size.width*0.6,
              child:const SeedsItemListView(scrollDirection: Axis.vertical,bottomPadding: 10,topPadding: 10,))),
        ],
      ),
    );
  }
}
