import 'package:flutter/material.dart';

import '../utils/styles.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({Key? key,required this.errMessage}) : super(key: key);
final String errMessage;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errMessage,
        style: Styles.textStyle28,
        textAlign: TextAlign.center,
      ),
    );
  }
}
