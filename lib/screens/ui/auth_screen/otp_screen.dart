
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halal_design/controllers/auth_reposiotry.dart';
import 'package:halal_design/screens/constants/color.dart';
import 'package:halal_design/screens/widget/custom_text.dart';
import 'package:halal_design/screens/widget/loading.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

class OtpScreen extends StatefulWidget {
  final String? title, userId;
  const OtpScreen({super.key, this.userId, this.title});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final authController = Get.put(AuthRepo());
  TextEditingController controller = TextEditingController(text: "");
  String thisText = "";
  String? otpText;
  int pinLength = 4;
  bool hasError = false;
  bool isLoading = false;
  String? errorMessage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColor().primaryWhite,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
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
                    child:
                        SvgPicture.asset('assets/images/svgs/back_arrow.svg')),
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
                      title: 'Verify your email',
                      color: AppColor().primaryDark,
                      size: 22,
                      weight: FontWeight.w900,
                    ),
                    Gap(Get.height * 0.01),
                    CustomText(
                      title:
                          'Enter the 6-digit code sent to \n${authController.emailController.text}',
                      color: AppColor().primaryDark,
                      size: 14,
                      weight: FontWeight.w500,
                    ),
                  ],
                ),
              ],
            ),
            Gap(Get.height * 0.08),
            PinCodeTextField(
              pinBoxOuterPadding: const EdgeInsets.symmetric(horizontal: 2),
              pinBoxRadius: 10,
              autofocus: true,
              controller: controller,
              hideCharacter: false,
              highlight: true,
              highlightColor: AppColor().greyColor,
              defaultBorderColor: AppColor().lightgreyColor,
              hasTextBorderColor: AppColor().brightPurple,
              highlightPinBoxColor: AppColor().primaryWhite,
              maxLength: 6,
              hasError: hasError,
              maskCharacter: thisText,
              onTextChanged: (text) {
                setState(() {
                  hasError = false;
                });
              },
              onDone: (text) {
                otpText = text;
                print("DONE $otpText");
              },
              pinBoxWidth: 50,
              pinBoxHeight: 50,
              hasUnderline: false,
              pinBoxDecoration:
                  ProvidedPinBoxDecoration.defaultPinBoxDecoration,
              pinTextStyle: const TextStyle(fontSize: 15.0),
              pinTextAnimatedSwitcherTransition:
                  ProvidedPinBoxTextAnimation.scalingTransition,
              //                    pinBoxColor: Colors.green[100],
              pinTextAnimatedSwitcherDuration:
                  const Duration(milliseconds: 300),
              //                    highlightAnimation: true,
              highlightAnimationBeginColor: Colors.black,
              highlightAnimationEndColor: Colors.white12,
              keyboardType: TextInputType.number,
            ),
            Gap(Get.height * 0.02),
            CustomText(
              title: 'Didn’t receive the code?',
              color: AppColor().primaryDark,
              size: 14,
              weight: FontWeight.w500,
            ),
            Gap(Get.height * 0.02),
            Text.rich(
              TextSpan(
                text: "Resend ",
                style: GoogleFonts.nunito(
                    textStyle: TextStyle(
                      color: AppColor().primaryColorGreen,
                      fontSize: 14,
                    ),
                    fontWeight: FontWeight.w500),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    // authController.resendOTP(id: widget.userId);
                  },
                children: <TextSpan>[
                  TextSpan(
                    text: "in ",
                    style: GoogleFonts.nunito(
                      textStyle: TextStyle(
                          color: AppColor().primaryDark,
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                    ),
                  ),
                  TextSpan(
                    text: "1:00",
                    style: GoogleFonts.nunito(
                      textStyle: TextStyle(
                          color: AppColor().primaryRed,
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Obx(() {
              return InkWell(
                onTap: () {
                  if (otpText == null || otpText == '') {
                    Get.snackbar("Alert",
                        "Enter the otp sent to ${authController.emailController.text} to continue!");
                  } else {
                    if (authController.otpValidateStatus !=
                            OtpValidateStatus.loading ||
                        authController.otpForgotVerifyStatus !=
                            OtpForgotVerifyStatus.loading) {
                      authController.validateAccount(
                        otp: otpText,
                        userId: widget.userId,
                      );
                      if (widget.title == 'Account') {
                      } else {
                        // authController.validateForgotResetPassword(
                        //   otp: otpText);
                      }
                    }
                  }
                },
                child: Container(
                  height: 50,
                  width: Get.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(36),
                    color: AppColor().primaryColorPurple,
                  ),
                  child: (authController.otpValidateStatus ==
                              OtpValidateStatus.loading ||
                          authController.otpForgotVerifyStatus ==
                              OtpForgotVerifyStatus.loading)
                      ? LoadingWidget()
                      : Center(
                          child: CustomText(
                          title: 'Continue',
                          color: AppColor().primaryWhite,
                          weight: FontWeight.w600,
                          size: 16,
                        )),
                ),
              );
            }),
            // CustomFillButton(
            //   onTap: () {
            //     Get.to(() => const Dashboard());
            //   },
            //   height: 46,
            //   width: MediaQuery.of(context).size.width,
            //   buttonText: 'Continue',
            //   textSize: 14,
            //   textColor: AppColor().primaryWhite,
            //   buttonColor: AppColor().primaryColorPurple,
            //   boarderColor: AppColor().primaryColorPurple,
            //   borderRadius: BorderRadius.circular(36),
            //   fontWeight: FontWeight.w600,
            // ),
          ],
        ),
      ),
    );
  }
}
