import 'package:akhder/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/utils/app_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({Key? key}) : super(key: key);

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    navigateSplash();
  }

  void navigateSplash() {
    Future.delayed(
      const Duration(seconds: 3),
      () async {
        SharedPreferences prefs=await SharedPreferences.getInstance();
        if(prefs.getBool('isFirstTime')==null)
        {
          return GoRouter.of(context).go(AppRouter.kOnboardingView);
        }
        else if (prefs.getBool('isFirstTime')==false){
          return GoRouter.of(context).go(AppRouter.kLoginView);
        }
        },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AssetsData.logoWhite,
            height: MediaQuery.of(context).size.height * 0.15,
          ),
        ],
      ),
    );
  }
}
