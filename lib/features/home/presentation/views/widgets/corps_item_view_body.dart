import 'package:flutter/material.dart';

import 'corps_item_list_view.dart';

class CorpsItemViewBody extends StatelessWidget {
  const CorpsItemViewBody({Key? key}) : super(key: key);

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
              child:const CorpsItemListView(scrollDirection: Axis.vertical,bottomPadding: 10,topPadding: 10,))),
        ],
      ),
    );
  }
}
