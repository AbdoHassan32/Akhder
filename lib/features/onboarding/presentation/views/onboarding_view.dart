import 'package:akhder/core/widgets/custom_button_widget.dart';
import 'package:akhder/features/onboarding/presentation/views/widgets/onboarding_view_end.dart';
import 'package:akhder/features/onboarding/presentation/views/widgets/onboarding_view_one.dart';
import 'package:akhder/features/onboarding/presentation/views/widgets/onboarding_view_start.dart';
import 'package:akhder/palette.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/utils/app_router.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController controller = PageController();

  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSplashBackgroundColor,
      body: SizedBox(
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Stack(
            textDirection: TextDirection.rtl,
            children: [
              Directionality(
                textDirection: TextDirection.rtl,
                child: PageView(
                  onPageChanged: (index){
                    if(index == 2){
                      isLastPage = true;
                      setState(() {
                      });
                    }else{
                      isLastPage = false;
                      setState(() {
                      });
                    }
                  },
                  controller: controller,
                  children:  const[
                    OnboardingViewStart(),
                    OnboardingViewOne(),
                    OnboardingViewEnd(),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(
                    bottom: 10,
                  ),
                  child: SmoothPageIndicator(
                    textDirection: TextDirection.rtl,
                    controller: controller,
                    count: 3,
                    effect:  WormEffect(
                        dotHeight: MediaQuery.of(context).size.height*0.012,
                        dotWidth: MediaQuery.of(context).size.height*0.012,
                        dotColor: kPrimaryColor.withOpacity(0.3),
                        activeDotColor: kPrimaryColor
                    ),
                  ),
                ),
              ),
              isLastPage == false ?
              Align(
                alignment: Alignment.bottomLeft,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width*0.23,
                  height: MediaQuery.of(context).size.height*0.04,
                  child: CustomButtonWidget(
                      buttonColor: kPrimaryColor,
                      label: 'التالي',
                      onPressed: (){
                        controller.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
                      }
                  ),
                ),
              ):
              Align(
                alignment: Alignment.bottomLeft,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width*0.23,
                  height: MediaQuery.of(context).size.height*0.04,
                  child: CustomButtonWidget(
                      buttonColor: kPrimaryColor,
                      label: 'انتهى',
                      onPressed: () async {
                        final SharedPreferences prefs =await SharedPreferences.getInstance();
                        prefs.setBool('isFirstTime', false);
                        GoRouter.of(context).go(AppRouter.kLoginView);
                      }
                  ),
                ),
              ),
              isLastPage == false ?
              Align(
                alignment: Alignment.bottomRight,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width*0.23,
                  height: MediaQuery.of(context).size.height*0.04,
                  child: CustomButtonWidget(
                      buttonColor: kPrimaryColor,
                      label: 'تخطي',
                      onPressed: (){
                        controller.jumpToPage(2);
                      }
                  ),
                ),
              ):
              Align(
                alignment: Alignment.bottomRight,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width*0.23,
                  height: MediaQuery.of(context).size.height*0.04,
                  child: CustomButtonWidget(
                      buttonColor: kPrimaryColor,
                      label: 'السابق',
                      onPressed: (){
                        controller.previousPage(duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
                      }
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
