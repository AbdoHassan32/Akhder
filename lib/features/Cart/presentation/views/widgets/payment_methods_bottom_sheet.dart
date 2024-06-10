import 'dart:developer';

import 'package:akhder/core/widgets/custom_button_widget.dart';
import 'package:akhder/features/Cart/presentation/views/widgets/checkout_list.dart';
import 'package:akhder/features/Cart/presentation/views/widgets/payment_methods_list_view.dart';
import 'package:akhder/features/Cart/presentation/views/widgets/paypal_checkout_view.dart';
import 'package:akhder/palette.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/api_keys.dart';
import '../../../../../core/utils/assets.dart';
import '../../../data/models/amount.dart';
import '../../../data/models/details.dart';
class PaymentMethodsBottomSheet extends StatelessWidget {
  const PaymentMethodsBottomSheet({super.key, required this.total});
final double total;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
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
                const Text(
                  "التحقق من الدفع",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const Divider(
            color: Colors.black12,
            height: 1,
          ),
          const SizedBox(
            height: 16,
          ),
          Checkoutlist(
              title: 'التكلفة النهائية', value: '${total} ج.م' , onPressed: () {}),

          const SizedBox(
            height: 10,
          ),
          const Divider(
            color: Colors.black12,
            height: 1,
          ),
          const SizedBox(
            height: 10,
          ),
          const PaymentMethodsListView(),
          const SizedBox(
            height: 32,
          ),
          CustomButtonWidget(
            onPressed: () {
              var transctionsData = getTransctionsData();
              executePaypalPayment(context, transctionsData);
            },
            label: 'المتابعة',
            buttonColor: kPrimaryColor,
          ),
        ],
      ),
    );
  }

  void executePaypalPayment(BuildContext context, ({Amount amount}) transctionsData) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => PaypalCheckoutView(
        sandboxMode: true,
        clientId: ApiKeys.clientID,
        secretKey: ApiKeys.secretKey,
        transactions: [
          {

            "amount": transctionsData.amount.toJson(),
            "description": "The payment transaction description.",
          }
        ],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) async {
          log("onSuccess: $params");
          var collection = FirebaseFirestore.instance.collection('cart');
          var snapshots = await collection.get();
          for (var doc in snapshots.docs) {
            await doc.reference.delete();
          }

          Navigator.pop(context);
          Navigator.pop(context);
          showDialog(
            context: context,
            builder: (context) {
              return Container(
                height: MediaQuery.of(context).size.height*0.2,
                child: Dialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                  elevation: 16,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children:[
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(
                              Icons.close,
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: Container(
                          child: Image.asset(
                            AssetsData.paymentsuccess,
                            height:MediaQuery.of(context).size.height*0.3 ,
                            width: MediaQuery.of(context).size.width*0.6,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: const EdgeInsets.all(50),
                        child: Text('! تم قبول الطلب بنجاح',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width*0.5,
                        child: CustomButtonWidget(buttonColor: kPrimaryColor, label: 'استمرار', onPressed:(){
                          Navigator.pop(context);
                        }),
                      ),

                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        onError: (error) {
          log("onError: $error");
          Navigator.pop(context);
          Navigator.pop(context);
          showDialog(
            context: context,
            builder: (context) {
              return Container(
                height: MediaQuery.of(context).size.height*0.2,
                child: Dialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                  elevation: 16,
                  child: Column(
                    crossAxisAlignment : CrossAxisAlignment.center,
                    textDirection: TextDirection.rtl,
                    mainAxisSize: MainAxisSize.min,
                    children:[
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(
                              Icons.close,
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: Container(
                          child: Image.asset(
                            AssetsData.paymentfailed,
                            height:MediaQuery.of(context).size.height*0.3 ,
                            width: MediaQuery.of(context).size.width*0.6,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: const EdgeInsets.all(50),
                        child: Text('! عذرا لقد فشلت العملية',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width*0.5,
                        child: CustomButtonWidget(buttonColor: kPrimaryColor, label: 'حاول مرة اخرى', onPressed:(){
                          Navigator.pop(context);
                        }),
                      ),

                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        onCancel: () {
          Navigator.pop(context);
          Navigator.pop(context);
          showDialog(
            context: context,
            builder: (context) {
              return Container(
                height: MediaQuery.of(context).size.height*0.2,
                child: Dialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                  elevation: 16,
                  child: Column(
                    crossAxisAlignment : CrossAxisAlignment.center,

                    mainAxisSize: MainAxisSize.min,
                    children:[
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(
                              Icons.close,
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: Container(
                          child: Image.asset(
                            AssetsData.paymentfailed,
                            height:MediaQuery.of(context).size.height*0.3 ,
                            width: MediaQuery.of(context).size.width*0.6,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: const EdgeInsets.all(50),
                        child: Text('! عذرا لقد فشلت العملية',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width*0.5,
                        child: CustomButtonWidget(buttonColor: kPrimaryColor, label: 'حاول مرة اخرى', onPressed:(){
                          Navigator.pop(context);
                        }),
                      ),

                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    ));
  }

  ({Amount amount }) getTransctionsData() {
    var amount = Amount(
        total:((total / 48.8).toStringAsFixed(1)),
        currency: 'USD',
        details: Details(
          shipping: "0",
          shippingDiscount: 0,
          subtotal: ((total / 48.8).toStringAsFixed(1)),
        ));

    return (amount: amount);
  }
}