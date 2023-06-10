import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halal_design/controllers/auth_reposiotry.dart';
import 'package:halal_design/controllers/collector_repository.dart';
import 'package:halal_design/models/collector_model.dart';
import 'package:halal_design/models/sign_in_model.dart';
import 'package:halal_design/screens/constants/color.dart';
import 'package:halal_design/screens/function/function.dart';
import 'package:halal_design/screens/widget/custom_text.dart';
import 'package:halal_design/screens/widget/loading.dart';
import 'package:halal_design/screens/widget/text_field_widget.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class CreateCollector extends StatefulWidget {
  const CreateCollector({super.key});

  @override
  State<CreateCollector> createState() => _CreateCollectorState();
}

class _CreateCollectorState extends State<CreateCollector> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final authController = Get.put(AuthRepo());
  final collectorController = Get.put(CollectorRepo());
  bool isHiddenPassword = true;
  bool? isChecked = false;
  late bool passRequirementMet;
  Functions function = Functions();
  var number = "";

  @override
  Widget build(BuildContext context) {
    // print(authController.accountType.value);

    return SizedBox(
        height: 500,
        child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Get.height * 0.025,
              vertical: Get.height * 0.03,
            ),
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          title: 'Create a collector',
                          color: AppColor().primaryDark,
                          size: 16,
                          weight: FontWeight.w700,
                        ),
                        Container(),
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
                      textEditingController:
                          collectorController.collectorFirstNameController,
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
                      textEditingController:
                          collectorController.collectorLastNameController,
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
                      title: 'Phone Number',
                      color: AppColor().greyColor,
                      size: 14,
                      weight: FontWeight.w500,
                    ),
                    Gap(Get.height * 0.01),
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
                              borderSide: BorderSide(
                                  color: AppColor().greyColor, width: 1),
                              borderRadius: BorderRadius.circular(10)),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColor().primaryColorPurple,
                                  width: 1),
                              borderRadius: BorderRadius.circular(10)),
                          hintText: 'Phone Number',
                          hintStyle: GoogleFonts.roboto(
                            color: AppColor().greyColor,
                            fontSize: 13,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        controller:
                            collectorController.collectorPhoneNumController,
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
                      textEditingController:
                          collectorController.collectorAdressController,
                      hint: "Enter your address",
                      hintColor: AppColor().greyColor.withOpacity(0.3),
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'Address must not be empty';
                        }
                        return null;
                      },
                    ),

                    Gap(Get.height * 0.015),
                    Obx(() {
                      return InkWell(
                        onTap: () {
                          ColletorData createCollector = ColletorData(
                              firstName: collectorController
                                  .collectorFirstNameController.text
                                  .trim(),
                              lastName: collectorController
                                  .collectorLastNameController.text
                                  .trim(),
                              address: collectorController
                                  .collectorAdressController.text
                                  .trim(),
                              phone: number +
                                  collectorController
                                      .collectorPhoneNumController.text
                                      .trim(),
                              profileImageSecureUrl:
                                  'http://res.cloudinary.com/mallamtymain/image/upload/v1682840495/Smart-Waste-Collector/r1o0hzslbuikcoqjlbmi.png',
                              profileImageUrl:
                                  'http://res.cloudinary.com/mallamtymain/image/upload/v1682840495/Smart-Waste-Collector/r1o0hzslbuikcoqjlbmi.png');

                          print('Users: ${createCollector.toJson()}');

                          print('here');
                          if (collectorController.createColletorStatus !=
                                  CreateColletorStatus.loading &&
                              formKey.currentState!.validate()) {
                            collectorController
                                .createCollector(createCollector);
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
                          child: (collectorController.createColletorStatus ==
                                  CreateColletorStatus.loading)
                              ? LoadingWidget()
                              : Center(
                                  child: CustomText(
                                  title: 'Submit',
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
                      );
                    }),
                    // Gap(Get.height * 0.015),
                    // Center(
                    //   child: Text.rich(
                    //     TextSpan(
                    //       text: "Already have an account ",
                    //       style: GoogleFonts.nunito(
                    //           textStyle: TextStyle(
                    //             color: AppColor().primaryDark,
                    //             fontSize: 14,
                    //           ),
                    //           fontWeight: FontWeight.w500),
                    //       children: <TextSpan>[
                    //         TextSpan(
                    //             text: "Login in",
                    //             style: GoogleFonts.nunito(
                    //               textStyle: TextStyle(
                    //                   color: AppColor().primaryColorGreen,
                    //                   fontWeight: FontWeight.w500,
                    //                   fontSize: 14),
                    //             ),
                    //             recognizer: TapGestureRecognizer()
                    //               ..onTap = () {
                    //                 Get.to(() => const LoginPage());
                    //               })
                    //       ],
                    //     ),
                    //     textAlign: TextAlign.center,
                    //   ),
                    // ),
                  ],
                ),
              ),
            )));
  }
}