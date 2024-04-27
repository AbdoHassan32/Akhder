import 'package:akhder/core/utils/styles.dart';
import 'package:akhder/features/favorites/presentation/views/widgets/favorite_item.dart';
import 'package:flutter/material.dart';

class FavoritesViewBody extends StatelessWidget {
  const FavoritesViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  return const FavoriteItem();
                },
                separatorBuilder: (context, index) => const Divider(
                      color: Colors.black26,
                      height: 2,
                    ),
                itemCount: 8
            ),
          ),
        ],
      ),
    );
  }
}
