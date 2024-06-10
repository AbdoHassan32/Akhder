import 'package:akhder/palette.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../../core/widgets/custom_button_widget.dart';
import '../../../data/models/product.dart';

class AddToCartButton extends StatelessWidget {
  AddToCartButton({Key? key, required this.product}) : super(key: key);
  final User? user = FirebaseAuth.instance.currentUser;
  final Product product;
 final CollectionReference cart = FirebaseFirestore.instance.collection('cart');
  @override
  Widget build(BuildContext context) {
    return CustomButtonWidget(
      onPressed: () async {
        var a = await FirebaseFirestore.instance
            .collection('cart')
            .doc(product.docId)
            .get();
        if ((product.docId == '') || (product.docId == null )||a.exists==false) {
          product.userId = user!.email;
          product.itemCountInFirebase = product.itemCount;
          print(user!.email);
          print(product.userId);

          cart.add({
            'name': product.name,
            'description': product.description,
            'imageUrl': product.imageUrl,
            'weight': product.weight,
            'stockNum': product.stockNum,
            'kgOrL': product.kgOrL,
            'price': product.price! * product.itemCount!,
            'createdAt': DateTime.now(),
            'userId': product.userId,
            'id': product.id,
            'category': null,
            'isFav': product.isFav,
            'docId': product.docId,
            'favDocId':product.favDocId,
            'itemCount': product.itemCount,
            'itemCountInFirebase': product.itemCount,
          }).then((DocumentReference doc) {
            product.docId = doc.id;
            cart.doc(product.docId).update({
              'docId': product.docId,
            });
          });
          Fluttertoast.showToast(
            msg: 'تم إضافة المنتج إلي العربة !',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 1,
            backgroundColor: kSecondaryColor,
            textColor: Colors.white,
            fontSize: 20,
          );

        } else {
          Fluttertoast.showToast(
            msg: 'تم زيادة المنتج في العربة !',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.deepOrangeAccent,
            textColor: Colors.white,
            fontSize: 18,
          );

          await FirebaseFirestore.instance
              .runTransaction((Transaction myTransaction) async {
            myTransaction.update(cart.doc(product.docId), {
              'itemCount': product.itemCountInFirebase! + product.itemCount!,
              'itemCountInFirebase':
                  product.itemCountInFirebase! + product.itemCount!,
            });
          });

          product.itemCountInFirebase =
              product.itemCountInFirebase! + product.itemCount!;
        }
      },
      buttonColor: kPrimaryColor,
      label: 'أضف للعربة',
    );
  }
}
