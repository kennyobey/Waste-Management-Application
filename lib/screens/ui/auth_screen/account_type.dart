import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halal_design/controllers/auth_reposiotry.dart';
import 'package:halal_design/screens/constants/color.dart';
import 'package:halal_design/screens/ui/auth_screen/sign_in.dart';
import 'package:halal_design/screens/ui/auth_screen/sign_up.dart';
import 'package:halal_design/screens/widget/button_widget.dart';
import 'package:halal_design/screens/widget/custom_text.dart';

class AccountType extends StatefulWidget {
  const AccountType({super.key});

  @override
  State<AccountType> createState() => _AccountTypeState();
}

class _AccountTypeState extends State<AccountType> {
  final authController = Get.put(AuthRepository());
  List accounTypes = ['Admin', 'User'];
  bool isclicked = true;
  int clicked = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor().primaryWhite,
      body: Padding(
        padding: EdgeInsets.only(
            left: Get.width * 0.04,
            right: Get.width * 0.04,
            top: Get.height * 0.07,
            bottom: Get.height * 0.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              //  height: 320,

              color: AppColor().primaryWhite,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset('assets/images/svgs/back_arrow.svg'),
                      CustomText(
                        title: 'Get Started',
                        color: AppColor().primaryDark,
                        size: 14,
                        weight: FontWeight.w500,
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
                            title: 'Account Type',
                            color: AppColor().primaryDark,
                            size: 22,
                            weight: FontWeight.w900,
                          ),
                          Gap(Get.height * 0.01),
                          CustomText(
                            title: 'What type of Account are you creating?',
                            color: AppColor().primaryDark,
                            size: 14,
                            weight: FontWeight.w500,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Gap(Get.height * 0.04),

            Row(
              children: [
                CustomFillButton(
                  onTap: () {
                    setState(() {
                      accounTypes == 'Individual';
                      isclicked = !isclicked;
                      authController.accountType('user');
                      clicked = 2;
                      if (kDebugMode) {
                        print(authController.accountType.value);
                        // print(clicked);
                      }
                    });
                  },
                  height: 33,
                  width: Get.width * 0.30,
                  buttonText: 'For User',
                  textColor: isclicked
                      ? AppColor().primaryWhite
                      : AppColor().primaryDark,
                  buttonColor: isclicked
                      ? AppColor().primaryColorGreen
                      : AppColor().backGround,
                  boarderColor: isclicked
                      ? AppColor().primaryColorGreen
                      : AppColor().backGround,
                  borderRadius: BorderRadius.circular(8),
                  fontWeight: FontWeight.w600,
                ),
                Gap(Get.height * 0.02),
                CustomFillButton(
                  onTap: () {
                    setState(() {
                      isclicked = !isclicked;
                      authController.accountType('admin');
                      clicked = 1;
                      if (kDebugMode) {
                        print(authController.accountType.value);
                        //print(clicked);
                      }
                    });
                  },
                  height: 33,
                  width: Get.width * 0.30,
                  buttonText: 'For Admin',
                  textColor: isclicked
                      ? AppColor().primaryDark
                      : AppColor().primaryWhite,
                  buttonColor: isclicked
                      ? AppColor().backGround
                      : AppColor().primaryColorPurple,
                  boarderColor: isclicked
                      ? AppColor().backGround
                      : AppColor().primaryColorPurple,
                  borderRadius: BorderRadius.circular(8),
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
            Gap(Get.height * 0.08),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
              height: 155,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: AppColor().backGround,
                  borderRadius: BorderRadius.circular(8)),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text.rich(TextSpan(
                    text: "Create ",
                    style: GoogleFonts.nunito(
                        textStyle: TextStyle(
                            color: AppColor().primaryDark, fontSize: 18),
                        fontWeight: FontWeight.w900),
                    children: <TextSpan>[
                      TextSpan(
                        text: isclicked ? 'User Account' : "Admin Account",
                        style: GoogleFonts.nunito(
                          textStyle: TextStyle(
                              color: isclicked
                                  ? AppColor().primaryColorGreen
                                  : AppColor().primaryColorPurple,
                              fontWeight: FontWeight.w900,
                              fontSize: 18),
                        ),
                      ),
                    ],
                  )),
                  Gap(Get.height * 0.02),
                  CustomText(
                    title:
                        'Are you a professional? Creatives or live abroad?  You can collect payments',
                    color: AppColor().primaryDark,
                    size: 16,
                    weight: FontWeight.w600,
                  ),
                ],
              ),
            ),
            const Spacer(),
            CustomFillButton(
              onTap: () {
                if (isclicked == true) {
                  clicked = 2;
                } else {
                  clicked = 1;
                }
                //  authController.accountTypeController.text = clicked.toString();
                Get.to(const SignUpEmail());
              },
              height: 46,
              width: MediaQuery.of(context).size.width,
              buttonText: 'Continue',
              textColor: AppColor().primaryWhite,
              buttonColor: AppColor().primaryColorPurple,
              boarderColor: AppColor().primaryColorPurple,
              borderRadius: BorderRadius.circular(36),
              fontWeight: FontWeight.w600,
            ),
            Gap(Get.height * 0.02),
            Center(
              child: Text.rich(
                TextSpan(
                  text: "Already have an account? ",
                  style: GoogleFonts.nunito(
                      textStyle: TextStyle(
                        color: AppColor().primaryDark,
                        fontSize: 12,
                      ),
                      fontWeight: FontWeight.w500),
                  children: <TextSpan>[
                    TextSpan(
                      text: "Log in ",
                      style: GoogleFonts.nunito(
                        textStyle: TextStyle(
                            color: AppColor().primaryColorGreen,
                            fontWeight: FontWeight.w500,
                            fontSize: 12),
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                            Get.to(() => const LoginPage());
                        },
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
           
          ],
        ),
      ),
    );
  }
}
