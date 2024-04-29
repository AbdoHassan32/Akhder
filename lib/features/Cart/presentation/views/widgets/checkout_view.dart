import 'package:flutter/cupertino.dart';
import 'package:flutter/src/material/icons.dart';
import 'package:flutter/material.dart';
import 'package:akhder/features/Cart/presentation/views/widgets/checkout_list.dart';

class Checkoutview extends StatefulWidget {
  const Checkoutview({super.key});
  @override
  State<Checkoutview> createState() => CheckoutviewState();
}

class CheckoutviewState extends State<Checkoutview> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(30)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            //padding:  EdgeInsets.symmetric(vertical: 15),
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.close,
                    size: 30,
                  ),
                ),
               /* const Text(
                  "التحقق من الدفع",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),*/
              ],
            ),
          ),
          const Divider(
            color: Colors.black12,
            height: 1,
          ),
          Checkoutlist(
              title: 'التوصيل', value: ' اختر الطريقة', onPressed: () {}),
          /* Column(
      mainAxisSize: MainAxisSize.min,
       children: [
         Padding(
            padding:  EdgeInsets.all( 15),
            child:  Row(
              children: [
               const Text('الدفع',
                  style: TextStyle(
                    color: Colors.black26,
                    fontSize: 18,
                    fontWeight: FontWeight.w600
                  ),
                ),

           IconButton(onPressed: (){}, icon:Icon(Icons.arrow_forward_ios))


              ],
            ),
                  ),
           Divider(
             color: Colors.black12,
             height: 1,
           ),

             ],
          ),*/

          Checkoutlist(title: 'الدفع', value: '', onPressed: () {}),
          Checkoutlist(
              title: 'كود الخصم', value: ' ادخل الكود', onPressed: () {}),
          Checkoutlist(
              title: 'التكلفة النهائية', value: ' 197 EGP', onPressed: () {}),
           Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 5, bottom: 5, top: 8),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width*0.8,
                  child: const Text(
                    'عند الضغط علي تأكيد الطلب يتم الموافقة علي الشروط و الأحكام. ',
                    style: TextStyle(fontSize: 15, color: Colors.black),
                    textDirection: TextDirection.rtl,
                    maxLines: 2,

                    overflow: TextOverflow.ellipsis,

                  ),
                ),
              ),
            ],
          ),
          TextButton(
            onPressed: () {},
            child: Container(
              height: 50,
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(25),
              ),
              child: const Center(
                child: Text(
                  'تأكيد',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
