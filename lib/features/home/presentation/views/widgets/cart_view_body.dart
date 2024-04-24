import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding:  EdgeInsets.only(top: 20.0),
      child:  Column(
        textDirection: TextDirection.rtl,
        children: [
          Text(
            'العربة',
            style: Styles.textStyle24,
          ),
          SizedBox(
            height: 20,
          ),
          Divider(
            thickness: 0.5,
          )
        ],
      ),
    );
  }
}
