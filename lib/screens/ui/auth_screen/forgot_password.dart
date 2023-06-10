import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:halal_design/controllers/auth_reposiotry.dart';
import 'package:halal_design/screens/constants/color.dart';
import 'package:halal_design/screens/ui/auth_screen/otp_screen.dart';
import 'package:halal_design/screens/widget/custom_text.dart';
import 'package:halal_design/screens/widget/loading.dart';
import 'package:halal_design/screens/widget/text_field_widget.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  bool isHiddenPassword = true;
  bool? isChecked = false;

  void _togglePasswordView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final authController = Get.put(AuthRepo());

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColor().primaryWhite,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: Get.height * 0.06,
        ),
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
                        title: 'Forgot Password',
                        color: AppColor().primaryDark,
                        size: 22,
                        weight: FontWeight.w900,
                      ),
                      Gap(Get.height * 0.01),
                      CustomText(
                        title: 'Provide your registered bayar email.',
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
                  } else if (!RegExp(
                          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                      .hasMatch(value)) {
                    return "enter a valid email address";
                  }
                  return null;
                },
              ),
              const Spacer(),
              Gap(Get.height * 0.02),
              Obx(() {
                return InkWell(
                  onTap: () {
                    if (authController.otpForgotVerifyStatus !=
                            OtpForgotVerifyStatus.loading &&
                        _formKey.currentState!.validate()) {
                     // authController.forgotResetPassword();
                      Get.to(const OtpScreen(userId: '',));
                    }
                  },
                  child: Container(
                    height: 50,
                    width: Get.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(36),
                      color: AppColor().primaryColorPurple,
                    ),
                    child: (authController.otpForgotVerifyStatus ==
                            OtpForgotVerifyStatus.loading)
                        ?  LoadingWidget()
                        : Center(
                            child: CustomText(
                            title: 'Submit',
                            color: AppColor().primaryWhite,
                            weight: FontWeight.w600,
                            size: 16,
                          )),
                  ),
                );
              }),
              Gap(Get.height * 0.2),
            ],
          ),
        ),
      ),
    );
  }
}
