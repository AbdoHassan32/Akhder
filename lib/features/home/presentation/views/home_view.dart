import 'package:akhder/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:akhder/features/home/presentation/views/widgets/navigation_drawer_widget.dart';
import 'package:akhder/palette.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/assets.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      drawer: NavigationDrawerWidget(),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: 'home'),
          BottomNavigationBarItem(icon: Icon(Icons.search),label : 'search'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite),label : 'favorite'),

        ],
        selectedItemColor: kPrimaryColor,
      ),
      body:const SafeArea(child: HomeViewBody()),
    );
  }
}
