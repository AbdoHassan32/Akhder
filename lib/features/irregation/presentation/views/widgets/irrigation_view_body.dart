import 'package:akhder/features/irregation/presentation/views/widgets/Blutoothscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/assets.dart';

class IrrigationViewBody extends StatelessWidget {
  const IrrigationViewBody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 15, right: 350),
          child:
          IconButton(onPressed: () {
            GoRouter.of(context).pop();
          },
            icon: const Icon(Icons.arrow_back_ios_new_rounded),),
        ),
        Spacer(),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 650,
            width: 650,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AssetsData.irregation),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 220, top: 10),
                  child: TextButton(
                    onPressed: () {},
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 100,
                        ),
                        Container(
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            height: 80,
                            width: 80,
                            child: BluetoothScreen()
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

      ],
    );
  }
}