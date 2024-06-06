import 'dart:developer';

import 'package:akhder/core/widgets/custom_button_widget.dart';
import 'package:akhder/features/Cart/presentation/views/widgets/checkout_list.dart';
import 'package:akhder/features/Cart/presentation/views/widgets/payment_methods_list_view.dart';
import 'package:akhder/features/Cart/presentation/views/widgets/paypal_checkout_view.dart';
import 'package:akhder/palette.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/api_keys.dart';
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
          Navigator.pop(context);
        },
        onError: (error) {
          log("onError: $error");
          Navigator.pop(context);
        },
        onCancel: () {
          print('cancelled:');
          Navigator.pop(context);
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