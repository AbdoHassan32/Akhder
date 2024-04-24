import 'package:flutter/material.dart';
import 'package:akhder/features/Cart/presentation/views/widgets/checkout_view.dart';
import '../../../../../core/utils/styles.dart';
import 'cart_item.dart';

class CartViewBody extends StatefulWidget {
  const CartViewBody({super.key});

  @override
  State<CartViewBody> createState() => _CartViewBodyState();
}

class _CartViewBodyState extends State<CartViewBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'العربة',
            style: Styles.textStyle24,
          ),
          const SizedBox(
            height: 20,
          ),
          const Divider(
            thickness: 0.5,
          ),
          Expanded(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                ListView.separated(
                    padding: const EdgeInsets.only(
                      left: 20,
                      top: 10,
                      right: 20,
                      bottom: 50,
                    ),
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return const CartItem();
                    },
                    separatorBuilder: (context, index) => const Divider(
                          color: Colors.black26,
                          height: 2,
                        ),
                    itemCount: 8),
                Padding(
                  padding: const EdgeInsets.all(20.0),
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
                            backgroundColor: Colors.green),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 45.0, vertical: 12.0),
                          child: Text(
                            "Go To Checkout",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void showCheckout() {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        isDismissible: false,
        context: context,
        builder: (context) {
          return const checkoutview();
        });
  }
}
