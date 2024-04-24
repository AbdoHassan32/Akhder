import 'dart:ui';
import 'package:flutter/material.dart';
import '../../../../../core/utils/assets.dart';
class Paymentfaild extends StatelessWidget {
  const Paymentfaild({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children:[
          Padding(
            padding: const EdgeInsets.only(right: 30),
            child: Container(
              height: 350,
              width: 350,
              child: Image.asset(AssetsData.paymentfailed),
            ),
          ),
          const Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Text('عذرا لقد فشلت العملية',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
          ),

          Text('.حدث خطأ ما',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.grey),),

          SizedBox(height: 120,),

          TextButton(
            onPressed: (){},
            child:
            Container(
              height: 70,
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(25),
              ),
              child: const Center(
                child: Text(
                  'حاول مرة أخري',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
            ),
          ),

          Center(
            child: InkWell(
              onTap: () {
              },
              child:const Text(
                'الرجوع للقائمة الرئيسية',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                  // decoration: TextDecoration.underline,
                ),
              ),

            ),
          ),
        ],
      ),
    );
  }
}
