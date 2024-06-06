import 'package:akhder/core/utils/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
class IrrigationViewBody extends StatelessWidget {
  const IrrigationViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
         Padding(
          padding: EdgeInsets.only(top: 30.0, right: 350),
          child: IconButton(onPressed:()
          {
            GoRouter.of(context).pop();
          },
            icon:const Icon(Icons.arrow_back_ios_new_rounded),)
        ),
        const SizedBox(
          height: 135,
        ),
        Container(
          height: 500,
          width: 500,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            image: const DecorationImage(
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
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        height: 80,
                        width: 80,
                        child: const Text(
                          textAlign: TextAlign.center,
                          'الحرارة'
                              '   24 °C',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        height: 80,
                        width: 80,
                        child: const Text(
                          textAlign: TextAlign.center,
                          'الرطوبة'
                              '   24 %',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
