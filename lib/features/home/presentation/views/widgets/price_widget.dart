

import 'package:akhder/features/home/data/models/product.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';
import '../../../../../palette.dart';

class PriceWidget extends StatefulWidget {
  const PriceWidget({Key? key, required this.product}) : super(key: key);
final Product product;


  @override
  State<PriceWidget> createState() => _PriceWidgetState();
}

class _PriceWidgetState extends State<PriceWidget> {
  void increment() {
    setState(() {
      if (widget.product.itemCount! < 20) {
        widget.product.itemCount = 1 + widget.product.itemCount! ;
      }
    });
  }

  void decrement() {
    setState(() {
      if (widget.product.itemCount! > 1) {
        widget.product.itemCount= widget.product.itemCount! - 1;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Row(
          children: [
            IconButton(
              icon:const Icon(Icons.remove),
              onPressed: decrement,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                  border: Border.all(color: Colors.grey)),
              //color: Colors.blue,
              height: 25,
              width: 20,
              child: Center(
                child: Text(
                  widget.product.itemCount == null ? '${widget.product.itemCount=1}' : widget.product.itemCount.toString(),
                  style: Styles.textStyle14,
                ),
              ),
            ),
            IconButton(
              icon: const Icon(
                Icons.add,
                color: kPrimaryColor,
              ),
              onPressed: increment,
            ),
          ],
        ),
        const Spacer(),
        Padding(
          padding:const EdgeInsets.only(right: 10),
          child: Text(
            widget.product.itemCount == null ? '${widget.product.price}':'${widget.product.price! * widget.product.itemCount!} ج',
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 25,
            ),

            textDirection: TextDirection.rtl,
          )
        ),
      ],
    );
  }
}
