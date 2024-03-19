import 'package:akhder/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget(
      {required this.buttonColor,
        required this.label,
        Key? key,
        required this.onPressed})
      : super(key: key);
  final String label;
  final Color buttonColor;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 53,
      width: double.infinity,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
        ),
        child: Text(
          label,
          style: Styles.textStyle18.copyWith(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
