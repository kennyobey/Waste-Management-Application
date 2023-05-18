import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halal_design/controllers/auth_reposiotry.dart';
import 'package:halal_design/models/sign_in_model.dart';
import 'package:halal_design/screens/constants/color.dart';
import 'package:halal_design/screens/function/function.dart';
import 'package:halal_design/screens/widget/custom_text.dart';
import 'package:halal_design/screens/widget/text_field_widget.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class SignUpEmail extends StatefulWidget {
  const SignUpEmail({super.key});

  @override
  State<SignUpEmail> createState() => _SignUpEmailState();
}

class _SignUpEmailState extends State<SignUpEmail> {
  bool isHiddenPassword = true;
  bool? isChecked = false;
  late bool passRequirementMet;
  Functions function = Functions();
  var number = "";

  late bool upto8Characters = false;
  late bool numbers = false;
  late bool lowerCase = false;
  late bool upperCase = false;
  late bool symbolSpecial = false;

  void _togglePasswordView() {
    setState(() {
      upto8Characters = false;
      numbers = false;
      lowerCase = false;
      upperCase = false;
      symbolSpecial = false;
      isHiddenPassword = !isHiddenPassword;
      super.initState();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final authController = Get.put(AuthRepository());

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColor().primaryWhite,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Get.height * 0.025,
          vertical: Get.height * 0.08,
        ),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
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
                      title: 'Welcome',
                      color: AppColor().primaryDark,
                      size: 16,
                      weight: FontWeight.w700,
                    ),
                    Container(),
                  ],
                ),
                Gap(Get.height * 0.01),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          title: 'Provide your email',
                          color: AppColor().primaryDark,
                          size: 22,
                          weight: FontWeight.w900,
                        ),
                        Gap(Get.height * 0.01),
                        CustomText(
                          title:
                              'We will be sending important information to your \nemail.',
                          color: AppColor().primaryDark,
                          size: 14,
                          weight: FontWeight.w500,
                        ),
                      ],
                    ),
                  ],
                ),
                Gap(Get.height * 0.01),
                CustomText(
                  title: 'First name',
                  color: AppColor().greyColor,
                  size: 14,
                  weight: FontWeight.w500,
                ),
                Gap(Get.height * 0.01),
                CustomTextField(
                   textEditingController: authController.fNameController,
                  hint: "Enter your first name",
                  hintColor: AppColor().greyColor.withOpacity(0.3),
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'First Name must not be empty';
                    }
                    return null;
                  },
                ),
                Gap(Get.height * 0.015),
                CustomText(
                  title: 'Last name',
                  color: AppColor().greyColor,
                  size: 14,
                  weight: FontWeight.w500,
                ),
                Gap(Get.height * 0.01),
                CustomTextField(
                   textEditingController: authController.lNameController,
                  hint: "Enter your last name",
                  hintColor: AppColor().greyColor.withOpacity(0.3),
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'Last Name must not be empty';
                    }
                    return null;
                  },
                ),
                Gap(Get.height * 0.015),
                CustomText(
                  title: 'User name',
                  color: AppColor().greyColor,
                  size: 14,
                  weight: FontWeight.w500,
                ),
                Gap(Get.height * 0.01),
                CustomTextField(
                   textEditingController: authController.lNameController,
                  hint: "Enter your user name",
                  hintColor: AppColor().greyColor.withOpacity(0.3),
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'Last Name must not be empty';
                    }
                    return null;
                  },
                ),
                Gap(Get.height * 0.015),
                CustomText(
                  title: 'Phone Number',
                  color: AppColor().greyColor,
                  size: 14,
                  weight: FontWeight.w500,
                ),
                Gap(Get.height * 0.015),
                IntlPhoneField(
                    disableLengthCheck: true,
                    keyboardType: Platform.isIOS
                        ? const TextInputType.numberWithOptions(
                            signed: true, decimal: false)
                        : TextInputType.phone,
                    flagsButtonMargin: const EdgeInsets.only(left: 8),
                    style: GoogleFonts.roboto(
                      color: AppColor().greyColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    decoration: InputDecoration(
                      fillColor: AppColor().primaryWhite,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 15),
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColor().primaryColorPurple,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(10)),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColor().greyColor, width: 1),
                          borderRadius: BorderRadius.circular(10)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColor().primaryColorPurple, width: 1),
                          borderRadius: BorderRadius.circular(10)),
                      hintText: 'Phone Number',
                      hintStyle: GoogleFonts.roboto(
                        color: AppColor().greyColor,
                        fontSize: 13,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    controller: authController.phoneNoController,
                    initialCountryCode: "NG",
                    validator: (data) {
                      number = data!.number;
                      if (number.length < 10 || number.length > 10) {
                        return "Invalid phone number";
                      } else if (!RegExp(r'^[0-9]+$').hasMatch(number)) {
                        return "Please enter only digits";
                      }
                      return null;
                    },
                    onChanged: (data) {
                      number = data.countryCode;
                    }),
                Gap(Get.height * 0.015),
                CustomText(
                  title: 'Address',
                  color: AppColor().greyColor,
                  size: 14,
                  weight: FontWeight.w500,
                ),
                Gap(Get.height * 0.01),
                CustomTextField(
                  textEditingController: authController.lNameController,
                  hint: "Enter your address",
                  hintColor: AppColor().greyColor.withOpacity(0.3),
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'Last Name must not be empty';
                    }
                    return null;
                  },
                ),
                Gap(Get.height * 0.015),
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
                  onChanged: (value) {},
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
                      isHiddenPassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: isHiddenPassword
                          ? Colors.grey.withOpacity(0.5)
                          : AppColor().greyColor,
                    ),
                  ),
                ),
                Gap(Get.height * 0.015),
                CustomText(
                  title: 'Confirm Password',
                  color: AppColor().greyColor,
                  size: 14,
                  weight: FontWeight.w500,
                ),
                Gap(Get.height * 0.01),
                CustomTextField(
                  textEditingController:
                      authController.confirmPasswordController,
                  hint: "Confrim Password",
                  hintColor: AppColor().greyColor.withOpacity(0.3),
                  obscure: isHiddenPassword,
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'password must not be empty';
                    } else if (value.length < 8) {
                      return 'password must not be less than 8 character';
                    } else if (authController.passwordController.text !=
                        authController.confirmPasswordController.text) {
                      return 'confirm password does not match password';
                    }
                    return null;
                  },
                  suffixIcon: InkWell(
                    onTap: _togglePasswordView,
                    child: Icon(
                      isHiddenPassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: isHiddenPassword
                          ? Colors.grey.withOpacity(0.5)
                          : AppColor().greyColor,
                    ),
                  ),
                ),
                Gap(Get.height * 0.015),
                InkWell(
                  onTap: () {
                    User user = User(
                      role: authController.accountTypeController.text,
                      firstName: authController.fNameController.text.trim(),
                      lastName: authController.lNameController.text.trim(),
                      email: authController.emailController.text.trim(),
                      password: authController.passwordController.text.trim(),
                      confirmPassword:
                          authController.confirmPasswordController.text.trim(),
                      address:
                          authController.confirmPasswordController.text.trim(),
                      username:
                          authController.confirmPasswordController.text.trim(),
                      phone:
                          authController.confirmPasswordController.text.trim(),
                    );

                    print('Users: ${user.toJson()}');

                    print('here');
                    if (authController.signUpStatus != SignUpStatus.loading &&
                        formKey.currentState!.validate()) {
                      authController.signUp(user);
                      //Get.to(const OtpScreen(userId: '',));
                    }
                  },
                  child: Container(
                    height: 50,
                    width: Get.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColor().primaryColorPurple,
                    ),
                    child: Center(
                        child: CustomText(
                      title: 'Continue',
                      color: AppColor().primaryWhite,
                      weight: FontWeight.w600,
                      size: 16,
                    )),
                  ),

                  // CustomFillButton(
                  //   onTap: () {
                  //     if (_formKey.currentState!.validate()) {
                  //       // If the form is valid, display a Snackbar.

                  //     }
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
                ),
                Gap(Get.height * 0.015),
                Center(
                  child: Text.rich(
                    TextSpan(
                      text: "Already have an account ",
                      style: GoogleFonts.nunito(
                          textStyle: TextStyle(
                            color: AppColor().primaryDark,
                            fontSize: 14,
                          ),
                          fontWeight: FontWeight.w500),
                      children: <TextSpan>[
                        TextSpan(
                          text: "Login in",
                          style: GoogleFonts.nunito(
                            textStyle: TextStyle(
                                color: AppColor().primaryColorGreen,
                                fontWeight: FontWeight.w500,
                                fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
