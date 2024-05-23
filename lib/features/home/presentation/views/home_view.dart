import 'package:akhder/features/Cart/presentation/views/widgets/cart_view_body.dart';
import 'package:akhder/features/favorites/presentation/views/widgets/favorites_view_body.dart';
import 'package:akhder/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:akhder/features/home/presentation/views/widgets/navigation_drawer_widget.dart';
import 'package:akhder/palette.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectedItemIndex = 0;
  List<Widget> body = [
    const HomeViewBody(),
    const CartViewBody(),
    FavoritesViewBody(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      endDrawer: NavigationDrawerWidget(),
      bottomNavigationBar: SizedBox(
        height: 70,
        child: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_rounded), label: 'الصفحة الرئيسية'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_rounded), label: 'العربة'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: 'المفضلة'),
          ],
          onTap: (index) {
            selectedItemIndex = index;
            setState(() {
              if (selectedItemIndex == 0) {}
            });
          },
          selectedFontSize: 14,
          elevation: 10,
          iconSize: 25,
          currentIndex: selectedItemIndex,
          selectedItemColor: kPrimaryColor,
        ),
      ),
      body: SafeArea(child: body[selectedItemIndex]),
    );
  }
}
