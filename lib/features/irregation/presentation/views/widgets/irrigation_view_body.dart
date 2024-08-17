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
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15,top: 10.0),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    GoRouter.of(context).pop();
                  },
                  icon: const Icon(Icons.arrow_back_ios_new_rounded,
                  color: Colors.white),
                ),
                const Spacer(
                  flex: 1,
                ),
                Text(
                  'مستوى الرطوبة الخاصة بنباتك',
                  textDirection: TextDirection.rtl,
                  style: Styles.textStyle18.copyWith(
                    color: Colors.white,
                  ),
                ),
                const Spacer(
                  flex: 2,
                ),
              ],
            ),
          ),
          const Spacer(
            flex: 1,
          ),
          Image.asset(AssetsData.logoWhite,
          height: MediaQuery.of(context).size.height*0.23),
         const Spacer(
           flex: 2,
         ),
          Center(
            child: Container(
                decoration: BoxDecoration(
                  color: kSecondaryColor,
                  borderRadius: BorderRadius.circular(13),
                ),
                height:MediaQuery.of(context).size.height*0.16,
                width: MediaQuery.of(context).size.width*0.45,
                child: BluetoothScreen()),
          ),
          const Spacer(
            flex: 4,
          ),
        ],
      ),
    );
  }
}
