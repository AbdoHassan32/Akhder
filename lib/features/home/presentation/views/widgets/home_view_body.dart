import 'package:akhder/core/utils/assets.dart';
import 'package:akhder/core/widgets/custom_textfield_widget.dart';
import 'package:akhder/features/home/presentation/views/widgets/custom_category_title_widget.dart';
import 'package:akhder/features/home/presentation/views/widgets/custom_item_list_view.dart';
import 'package:akhder/features/home/presentation/views/widgets/custom_item_widget.dart';
import 'package:akhder/features/home/presentation/views/widgets/navigation_drawer_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_button_widget.dart';
import '../../../../../palette.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        physics:const BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
              ),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                      icon: const Icon(
                        FontAwesomeIcons.bars,
                      )),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.21,
                  ),
                  Image.asset(
                    AssetsData.logoPetrol,
                    height: MediaQuery.of(context).size.height * 0.07,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
              ),
              child: TextField(
                textDirection: TextDirection.rtl,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(width: 0, color: Colors.white),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 0, color: Colors.white),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 0, color: Colors.white),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  suffixIcon: const Icon(
                    Icons.search,
                    color: Colors.black,
                    size: 25,
                  ),
                  hintText: 'ابحث',
                  hintTextDirection: TextDirection.rtl,
                  fillColor: const Color(0xffF2F3F2),
                  filled: true,
                ),
              ),
            ),
            CustomCategoryTitleWidget(
                categoryTitle: 'عروض خاصة', onPressed: () {}),
            const SizedBox(
              height: 20,
            ),
            const CustomItemListView(),
            const SizedBox(
              height: 15,
            ),
            CustomCategoryTitleWidget(
                categoryTitle: 'أفضل المبيعات', onPressed: () {}),
            const SizedBox(
              height: 20,
            ),
            const CustomItemListView(),
            const SizedBox(
              height: 15,
            ),
            CustomCategoryTitleWidget(
                categoryTitle: 'مبيدات حشرية', onPressed: () {}),
            const SizedBox(
              height: 20,
            ),
            const CustomItemListView(),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
