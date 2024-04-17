
import 'package:flutter/material.dart';
import 'package:akhder/features/Cart/presentation/views/widgets/cart_item.dart';
import 'package:akhder/features/Details-screen/presentation/views/widgets/item_count.dart';
class CartItem extends StatelessWidget {
  const CartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Container(
          height: 120,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
      
               Padding(
                 padding: const EdgeInsets.only(top: 20),
                 child: Container(
                   width: 50,
                   height: 70,
                   decoration: BoxDecoration(
                     color: Colors.white,
                     borderRadius: BorderRadius.circular(15)
                   ),
                           alignment: Alignment.center,
                           child: Image.asset('assets/test_product.png',
                             height: 78,
                             width: 65,
                           ),
                           ),
               ),
               Column(
                       crossAxisAlignment: CrossAxisAlignment.center,
                       children: [
                        const Text('منتج مصري',style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold )),
                       const  Text(
                             '1kg, Price',
                             style: TextStyle(fontSize: 17,color: Colors.grey,fontWeight:FontWeight.w500  )
                         ),
                           ItemCount(),


                       ],
                     ),
                     Spacer(),
                     Column(
                       crossAxisAlignment: CrossAxisAlignment.end,
                       children: [
                         IconButton(onPressed: (){}, icon:Icon(Icons.close) ),
                        const SizedBox(
                           height: 18,
                         ),
                       const  Text(
                             '\$1.99',
                             style: TextStyle(fontSize: 17,color: Colors.black,fontWeight:FontWeight.w500  )
                         ),

                       ],
                     )



                ],
              )
            ],
          )
          ,
        ),

    );
  }
}
