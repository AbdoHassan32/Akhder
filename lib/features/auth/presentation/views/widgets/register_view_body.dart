import 'package:akhder/core/widgets/background_image_widget.dart';
import 'package:akhder/features/auth/presentation/views/widgets/login_view_body.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_button_widget.dart';
import '../../../../../core/widgets/custom_textfield_widget.dart';
import '../../../../../palette.dart';
import '../../manager/login_cubit/login_cubit.dart';
import '../../manager/register_cubit/register_cubit.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({Key? key}) : super(key: key);

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController? emailController = null;
  final TextEditingController? passwordController = null;
  final User? user = FirebaseAuth.instance.currentUser;
  bool isLoading = false;
  String? password;
  String? email;
  String? userName;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        const BackgroundImageWidget(),
        BlocConsumer<RegisterCubit, RegisterState>(
          listener: (context, state) {
            if (state is RegisterLoading) {
              isLoading = true;
            } else if (state is RegisterSuccess) {
              isLoading = false;
              GoRouter.of(context).go(AppRouter.kHomeView);
            } else if (state is RegisterFailure) {
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
                                return "اسم المستخدم مطلوب";
                              } else {
                                return '';
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
                                return "البريد الإلكتروني مطلوب";
                              } else {
                                return '';
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
                              return "كلمة السر مطلوبة";
                            } else if (value.length < 8) {
                              return "كلمة السر يجب أن تكون 8 احرف او اكثر";
                            } else {
                              return '';
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
                            onPressed: () {

                                BlocProvider.of<RegisterCubit>(context)
                                    .registerUser(
                                        email: email!, password: password!,userName: userName);
                            }),
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
