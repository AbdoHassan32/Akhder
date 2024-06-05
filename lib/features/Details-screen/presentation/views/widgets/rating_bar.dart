import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class StarRate extends StatelessWidget {
  const StarRate({super.key});

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      textDirection: TextDirection.rtl,
        itemBuilder: (context, _) => const Icon(
          Icons.star,
          color: Colors.orange,
        ), onRatingUpdate: (double value) {  },
        );
  }
}
