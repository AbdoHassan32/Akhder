import 'package:akhder/core/utils/app_router.dart';
import 'package:akhder/palette.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../../core/utils/styles.dart';

class NavigationDrawerWidget extends StatelessWidget {
  NavigationDrawerWidget({Key? key}) : super(key: key);
  final User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Drawer(

      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            currentAccountPictureSize: const Size.square(67),
            decoration: const BoxDecoration(color: Colors.white),
            currentAccountPicture: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Image.network(user!.photoURL!, fit: BoxFit.fill)),
            accountName: Text(
              user!.displayName!,
              style: Styles.textStyle20.copyWith(
                color: Colors.black,
                fontFamily: 'Arial',
              ),
            ),
            accountEmail: Text(
              user!.email!,
              style: Styles.textStyle20.copyWith(
                color: kGreyTextColor,
                fontFamily: 'Arial',
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.account_circle_outlined),
            title: const Text('Account'),
            onTap: () {},
          ),
          ListTile(

            leading: const Icon(Icons.message_outlined),
            title: const Text('Messages'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.share_outlined),
            title: const Text('Share'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.notifications_none_outlined),
            title: const Text('Notifications'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.settings_outlined),
            title: const Text('Settings'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.logout_outlined),
            title: const Text('Logout'),
            onTap: () {
              GoogleSignIn googleSignIn = GoogleSignIn();
              googleSignIn.disconnect();
              GoRouter.of(context).go(AppRouter.kLoginView);
            },
          ),
        ],
      ),
    );
  }
}
