
import 'package:flutter/material.dart';
import '../../../../../core/utils/assets.dart';

class Paymentsuccess extends StatelessWidget {
  const Paymentsuccess({super.key});

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
             child: Image.asset(AssetsData.paymentsuccess),
            ),
        ),
        const Padding(
           padding: const EdgeInsets.only(bottom: 120),
           child: Text('! تم قبول الطلب بنجاح',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
         ),

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
                      'استمرار',
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
