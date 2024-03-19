import 'package:akhder/features/auth/presentation/views/widgets/login_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_button_widget.dart';
import '../../../../../core/widgets/custom_textfield_widget.dart';
import '../../../../../palette.dart';
import '../../manager/login_cubit/login_cubit.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({Key? key}) : super(key: key);

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController? emailController = null;
  final TextEditingController? passwordController = null;
  bool isLoading = false;
  String ? password;
  String ? email;
  String ? userName;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          AssetsData.blurredBackground,
          fit: BoxFit.fill,
          height: double.infinity,
          width: double.infinity,
        ),
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
            }
          },
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
                          'إنشاء حساب',
                          style: Styles.textStyle26,
                          textDirection: TextDirection.rtl,

                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'ادخل بياناتك للإستمرار',
                          style: Styles.textStyle16,
                          textDirection: TextDirection.rtl,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        CustomTextFormField(
                            onChanged: (data) {
                              userName = data;
                            },
                            inputType: TextInputType.name,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "username is required";
                              }
                            },
                            isPassword: false,
                            hintText: 'اسم المستخدم'),
                        const SizedBox(
                          height: 15,
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
                            },
                            isPassword: false,
                            hintText: 'بريدك الإلكتروني'),
                        const SizedBox(
                          height: 15,
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
                          },
                          isPassword: true,
                          hintText: 'كلمة السر',
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        CustomButtonWidget(
                            buttonColor: kPrimaryColor,
                            label: 'انشأ حساباً',
                            onPressed: () {}),
                        const SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          textDirection: TextDirection.rtl,
                          children: [
                            const Text(
                              'تملك حساباً بالفعل ؟',
                              textDirection: TextDirection.rtl,
                              style: Styles.textStyle14,
                            ),
                            TextButton(
                              child: Text(
                                'سجل الآن',
                                textDirection: TextDirection.rtl,
                                style: Styles.textStyle14.copyWith(
                                  color: kPrimaryColor,
                                ),
                              ),
                              onPressed: () {
                                GoRouter.of(context).push(AppRouter.kLoginView);

                              },
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        )
      ],
    );
  }
}
