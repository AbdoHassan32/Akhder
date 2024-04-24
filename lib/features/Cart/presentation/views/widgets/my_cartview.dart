

import 'package:flutter/material.dart';
import 'package:akhder/features/Cart/presentation/views/widgets/my_cartview.dart';
import 'package:akhder/features/Cart/presentation/views/widgets/checkout_view.dart';

import 'cart_item.dart';

class MyCartView extends StatefulWidget {
  const MyCartView({super.key});

  @override
  State<MyCartView> createState() => _MyCartViewState();
}

class _MyCartViewState extends State<MyCartView> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 3,
        centerTitle: true,
        title: const Text(
          "My Cart",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w700),
        ),
      ),

    body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ListView.separated(
            padding: const EdgeInsets.all(40.0),
              itemBuilder:(context, index)
              {
                return const CartItem();
              } ,
              separatorBuilder:(context, index) => const Divider(
                color: Colors.black26,
                height: 2,
              ),
              itemCount: 8),
      
      
      
      
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                   showCheckout();
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    backgroundColor: Colors.green
                  ),
                      child:const Padding(
                          padding:
                   EdgeInsets.symmetric(horizontal: 45.0, vertical: 12.0),
                  child:  Text("Go To Checkout",
                  style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w500),
                  ),
                ),
                ),
                ],
            ),
          )
        ],
      ),


    );
  }
  void showCheckout(){
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        isDismissible: false,
        context: context, builder: (context){
      return const checkoutview();
    });
  }
}

