import 'package:akhder/core/utils/styles.dart';
import 'package:akhder/features/irregation/presentation/views/widgets/bluetooth_screen.dart';
import 'package:akhder/palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/assets.dart';

class IrrigationViewBody extends StatelessWidget {
  const IrrigationViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),

        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: MediaQuery.of(context).size.height*0.6,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AssetsData.plant),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 30.0,top: 250),
            child: Container(
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                height:MediaQuery.of(context).size.width*0.2,
                width: MediaQuery.of(context).size.width*0.35,
                child: BluetoothScreen()),
          ),
        ),
        const Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding:  EdgeInsets.only(top: 12),
            child: Text(
              'نسبة الرطوبة الخاصة بنباتك',
              textDirection: TextDirection.rtl,
              style: Styles.textStyle18,
            )
          ),
        ),
      ],
    );
  }
}
