import 'package:flutter/material.dart';

import '../../palette.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {this.controller,
      required this.isPassword,
      required this.hintText,
        required this.inputType,
      Key? key,
      this.onChanged,
        this.suffixIcon,
      this.validator})
      : super(key: key);
  final String hintText;
  final bool isPassword;
  final Icon ? suffixIcon;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextInputType inputType ;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: const TextStyle(
          // color: kPrimaryColor,
          fontWeight: FontWeight.w600),
      onChanged: onChanged,
      textAlign: TextAlign.start,
      cursorColor: kGreyTextColor,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      textDirection: TextDirection.ltr,
      keyboardType: inputType,
      decoration: InputDecoration(
        filled: true,
        alignLabelWithHint: true,
//        labelText: hintText,
        label: SizedBox(
            width: double.infinity,
            child: Text(hintText, textAlign: TextAlign.end)),
        labelStyle: const TextStyle(
          color: kGreyTextColor,
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
        hintTextDirection: TextDirection.rtl,
        hintStyle: const TextStyle(
          // color: kTextColorFormField,
          fontSize: 15,
        ),
        fillColor: Colors.white,
        // focusColor: kFormFieldColor,
        border: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: kGreyTextColor,
            width: 0,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: kGreyTextColor.withOpacity(0.3),
            width: 1,
          ),
        ),
        disabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            // color: kFormFieldColor,
            width: 0,
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            // color: kFormFieldColor,
            width: 0,
          ),
        ),
        suffixIcon: suffixIcon
      ),
      obscureText: isPassword,
    );
  }
}
