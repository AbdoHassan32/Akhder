import 'package:akhder/core/utils/app_router.dart';
import 'package:akhder/palette.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
                child: user?.photoURL == null
                    ? Icon(
                        Icons.person_sharp,
                        color: kPrimaryColor,
                        size: MediaQuery.of(context).size.height * 0.08,
                      )
                    : CachedNetworkImage(
                        imageUrl: user!.photoURL!,
                        fit: BoxFit.fill,
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) =>
                                CircularProgressIndicator(
                          value: downloadProgress.progress,
                          color: kPrimaryColor,
                          strokeWidth: 2,
                        ),
                        errorWidget: (context, url, error) {
                          return Icon(
                            Icons.person_sharp,
                            color: kPrimaryColor,
                            size: MediaQuery.of(context).size.height * 0.08,
                          );
                        },
                      )),
            accountName: Text(
              user?.displayName ==null ? 'User' : user!.displayName!,
              style: Styles.textStyle20.copyWith(
                color: Colors.black,
                fontFamily: 'Arial',
              ),
            ),
            accountEmail: Text(
              user?.email == null ? 'Email' : user!.email!,
              style: Styles.textStyle20.copyWith(
                color: kGreyTextColor,
                fontFamily: 'Arial',
              ),
            ),
          ),
          ListTile(
            titleTextStyle: Styles.textStyle18
                .copyWith(fontFamily: 'Arial', fontWeight: FontWeight.bold),
            leading: const Icon(Icons.location_searching_rounded),
            title: const Text(
              'Detect Diseases',
            ),
            onTap: () {
              GoRouter.of(context).push(AppRouter.kDiseaseDetectionView);
            },
            tileColor: kPrimaryColor,
            textColor: Colors.white,
            iconColor: Colors.white,
          ),
          const Divider(
            height: 0.5,
            thickness: 0.5,
            color: kSecondaryColor,
          ),
          ListTile(
            titleTextStyle: Styles.textStyle18
                .copyWith(fontFamily: 'Arial', fontWeight: FontWeight.bold),
            leading: const Icon(Icons.safety_check),
            title: const Text('Check your plant'),
            onTap: () {},
            tileColor: kPrimaryColor,
            textColor: Colors.white,
            iconColor: Colors.white,
          ),
          const Divider(
            height: 0.5,
            thickness: 0.5,
            color: kSecondaryColor,
          ),
          ListTile(
            leading: const Icon(Icons.share_outlined),
            title: const Text('Share'),
            onTap: () {},
          ),
          const Divider(
            height: 0.5,
            thickness: 0.5,
            color: kSecondaryColor,
          ),
          ListTile(
            leading: const Icon(Icons.notifications_none_outlined),
            title: const Text('Notifications'),
            onTap: () {},
          ),
          const Divider(
            height: 0.5,
            thickness: 0.5,
            color: kSecondaryColor,
          ),
          ListTile(
            leading: const Icon(Icons.settings_outlined),
            title: const Text('Settings'),
            onTap: () {},
          ),
          const Divider(
            height: 0.5,
            thickness: 0.5,
            color: kSecondaryColor,
          ),
          ListTile(
            leading: const Icon(Icons.logout_outlined),
            title: const Text('Logout'),
            onTap: () async {
              final SharedPreferences pref =
                  await SharedPreferences.getInstance();
              pref.setBool('isLoggedIn', false);
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
