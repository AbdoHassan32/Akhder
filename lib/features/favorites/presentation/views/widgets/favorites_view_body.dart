import 'package:akhder/core/utils/styles.dart';
import 'package:akhder/features/favorites/presentation/views/widgets/favorite_item.dart';
import 'package:akhder/features/home/data/models/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FavoritesViewBody extends StatelessWidget {
   FavoritesViewBody({Key? key}) : super(key: key);
  final CollectionReference favorites =
      FirebaseFirestore.instance.collection('favorites');
  final User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: favorites.orderBy('createdAt').get(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Product> productList = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            productList.add(Product.fromJson(snapshot.data!.docs[i]));
          }
          return Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(
              textDirection: TextDirection.rtl,
              children: [
                const Text(
                  'المفضلة',
                  style: Styles.textStyle24,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Divider(
                  thickness: 0.5,
                ),
                Expanded(
                  child: ListView.separated(
                      padding: const EdgeInsets.only(
                        left: 20,
                        top: 10,
                        right: 20,
                        bottom: 50,
                      ),
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return productList[index].userId == user!.email ?FavoriteItem(
                                favProduct: productList[index],
                              ):Container();
                      },
                      separatorBuilder: (context, index) => const Divider(
                            color: Colors.black26,
                            height: 2,
                          ),
                      itemCount: productList.length),
                ),
              ],
            ),
          );
        } else {
          return const Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: SizedBox(
              child: Column(
                textDirection: TextDirection.rtl,
                children: [
                  Text(
                    'المفضلة',
                    style: Styles.textStyle24,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Divider(
                    thickness: 0.5,
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  CircularProgressIndicator(),
                  Spacer(
                    flex: 1,
                  )
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
