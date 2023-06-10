import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import 'package:halal_design/controllers/auth_reposiotry.dart';
//import 'package:halal_design/controllers/login_repository.dart';
import 'package:halal_design/screens/constants/color.dart';
import 'package:halal_design/screens/ui/auth_screen/forgot_password.dart';
import 'package:halal_design/screens/widget/custom_text.dart';
import 'package:halal_design/screens/widget/loading.dart';
import 'package:halal_design/screens/widget/text_field_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final authController = Get.put(AuthRepo());
  //final authController = Get.put(LoginRepo());

  bool isHiddenPassword = true;
  bool? isChecked = false;

  void _togglePasswordView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColor().primaryWhite,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 70),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: SvgPicture.asset(
                          'assets/images/svgs/back_arrow.svg')),
                  CustomText(
                    title: 'For Individual',
                    color: AppColor().primaryDark,
                    size: 16,
                    weight: FontWeight.w700,
                  ),
                  Container(),
                ],
              ),
              Gap(Get.height * 0.05),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        title: 'Login into your account',
                        color: AppColor().primaryDark,
                        size: 22,
                        weight: FontWeight.w900,
                      ),
                      Gap(Get.height * 0.01),
                      CustomText(
                        title: 'Continue where you stop.',
                        color: AppColor().primaryDark,
                        size: 14,
                        weight: FontWeight.w500,
                      ),
                    ],
                  ),
                ],
              ),
              Gap(Get.height * 0.04),
              CustomText(
                title: 'Email address',
                color: AppColor().greyColor,
                size: 14,
                weight: FontWeight.w500,
              ),
              Gap(Get.height * 0.01),
              CustomTextField(
                hint: "Enter email address",
                hintColor: AppColor().greyColor.withOpacity(0.3),
                textEditingController: authController.emailController,
                validate: (value) {
                  if (value!.isEmpty) {
                    return 'Email address must not be empty';
                  }
                  // else if (!RegExp(
                  //         r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                  //     .hasMatch(value)) {
                  //   return "enter a valid email address";
                  // }
                  return null;
                },
              ),
              Gap(Get.height * 0.015),
              CustomText(
                title: 'Password',
                color: AppColor().greyColor,
                size: 14,
                weight: FontWeight.w500,
              ),
              Gap(Get.height * 0.01),
              CustomTextField(
                textEditingController: authController.passwordController,
                hint: "Password",
                hintColor: AppColor().greyColor.withOpacity(0.3),
                obscure: isHiddenPassword,
                validate: (value) {
                  if (value!.isEmpty) {
                    return 'password must not be empty';
                  } else if (value.length < 8) {
                    return 'password must not be less than 8 character';
                  }
                  return null;
                },
                suffixIcon: InkWell(
                  onTap: _togglePasswordView,
                  child: Icon(
                    isHiddenPassword ? Icons.visibility : Icons.visibility_off,
                    color: isHiddenPassword
                        ? Colors.grey.withOpacity(0.5)
                        : AppColor().greyColor,
                  ),
                ),
              ),
              Gap(Get.height * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Get.to((const ForgotPasswordPage()));
                    },
                    child: CustomText(
                      title: 'Forgot Password',
                      color: AppColor().greyColor,
                      size: 14,
                      weight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Gap(Get.height * 0.02),
              Obx(() {
                return InkWell(
                  onTap: () {
                    if (authController.signInStatus != SignInStatus.loading &&
                        _formKey.currentState!.validate()) {
                      authController.login();
                    }
                  },
                  child: Container(
                    height: 50,
                    width: Get.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(36),
                      color: AppColor().primaryColorPurple,
                    ),
                    child:
                        (authController.signInStatus == SignInStatus.loading)
                            ? LoadingWidget()
                            : Center(
                                child: CustomText(
                                title: 'Login',
                                color: AppColor().primaryWhite,
                                weight: FontWeight.w600,
                                size: 16,
                              )),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
