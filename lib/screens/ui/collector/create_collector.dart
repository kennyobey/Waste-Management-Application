import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halal_design/controllers/auth_reposiotry.dart';
import 'package:halal_design/screens/constants/color.dart';
import 'package:halal_design/screens/function/function.dart';
import 'package:halal_design/screens/widget/custom_text.dart';
import 'package:halal_design/screens/widget/loading.dart';
import 'package:halal_design/screens/widget/text_field_widget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class CreateCollector extends StatefulWidget {
  const CreateCollector({super.key});

  @override
  State<CreateCollector> createState() => _CreateCollectorState();
}

class _CreateCollectorState extends State<CreateCollector> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final authController = Get.put(AuthRepo());
  // final collectorController = Get.put(CollectorRepo());
  bool isHiddenPassword = true;
  bool? isChecked = false;
  late bool passRequirementMet;
  Functions function = Functions();
  var number = "";

  File? image;
  Future pickImageFromGallery() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() {
        this.image = imageTemporary;
        print('images path is: ${image.path}');
      });

      // {
      //   image.add(File(pickedImages.pa isth));
      //   if (kDebugMode) {
      //     print('images: ${image.length}');
      //   }
      // }
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print('$e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // print(authController.accountType.value);

    return SizedBox(
        height: 600,
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
                      title: 'First CreateTeam',
                      color: AppColor().greyColor,
                      size: 14,
                      weight: FontWeight.w500,
                    ),
                    Gap(Get.height * 0.01),
                    CustomTextField(
                      textEditingController:
                          authController.collectorFirstNameController,
                      hint: "Enter your first CreateTeam",
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
                      title: 'Last CreateTeam',
                      color: AppColor().greyColor,
                      size: 14,
                      weight: FontWeight.w500,
                    ),
                    Gap(Get.height * 0.01),
                    CustomTextField(
                      textEditingController:
                          authController.collectorLastNameController,
                      hint: "Enter your last CreateTeam",
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
                        controller: authController.collectorPhoneNumController,
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
                          authController.collectorAdressController,
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
                    Container(
                      width: Get.width,
                      height: 101,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                              color: AppColor().greyColor.withOpacity(0.3))),
                      child: image != null
                          ? Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: Get.height * 0.05,
                                  horizontal: Get.height * 0.05),
                              height: Get.height * 0.4,
                              width: Get.height * 0.4,
                              decoration: BoxDecoration(
                                  color: AppColor().primaryWhite,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(8.0)),
                                  image: DecorationImage(
                                    image: FileImage(
                                      image!,
                                    ),
                                    fit: BoxFit.cover,
                                  )),
                            )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                  InkWell(
                                    onTap: () {
                                      pickImageFromGallery();
                                    },
                                    child: SvgPicture.asset(
                                        'assets/images/svgs/notification_bell.svg'),
                                  ),
                                  CustomText(
                                    title:
                                        'Tap to upload. PNG, JPG, PDF is accepted',
                                    color: AppColor().greyColor,
                                    size: 10,
                                    weight: FontWeight.w500,
                                  ),
                                  CustomText(
                                    title: 'File size should not exceed 1mb.',
                                    color: AppColor().greyColor,
                                    size: 10,
                                    weight: FontWeight.w500,
                                  ),
                                ]),
                    ),
                    Gap(Get.height * 0.015),
                    Obx(() {
                      return InkWell(
                        onTap: () {
                          // ColletorData createCollector = ColletorData(
                          //   firstName: collectorController
                          //       .collectorFirstNameController.text
                          //       .trim(),
                          //   lastName: collectorController
                          //       .collectorLastNameController.text
                          //       .trim(),
                          //   address: collectorController
                          //       .collectorAdressController.text
                          //       .trim(),
                          //   phone: number +
                          //       collectorController
                          //           .collectorPhoneNumController.text
                          //           .trim(),
                          //   image: image!.path.toString(),
                          // );

                          // print('Users: ${createCollector.toJson()}');

                          print('here on sending page');
                          if (authController.createColletorStatus !=
                                  CreateColletorStatus.loading &&
                              formKey.currentState!.validate()) {
                            authController.createCollector(
                                imageurl: image!.path.toString());
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
                          child: (authController.createColletorStatus ==
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
                      );
                    }),
                  ],
                ),
              ),
            )));
  }
}

class CreateTeam extends StatelessWidget {
  CreateTeam({super.key});
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final authController = Get.put(AuthRepo());
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 320,
        child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Get.height * 0.025,
              vertical: Get.height * 0.03,
            ),
            child: Form(
                key: formKey,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                            title: 'Create Team',
                            color: AppColor().primaryDark,
                            size: 16,
                            weight: FontWeight.w700,
                          ),
                          Container(),
                        ],
                      ),
                      Gap(Get.height * 0.01),
                      CustomText(
                        title: 'Team Name',
                        color: AppColor().greyColor,
                        size: 14,
                        weight: FontWeight.w500,
                      ),
                      Gap(Get.height * 0.01),
                      CustomTextField(
                        // textEditingController:
                        //     authController.collectorFirstNameController,
                        hint: "Enter your first CreateTeam",
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
                        title: 'Team Area',
                        color: AppColor().greyColor,
                        size: 14,
                        weight: FontWeight.w500,
                      ),
                      Gap(Get.height * 0.01),
                      CustomTextField(
                        // textEditingController:
                        //     authController.collectorLastNameController,
                        hint: "Enter your last CreateTeam",
                        hintColor: AppColor().greyColor.withOpacity(0.3),
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'Last Name must not be empty';
                          }
                          return null;
                        },
                      ),
                      Gap(Get.height * 0.02),
                      Obx(() {
                        return InkWell(
                          onTap: () {
                            // ColletorData createCollector = ColletorData(
                            //   firstName: collectorController
                            //       .collectorFirstNameController.text
                            //       .trim(),
                            //   lastName: collectorController
                            //       .collectorLastNameController.text
                            //       .trim(),
                            //   address: collectorController
                            //       .collectorAdressController.text
                            //       .trim(),
                            //   phone: number +
                            //       collectorController
                            //           .collectorPhoneNumController.text
                            //           .trim(),
                            //   image: image!.path.toString(),
                            // );

                            // print('Users: ${createCollector.toJson()}');

                            print('here on sending page');
                            if (authController.createColletorStatus !=
                                    CreateColletorStatus.loading &&
                                formKey.currentState!.validate()) {
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
                            child: (authController.createColletorStatus ==
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
                        );
                      }),
                    ]))));
  }
}

class CreateContainer extends StatelessWidget {
  CreateContainer({super.key});
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final authController = Get.put(AuthRepo());
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 420,
        child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Get.height * 0.025,
              vertical: Get.height * 0.03,
            ),
            child: Form(
                key: formKey,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                            title: 'Create Container',
                            color: AppColor().primaryDark,
                            size: 16,
                            weight: FontWeight.w700,
                          ),
                        ],
                      ),
                      Gap(Get.height * 0.01),
                      CustomText(
                        title: 'Container Name',
                        color: AppColor().greyColor,
                        size: 14,
                        weight: FontWeight.w500,
                      ),
                      Gap(Get.height * 0.01),
                      CustomTextField(
                        // textEditingController:
                        //     authController.collectorFirstNameController,
                        hint: "Enter your first CreateTeam",
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
                        title: 'Container Area',
                        color: AppColor().greyColor,
                        size: 14,
                        weight: FontWeight.w500,
                      ),
                      Gap(Get.height * 0.01),
                      CustomTextField(
                        // textEditingController:
                        //     authController.collectorLastNameController,
                        hint: "Enter your last CreateTeam",
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
                        title: 'Team',
                        color: AppColor().greyColor,
                        size: 14,
                        weight: FontWeight.w500,
                      ),
                      Gap(Get.height * 0.01),
                      CustomTextField(
                        // textEditingController:
                        //     authController.collectorLastNameController,
                        hint: "Enter your last CreateTeam",
                        hintColor: AppColor().greyColor.withOpacity(0.3),
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'Last Name must not be empty';
                          }
                          return null;
                        },
                      ),
                      Gap(Get.height * 0.02),
                      Obx(() {
                        return InkWell(
                          onTap: () {
                            // ColletorData createCollector = ColletorData(
                            //   firstName: collectorController
                            //       .collectorFirstNameController.text
                            //       .trim(),
                            //   lastName: collectorController
                            //       .collectorLastNameController.text
                            //       .trim(),
                            //   address: collectorController
                            //       .collectorAdressController.text
                            //       .trim(),
                            //   phone: number +
                            //       collectorController
                            //           .collectorPhoneNumController.text
                            //           .trim(),
                            //   image: image!.path.toString(),
                            // );

                            // print('Users: ${createCollector.toJson()}');

                            print('here on sending page');
                            if (authController.createColletorStatus !=
                                    CreateColletorStatus.loading &&
                                formKey.currentState!.validate()) {
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
                            child: (authController.createColletorStatus ==
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
                        );
                      }),
                    ]))));
  }
}
