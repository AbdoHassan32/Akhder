import 'package:akhder/features/Details-screen/presentation/views/widgets/item_count.dart';
import 'package:akhder/features/Details-screen/presentation/views/widgets/Hidden_text_widget.dart';
import 'package:akhder/features/Details-screen/presentation/views/widgets/favourite_icon.dart';
import 'package:akhder/features/Details-screen/presentation/views/widgets/page_view.dart';
import 'package:akhder/features/Details-screen/presentation/views/widgets/rating_bar.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 8, right: 8),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 30.0, left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.arrow_back_ios),
                    Icon(Icons.upload_rounded),
                  ],
                ),
              ),
              const MyPageView(),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FavoriteButton(),
                  const Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Text(
                      'بذور نعناع شاهين',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('جم'),
                    Text('50'),
                  ],
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              Row(
                children: [
                  ItemCount(),
                  const Spacer(),
                  const Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Text(
                      '75' ' EGP',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ],
              ),
              const Divider(
                height: 30,
                thickness: 1,
                endIndent: 15,
                indent: 15,
              ),
              const SizedBox(
                height: 1,
              ),
              HiddenTextWidget(),
              const Divider(
                height: 30,
                thickness: 1,
                endIndent: 15,
                indent: 15,
              ),
              const Row(
                children: [
                  Icon(Icons.keyboard_arrow_left),
                  StarRate(),
                  Spacer(),
                  Text(
                    'تقيم المنتج',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                onPressed: () {},
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  height: 50,
                  width: 250,
                  child: const Center(
                    child: Text(
                      'أضف للعربة',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}