import 'dart:ui';

import 'package:akhder/core/utils/styles.dart';
import 'package:akhder/core/widgets/background_image_widget.dart';
import 'package:akhder/core/widgets/custom_button_widget.dart';
import 'package:akhder/core/widgets/custom_textfield_widget.dart';
import 'package:akhder/palette.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../core/utils/app_router.dart';
import '../../manager/login_cubit/login_cubit.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({Key? key}) : super(key: key);

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController? emailController = null;
  final TextEditingController? passwordController = null;
  final User? user = FirebaseAuth.instance.currentUser;
  bool isLoading = false;
  String? password;
  String? email;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        const BackgroundImageWidget(),
        BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginLoading) {
              isLoading = true;
            } else if (state is LoginSuccess) {
              isLoading = false;
              GoRouter.of(context).go(AppRouter.kHomeView);
            } else if (state is LoginFailure) {
              isLoading = false;
              showSnackBar(context, state.errMessage);
            }          },
          builder: (context, state) {
            return ModalProgressHUD(
              inAsyncCall: isLoading,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                  ),
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          'تسجيل الدخول',
                          style: Styles.textStyle26,
                          textDirection: TextDirection.rtl,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'ادخل بريدك الإلكتروني و كلمة السر الخاصة بك',
                          style: Styles.textStyle16,
                          textDirection: TextDirection.rtl,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        CustomTextFormField(
                            onChanged: (data) {
                              email = data;
                            },
                            inputType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Email is required";
                              }
                              else{
                                return '';
                              }
                            },
                            isPassword: false,
                            hintText: 'بريدك الإلكتروني'),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextFormField(
                          onChanged: (data) {
                            password = data;
                          },
                          inputType: TextInputType.visiblePassword,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Password is required";
                            } else if (value.length < 8) {
                              return "Password length must be 8 characters or more";
                            }
                            else{
                              return '';
                            }
                          },
                          isPassword: true,
                          hintText: 'كلمة السر',
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'هل نسيت كلمة السر ؟',
                          style: Styles.textStyle14,
                          textDirection: TextDirection.rtl,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        CustomButtonWidget(
                            buttonColor: kPrimaryColor,
                            label: 'سجل',
                            onPressed: () {

                            }),
                        const SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          textDirection: TextDirection.rtl,
                          children: [
                            const Text(
                              'لا تملك حساباً ؟',
                              textDirection: TextDirection.rtl,
                              style: Styles.textStyle14,
                            ),
                            TextButton(
                              child: Text(
                                'انشأ حساباً الآن',
                                textDirection: TextDirection.rtl,
                                style: Styles.textStyle14.copyWith(
                                  color: kPrimaryColor,
                                ),
                              ),
                              onPressed: () {
                                GoRouter.of(context).push(AppRouter.kRegisterView);
                              },
                            ),
                          ],
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            'أو سجل بإستخدام',
                            style: Styles.textStyle14.copyWith(
                              color: kGreyTextColor,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            const Spacer(
                              flex: 1,
                            ),
                            IconButton(
                              onPressed: () {
                                BlocProvider.of<LoginCubit>(context)
                                    .signInWithFacebook();
                              },
                              icon: const Icon(
                                FontAwesomeIcons.facebook,
                                size: 40,
                              ),
                            ),
                            const Spacer(
                              flex: 1,
                            ),
                            IconButton(
                              onPressed: () {
                                BlocProvider.of<LoginCubit>(context)
                                    .signInWithGoogle();
                              },
                              icon: const Icon(
                                FontAwesomeIcons.google,
                                size: 40,
                              ),
                            ),
                            const Spacer(
                              flex: 1,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

void showSnackBar(BuildContext context, String message, {Color? color}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: color ?? Colors.red[800],
      content: Text(
        message,
      ),
    ),
  );
}
