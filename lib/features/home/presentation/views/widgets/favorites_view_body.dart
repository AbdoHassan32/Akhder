import 'package:akhder/core/utils/styles.dart';
import 'package:flutter/material.dart';

class FavoritesViewBody extends StatelessWidget {
  const FavoritesViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding:  EdgeInsets.only(top: 20.0),
      child:  Column(
        textDirection: TextDirection.rtl,
        children: [
          Text(
            'المفضلة',
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
