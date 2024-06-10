import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../../palette.dart';
import '../../../../home/data/models/product.dart';

class FavoriteButton extends StatefulWidget {
  final Product product;

  const FavoriteButton({super.key, required this.product});
  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  final User? user = FirebaseAuth.instance.currentUser;
  final CollectionReference favorites =
      FirebaseFirestore.instance.collection('favorites');
  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(
          widget.product.isFav != null ? widget.product.isFav! ? Icons.favorite : Icons.favorite_border  :Icons.favorite_border,
          color: widget.product.isFav != null ? widget.product.isFav! ? Colors.red :null:null ,

        ),
        onPressed: () async {

          if ((widget.product.isFav == false && widget.product.favDocId == '')||(widget.product.isFav == null && widget.product.favDocId == null)) {
            widget.product.isFav = true;
            widget.product.userId = user!.email;
            print(user!.email);
            print(widget.product.userId);

            favorites.add({
              'name': widget.product.name,
              'description': widget.product.description,
              'imageUrl': widget.product.imageUrl,
              'weight': widget.product.weight,
              'stockNum': widget.product.stockNum,
              'kgOrL': widget.product.kgOrL,
              'price': widget.product.price,
              'createdAt': DateTime.now(),
              'userId': widget.product.userId,
              'id':widget.product.id,
              'category' : null,
              'isFav':widget.product.isFav,
              'docId':widget.product.docId,
              'favDocId':widget.product.favDocId,
              'itemCount': null,
              'itemCountInFirebase':null ,
            }
            ).then((DocumentReference doc) {
              widget.product.favDocId = doc.id;
              favorites.doc(widget.product.favDocId).update({
                'favDocId': widget.product.favDocId,
              });
            });

            Fluttertoast.showToast(
              msg: 'تم إضافة المنتج إلي المفضلة !',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.TOP,
              timeInSecForIosWeb: 1,
              backgroundColor: kSecondaryColor,
              textColor: Colors.white,
              fontSize: 20,
            );
            setState(() {

            });
          }
          else
          {
            setState(() {

            });
            Fluttertoast.showToast(
              msg: 'تم حذف المنتج من المفضلة !',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.TOP,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.redAccent,
              textColor: Colors.white,
              fontSize: 20,
            );

            await FirebaseFirestore.instance
                .runTransaction((Transaction myTransaction) async {
                  print('doc id is ${widget.product.favDocId}');
              myTransaction.delete(favorites.doc(widget.product.favDocId));
            });
            widget.product.isFav = false;
            widget.product.favDocId = '';
            widget.product.userId='';
          }
          setState(()  {
          });
        });
  }
}
