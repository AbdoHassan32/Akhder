import 'package:akhder/features/Cart/presentation/views/widgets/payment_methods_bottom_sheet.dart';
import 'package:akhder/palette.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:akhder/features/Cart/presentation/views/widgets/checkout_view.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../home/data/models/product.dart';
import 'cart_item.dart';

class CartViewBody extends StatefulWidget {
  const CartViewBody({super.key});

  @override
  State<CartViewBody> createState() => _CartViewBodyState();
}

class _CartViewBodyState extends State<CartViewBody> {
  final Stream<QuerySnapshot> cart = FirebaseFirestore.instance
      .collection('cart')
      .orderBy('createdAt', descending: false)
      .snapshots();
  final User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: cart,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            double total = 0;
            List<Product> productList = [];
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              productList.add(Product.fromJson(snapshot.data!.docs[i]));
              total += productList[i].price! * productList[i].itemCount!;
            }
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
                              bottom: 80,
                            ),
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return productList[index].userId == user!.email
                                  ? CartItem(
                                      product: productList[index],
                                    )
                                  : Container();
                            },
                            separatorBuilder: (context, index) => const Divider(
                                  color: Colors.black26,
                                  height: 2,
                                ),
                            itemCount: productList.length),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: productList.isEmpty
                              ? ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      backgroundColor: kGreyTextColor),
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 45.0, vertical: 12.0),
                                    child: Text(
                                      'الذهاب للدفع',
                                      textDirection: TextDirection.rtl,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                )
                              : ElevatedButton(
                                  onPressed: () {
                                    showModalBottomSheet(
                                        context: context,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(16)),
                                        builder: (context) {
                                          return  PaymentMethodsBottomSheet(total: total,);
                                        });
                                  },
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      backgroundColor: kPrimaryColor),
                                  child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 45.0, vertical: 12.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const Text(
                                            'الذهاب للدفع',
                                            textDirection: TextDirection.rtl,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 17,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Text(
                                            ' المجموع : ${total.toInt()} ج.م',
                                            textDirection: TextDirection.rtl,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 17,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      )),
                                ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: SizedBox(
                child: Column(
                  textDirection: TextDirection.rtl,
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
                    const Spacer(
                      flex: 1,
                    ),
                    const CircularProgressIndicator(),
                    const Spacer(
                      flex: 1,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            backgroundColor: kGreyTextColor),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 45.0, vertical: 12.0),
                          child: Text(
                            'الذهاب للدفع',
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        });
  }

  void showCheckout() {

    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        isDismissible: false,
        context: context,
        builder: (context) {
          return const Checkoutview();
        });
  }
}
