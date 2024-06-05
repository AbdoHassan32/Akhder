import 'package:akhder/palette.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';
import '../../../../home/data/models/product.dart';

class ItemCount extends StatefulWidget {
const ItemCount({super.key, required this.product});
final Product product ;
  @override
  _ItemCountState createState() => _ItemCountState();
}

class _ItemCountState extends State<ItemCount> {
  CollectionReference cart =
  FirebaseFirestore.instance.collection('cart');

  Future<void> increment() async {
    if (widget.product.itemCount! < 20) {
      await FirebaseFirestore.instance
          .runTransaction((Transaction myTransaction) async {
        myTransaction.update(cart.doc(widget.product.docId), {
          'itemCount': widget.product.itemCount! + 1,
          'itemCountInFirebase': widget.product.itemCountInFirebase! + 1,
        });
      });
      widget.product.itemCount = 1 + widget.product.itemCount! ;
      widget.product.itemCountInFirebase = widget.product.itemCountInFirebase! + 1 ;
    }
    setState(() {
    });
  }

  Future<void> decrement() async {
    if (widget.product.itemCount! > 1) {
      await FirebaseFirestore.instance
          .runTransaction((Transaction myTransaction) async {
        myTransaction.update(cart.doc(widget.product.docId), {
          'itemCount': widget.product.itemCount! - 1,
          'itemCountInFirebase': widget.product.itemCountInFirebase! - 1,
        });
      });

    widget.product.itemCount= widget.product.itemCount! - 1;
    widget.product.itemCountInFirebase = widget.product.itemCountInFirebase! - 1;
    }
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
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
              widget.product.itemCount.toString(),
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
    );
  }
}