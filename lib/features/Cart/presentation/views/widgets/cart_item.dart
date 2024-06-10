import 'package:akhder/features/home/data/models/product.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:akhder/features/Details-screen/presentation/views/widgets/item_count.dart';

import '../../../../../core/utils/styles.dart';

class CartItem extends StatelessWidget {
   CartItem({super.key, required this.product});
final Product product;
   final CollectionReference cart =
   FirebaseFirestore.instance.collection('cart');
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height:140,
        color: Colors.white,
        child: Row(
          textDirection: TextDirection.rtl,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: CachedNetworkImage(
                imageUrl: product.imageUrl!,
                height: MediaQuery.of(context).size.height*0.1,
                width: MediaQuery.of(context).size.width*0.14,

              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                textDirection:TextDirection.rtl,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width*0.44,
                      child: Text(
                      product.name!,
                        textDirection:TextDirection.rtl,
                        style: Styles.textStyle18.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        overflow: TextOverflow.ellipsis,
                        maxLines:1,
                        softWrap: true,
                      ),
                    ),
                  ),
                     Padding(
                      padding:  const EdgeInsets.only(right: 12),
                      child:  Text(product.kgOrL! ? '${product.weight!} كجم ' : '${product.weight!} لتر ',
                        textDirection:TextDirection.rtl,
                        style: Styles.textStyle16,
                      ),
                    ),
                  const Spacer(
                    flex: 1,
                  ),
                  ItemCount(product: product,),
                  const Spacer(
                    flex: 1,
                  ),
                ],
              ),
            ),
            const Spacer(
              flex: 1,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(onPressed: () async {
                  await FirebaseFirestore.instance
                      .runTransaction((Transaction myTransaction) async {
                    print('doc id is ${product.docId}');
                    myTransaction.delete(cart.doc(product.docId));
                  });
                  product.docId = '';
                  product.itemCountInFirebase=0;
                  product.userId='';
                },
                 icon: const Icon(
                  Icons.close
                 ),),
                const Spacer(
                  flex: 1,
                ),
                Text('${(product.price!*product.itemCount!).toInt()} ج.م',
                    textDirection: TextDirection.rtl,
                    style: Styles.textStyle18),
                const Spacer(
                  flex: 1,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
