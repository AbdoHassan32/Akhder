import 'package:akhder/features/auth/presentation/views/widgets/login_view_body.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../home/data/models/product.dart';

class FavoriteButton extends StatefulWidget {
  final Product product;

  const FavoriteButton({super.key, required this.product});
  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  final User? user = FirebaseAuth.instance.currentUser;

  CollectionReference favorites =
      FirebaseFirestore.instance.collection('favorites');

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(
          widget.product.isFav != null ? widget.product.isFav! ? Icons.favorite : Icons.favorite_border  :Icons.favorite_border,
          color: widget.product.isFav != null ? widget.product.isFav! ? Colors.red : null : null,

        ),
        onPressed: () async {
          if ((widget.product.isFav == false && widget.product.docId == '')||(widget.product.isFav == null && widget.product.docId == null)) {
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
            }
            ).then((DocumentReference doc) {
              widget.product.docId = doc.id;
              favorites.doc(widget.product.docId).update({
                'docId': widget.product.docId,
              });
            });

            showSnackBar(
              context,
              'Added to Favorites !',
              color: Colors.green,
            );
            setState(() {

            });
          }
          else
          {
            setState(() {

            });
            showSnackBar(
              context,
              'Removed from Favorites !',
              color: Colors.redAccent,
            );

            await FirebaseFirestore.instance
                .runTransaction((Transaction myTransaction) async {
                  print('doc id is ${widget.product.docId}');
              myTransaction.delete(favorites.doc(widget.product.docId));
            });
            widget.product.isFav = false;
            widget.product.docId = '';
            widget.product.userId='';
          }
          setState(()  {
          });
        });
  }
}
