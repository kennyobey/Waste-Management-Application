import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halal_design/models/container_model.dart';
import 'package:halal_design/screens/constants/color.dart';
import 'package:halal_design/screens/ui/charts/weekly_chart.dart';
import 'package:halal_design/screens/widget/custom_text.dart';
import 'package:halal_design/screens/widget/text_field_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class ContaineDescriptionPage extends StatefulWidget {
  final ContaineDataModel item;
  const ContaineDescriptionPage({super.key, required this.item});

  @override
  State<ContaineDescriptionPage> createState() =>
      _ContaineDescriptionPageState();
}

class _ContaineDescriptionPageState extends State<ContaineDescriptionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor().backGround,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              //  height: 320,
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 80, bottom: 10),
              color: AppColor().primaryWhite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: SvgPicture.asset(
                          "assets/images/svgs/back_arrow.svg",
                          // height: 30,
                        ),
                      ),
                      const Gap(30),
                      Center(
                        child: CustomText(
                          title: widget.item.location,
                          color: AppColor().primaryColorPurple,
                          size: 22,
                          weight: FontWeight.w700,
                        ),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          Get.defaultDialog(
                              titlePadding: const EdgeInsets.only(top: 18),
                              title: "Add Object",
                              middleText: "Input the object size",
                              titleStyle: GoogleFonts.nunito(
                                  textStyle: TextStyle(
                                color: AppColor().primaryColorPurple,
                                fontSize: 15,
                                fontWeight: FontWeight.w800,
                              )),
                              content: Column(
                                children: [
                                  CustomText(
                                    title: 'Input the object volume',
                                    color: AppColor().greyColor,
                                    size: 14,
                                    weight: FontWeight.w500,
                                  ),
                                  Gap(Get.height * 0.01),
                                  CustomTextField(
                                    keyType: TextInputType.number,
                                    // textEditingController:
                                    //     authController.containerLocationController,
                                    hint: "Container Volume",
                                    hintColor:
                                        AppColor().greyColor.withOpacity(0.3),
                                    validate: (value) {
                                      if (value!.isEmpty) {
                                        return 'Container volume must not be empty';
                                      }
                                      return null;
                                    },
                                  ),
                                  Gap(Get.height * 0.02),
                                  Container(
                                    height: 50,
                                    width: Get.width,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: AppColor().primaryColorPurple,
                                    ),
                                    child: Center(
                                        child: CustomText(
                                      title: "Submit",
                                      color: AppColor().primaryWhite,
                                      weight: FontWeight.w600,
                                      size: 16,
                                    )),
                                  ),
                                ],
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 15));
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 3),
                          decoration: BoxDecoration(
                              color: AppColor().primaryColorGreen,
                              borderRadius: BorderRadius.circular(4)),
                          child: CustomText(
                            title: "Add Object",
                            color: AppColor().primaryWhite,
                            size: 14,
                            weight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const Gap(10),
                    ],
                  ),
                  const Gap(10),
                  Container(
                    // height: 114,
                    width: MediaQuery.maybeOf(context)?.size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColor().primaryColorPurple.withOpacity(0.08)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 22, vertical: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              CustomText(
                                title: 'Volume Status:',
                                color: AppColor().primaryDark,
                                size: 13,
                                weight: FontWeight.w600,
                              ),
                              const Gap(10),
                              CustomText(
                                title: widget.item.volumeStatus.toString(),
                                color: AppColor().primaryDark,
                                size: 13,
                                weight: FontWeight.w500,
                              ),
                            ],
                          ),
                          const Gap(10),
                          Row(
                            children: [
                              CustomText(
                                title: 'Weekly Count',
                                color: AppColor().primaryDark,
                                size: 13,
                                weight: FontWeight.w600,
                              ),
                              const Gap(10),
                              CustomText(
                                title: widget.item.weekFilledCount.toString(),
                                color: AppColor().primaryDark,
                                size: 13,
                                weight: FontWeight.w500,
                              ),
                              const Gap(10),
                              // Icon(
                              //   Icons.visibility_off,
                              //   color: AppColor().lightPurple,
                              // )
                            ],
                          ),
                          const Gap(10),
                          Row(
                            children: [
                              CustomText(
                                title: 'Monthly Count:',
                                color: AppColor().primaryDark,
                                size: 13,
                                weight: FontWeight.w600,
                              ),
                              const Gap(10),
                              CustomText(
                                title: widget.item.monthFilledCount.toString(),
                                color: AppColor().primaryDark,
                                size: 13,
                                weight: FontWeight.w500,
                              ),
                              //const Spacer(),
                              // SvgPicture.asset(
                              //   "assets/images/svgs/copy_svg.svg",
                              //   // height: 30,
                              // ),
                            ],
                          ),
                          const Gap(10),
                          Row(
                            children: [
                              CustomText(
                                title: 'Volume:',
                                color: AppColor().primaryDark,
                                size: 13,
                                weight: FontWeight.w600,
                              ),
                              const Gap(10),
                              CustomText(
                                title: widget.item.volume.toString(),
                                color: AppColor().primaryDark,
                                size: 13,
                                weight: FontWeight.w500,
                              ),
                              //const Spacer(),
                              // SvgPicture.asset(
                              //   "assets/images/svgs/copy_svg.svg",
                              //   // height: 30,
                              // ),
                            ],
                          ),
                          const Gap(10),
                          Row(
                            children: [
                              CustomText(
                                title: 'Filled Count:',
                                color: AppColor().primaryDark,
                                size: 13,
                                weight: FontWeight.w600,
                              ),
                              const Gap(10),
                              CustomText(
                                title: widget.item.filledCount.toString(),
                                color: AppColor().primaryDark,
                                size: 13,
                                weight: FontWeight.w500,
                              ),
                              //const Spacer(),
                              // SvgPicture.asset(
                              //   "assets/images/svgs/copy_svg.svg",
                              //   // height: 30,
                              // ),
                            ],
                          ),
                          const Gap(10),
                          Row(
                            children: [
                              CustomText(
                                title: 'Percentage Count:',
                                color: AppColor().primaryDark,
                                size: 13,
                                weight: FontWeight.w600,
                              ),
                              const Gap(10),
                              CustomText(
                                title: widget.item.percentageLevel.toString(),
                                color: AppColor().primaryDark,
                                size: 13,
                                weight: FontWeight.w500,
                              ),

                              //const Spacer(),
                              // SvgPicture.asset(
                              //   "assets/images/svgs/copy_svg.svg",
                              //   // height: 30,
                              // ),
                            ],
                          ),
                          const Gap(10),
                          Row(
                            children: [
                              CustomText(
                                title: 'Team Incharge:',
                                color: AppColor().primaryDark,
                                size: 13,
                                weight: FontWeight.w600,
                              ),
                              const Gap(10),
                              CustomText(
                                title: widget.item.teamResponsible?.name
                                        .toString() ??
                                    "No Team Assigned Yet",
                                color: AppColor().primaryDark,
                                size: 13,
                                weight: FontWeight.w500,
                              ),

                              //const Spacer(),
                              // SvgPicture.asset(
                              //   "assets/images/svgs/copy_svg.svg",
                              //   // height: 30,
                              // ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Gap(10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  CustomText(
                    title: 'Click on the link below to access google map',
                    color: AppColor().primaryDark,
                    size: 13,
                    weight: FontWeight.w600,
                  ),
                  const Gap(10),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    height: 84,
                    decoration: BoxDecoration(
                      color: AppColor().primaryWhite,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/images/svgs/location.svg",
                          height: 30,
                          color: AppColor().primaryColorPurple,
                        ),
                        const Gap(13),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText(
                                title: 'Location Link',
                                color: AppColor().primaryDark,
                                size: 16,
                                weight: FontWeight.w600,
                              ),
                              const Gap(3),
                              // Expanded(
                              //   child: RichText(
                              //     textAlign: TextAlign.start,
                              //     text: TextSpan(
                              //       text: widget.item.locationLink,
                              //       style: TextStyle(
                              //         color: AppColor().primaryColorPurple,
                              //         fontSize: 14,
                              //         fontWeight: FontWeight.w500,
                              //         overflow: TextOverflow.ellipsis,
                              //       ),
                              //       recognizer: TapGestureRecognizer()
                              //         ..onTap = () {
                              //           launch(widget.item.locationLink);
                              //         },
                              //     ),
                              //   ),
                              // ),
                              InkWell(
                                onTap: () {
                                  launch(widget.item.locationLink);
                                },
                                child: CustomText(
                                  title: widget.item.locationLink,
                                  color: AppColor().primaryColorPurple,
                                  size: 14,
                                  weight: FontWeight.w400,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Gap(13),
                        // const Spacer(),
                        SvgPicture.asset(
                          "assets/images/svgs/copy_svg.svg",
                          height: 30,
                          color: AppColor().primaryColorPurple,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 500,
                    width: 500,
                    child: BarChartSample2(),
                  ),
                  // const Gap(13),
                  // InkWell(
                  //   onTap: () {
                  //     showModalBottomSheet(
                  //         isScrollControlled: true,
                  //         shape: const RoundedRectangleBorder(
                  //           borderRadius: BorderRadius.vertical(
                  //             top: Radius.circular(20),
                  //           ),
                  //         ),
                  //         context: context,
                  //         builder: (context) => CreateTeam());
                  //   },
                  //   child: Container(
                  //     padding: const EdgeInsets.symmetric(horizontal: 20),
                  //     height: 84,
                  //     decoration: BoxDecoration(
                  //       color: AppColor().primaryWhite,
                  //       borderRadius: BorderRadius.circular(10),
                  //     ),
                  //     child: Row(
                  //       crossAxisAlignment: CrossAxisAlignment.center,
                  //       children: [
                  //         SvgPicture.asset(
                  //           "assets/images/svgs/top_up_icon.svg",
                  //           // height: 30,
                  //         ),
                  //         const Gap(13),
                  //         Column(
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //           mainAxisAlignment: MainAxisAlignment.center,
                  //           children: [
                  //             CustomText(
                  //               title: 'Create Team',
                  //               color: AppColor().lightPurple,
                  //               size: 16,
                  //               weight: FontWeight.w600,
                  //             ),
                  //             const Gap(3),
                  //             CustomText(
                  //               title: 'Fund your account with ease',
                  //               color: AppColor().primaryDark,
                  //               size: 10,
                  //               weight: FontWeight.w400,
                  //             ),
                  //           ],
                  //         ),
                  //         const Spacer(),
                  //         SvgPicture.asset(
                  //           "assets/images/svgs/forward_arrow.svg",
                  //           // height: 30,
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  // const Gap(13),
                  // InkWell(
                  //   onTap: () {
                  //     showModalBottomSheet(
                  //         isScrollControlled: true,
                  //         shape: const RoundedRectangleBorder(
                  //           borderRadius: BorderRadius.vertical(
                  //             top: Radius.circular(20),
                  //           ),
                  //         ),
                  //         context: context,
                  //         builder: (context) => CreateContainer());
                  //   },
                  //   child: Container(
                  //     padding: const EdgeInsets.symmetric(horizontal: 20),
                  //     height: 84,
                  //     decoration: BoxDecoration(
                  //       color: AppColor().primaryWhite,
                  //       borderRadius: BorderRadius.circular(10),
                  //     ),
                  //     child: Row(
                  //       crossAxisAlignment: CrossAxisAlignment.center,
                  //       children: [
                  //         SvgPicture.asset(
                  //           "assets/images/svgs/xchange_icon.svg",
                  //           // height: 30,
                  //         ),
                  //         const Gap(13),
                  //         Column(
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //           mainAxisAlignment: MainAxisAlignment.center,
                  //           children: [
                  //             CustomText(
                  //               title: 'Create Container',
                  //               color: AppColor().primaryWine,
                  //               size: 16,
                  //               weight: FontWeight.w600,
                  //             ),
                  //             const Gap(3),
                  //             CustomText(
                  //               title: 'Get the best currency exchange rate',
                  //               color: AppColor().primaryDark,
                  //               size: 10,
                  //               weight: FontWeight.w400,
                  //             ),
                  //           ],
                  //         ),
                  //         const Spacer(),
                  //         SvgPicture.asset(
                  //           "assets/images/svgs/forward_arrow.svg",
                  //           // height: 30,
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  const Gap(10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
