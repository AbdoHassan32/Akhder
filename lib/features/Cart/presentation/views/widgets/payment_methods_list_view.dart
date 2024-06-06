import 'package:akhder/features/Cart/presentation/views/widgets/payment_method_item.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';

class PaymentMethodsListView extends StatefulWidget {
  const PaymentMethodsListView({super.key});

  @override
  State<PaymentMethodsListView> createState() => _PaymentMethodsListViewState();
}

class _PaymentMethodsListViewState extends State<PaymentMethodsListView> {


  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 62,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child:Padding(
          padding:  EdgeInsets.all( 15),
          child:  Row(
            textDirection: TextDirection.rtl,
            children: [
              Text('طرق الدفع :',
                style:  TextStyle(
                    color: Colors.black26,
                    fontSize: 18,
                    fontWeight: FontWeight.w600
                ),
                textDirection: TextDirection.rtl,
              ),
               Spacer(
                flex: 1,
              ),
               SizedBox(
                width:10,
              ),
               PaymentMethodItem(
                isActive: true ,
                image: AssetsData.paypalIcon,
              ),

            ],
          ),
        ),

      ),
    );
  }
}
