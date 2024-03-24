import 'package:flutter/material.dart';

class MyPageView extends StatelessWidget {
  const MyPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      width: 260,
      child: PageView(
        children: [
          Image.asset('assets/Images/41Tlo2hzWwL._SL500_._AC_SL500_.jpg'),
          Image.asset(
              'assets/Images/slideshow_slideshow_2361_54751286f5d-017b-4e85-b213-8656a60402c2.jpg')
        ],
      ),
    );
  }
}