import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halal_design/controllers/auth_reposiotry.dart';
import 'package:halal_design/screens/constants/color.dart';
import 'package:halal_design/screens/ui/collector/create_collector.dart';
import 'package:halal_design/screens/widget/loading.dart';

import '../widget/custom_text.dart';

class TeamPage extends StatefulWidget {
  const TeamPage({super.key});

  @override
  State<TeamPage> createState() => _CardState();
}

class _CardState extends State<TeamPage> {
  final authController = Get.put(AuthRepo());
  @override
  Widget build(BuildContext context) {
    print('home page ${authController.getTeams()}');
    return Scaffold(
      //  backgroundColor: AppColor().primaryColorPurple,
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            height: Get.height,
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 40, bottom: 60),
            color: AppColor().primaryWhite,
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          title: 'Team',
                          color: AppColor().primaryDark,
                          size: 22,
                          weight: FontWeight.w900,
                        ),
                        CustomText(
                          title: 'List of Teams',
                          color: AppColor().primaryDark,
                          size: 14,
                          weight: FontWeight.w500,
                        ),
                      ],
                    ),
                  ],
                ),
                const Gap(10),
                Expanded(
                    child: SizedBox(
                  height: 300,
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Obx(() {
                      return authController.getTeamsStatus ==
                              GetTeamStatus.loading
                          ? LoadingWidget(
                              color: AppColor().primaryColorPurple,
                            )
                          : authController.getTeamsList.isNotEmpty
                              ? ListView.separated(
                                  padding: EdgeInsets.zero,
                                  scrollDirection: Axis.vertical,
                                  physics: const ScrollPhysics(),
                                  shrinkWrap: false,
                                  itemCount: authController.getTeamsList.length,
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(
                                        height: 5,
                                      ),
                                  itemBuilder: (context, index) {
                                    var item =
                                        authController.getTeamsList[index];
                                    return InkWell(
                                      onTap: () {},
                                      child: Container(
                                          // height: 100,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 15),
                                          decoration: BoxDecoration(
                                            color: AppColor().primaryWhite,
                                            border: Border.all(
                                                color: AppColor()
                                                    .primaryColorPurple,
                                                width: 2),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: [
                                              BoxShadow(
                                                color: AppColor()
                                                    .greyColor
                                                    .withOpacity(0.2),
                                                blurRadius: 1,
                                                spreadRadius: 2,
                                                offset: const Offset(
                                                  1.0, // Move to right 5  horizontally
                                                  1.0, // Move to bottom 5 Vertically
                                                ), // Shadow position
                                              ),
                                            ],
                                          ),
                                          // height: 100,
                                          width: Get.width,
                                          child: Row(
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      CustomText(
                                                        title: 'Team Name:',
                                                        color: AppColor()
                                                            .primaryColorGreen,
                                                        size: 14,
                                                        weight: FontWeight.w800,
                                                      ),
                                                      const Gap(5),
                                                      CustomText(
                                                        title: item.name,
                                                        color: AppColor()
                                                            .primaryColorGreen,
                                                        size: 14,
                                                        weight: FontWeight.w500,
                                                      ),
                                                    ],
                                                  ),
                                                  const Gap(5),
                                                  Row(
                                                    children: [
                                                      CustomText(
                                                        title: 'Team Area:',
                                                        color: AppColor()
                                                            .primaryColorGreen,
                                                        size: 14,
                                                        weight: FontWeight.w800,
                                                      ),
                                                      const Gap(5),
                                                      CustomText(
                                                        title: item.area,
                                                        color: AppColor()
                                                            .primaryColorGreen,
                                                        size: 14,
                                                        weight: FontWeight.w500,
                                                      ),
                                                    ],
                                                  ),
                                                  const Gap(5),
                                                  Row(
                                                    children: [
                                                      CustomText(
                                                        title: 'Leader 1:',
                                                        color: AppColor()
                                                            .primaryColorGreen,
                                                        size: 14,
                                                        weight: FontWeight.w800,
                                                      ),
                                                      const Gap(5),
                                                      CustomText(
                                                        title: item.leader1
                                                            .toString(),
                                                        color: AppColor()
                                                            .primaryColorGreen,
                                                        size: 14,
                                                        weight: FontWeight.w500,
                                                      ),
                                                    ],
                                                  ),
                                                  const Gap(5),
                                                  Row(
                                                    children: [
                                                      CustomText(
                                                        title: 'Leader 2:',
                                                        color: AppColor()
                                                            .primaryColorGreen,
                                                        size: 14,
                                                        weight: FontWeight.w800,
                                                      ),
                                                      const Gap(5),
                                                      CustomText(
                                                        title: item.leader2
                                                            .toString(),
                                                        color: AppColor()
                                                            .primaryColorGreen,
                                                        size: 14,
                                                        weight: FontWeight.w500,
                                                      ),
                                                    ],
                                                  ),
                                                  const Gap(5),
                                                  Row(
                                                    children: [
                                                      CustomText(
                                                        title: 'Time created:',
                                                        color: AppColor()
                                                            .primaryColorGreen,
                                                        size: 14,
                                                        weight: FontWeight.w800,
                                                      ),
                                                      const Gap(5),
                                                      // CustomText(
                                                      //   title: item.createdAt
                                                      //       .toString(),
                                                      //   color: AppColor()
                                                      //       .primaryColorGreen,
                                                      //   size: 14,
                                                      //   weight: FontWeight.w500,
                                                      // ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              const Spacer(),
                                              Column(
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      Get.defaultDialog(
                                                          title: "Delete Team",
                                                          middleText:
                                                              "Are you sure you want to delete this Team",
                                                          titleStyle: GoogleFonts
                                                              .nunito(
                                                                  textStyle:
                                                                      TextStyle(
                                                            color: AppColor()
                                                                .primaryColorPurple,
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.w800,
                                                          )),
                                                          titlePadding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 20),
                                                          contentPadding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal: 8,
                                                                  vertical: 15),
                                                          content: Container(
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        10),
                                                            color: AppColor()
                                                                .primaryWhite,
                                                            child: Column(
                                                              children: [
                                                                CustomText(
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  title:
                                                                      'Are you sure you want delete this Team, This process can not be undo',
                                                                  color: AppColor()
                                                                      .primaryDark,
                                                                  size: 14,
                                                                  weight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                                const Gap(15),
                                                                Row(
                                                                  children: [
                                                                    Expanded(
                                                                      child: Obx(
                                                                          () {
                                                                        return InkWell(
                                                                          onTap:
                                                                              () {
                                                                            print(item.id);
                                                                            if (authController.deleteContainerStatus !=
                                                                                DeleteContainerStatus.loading) {
                                                                              authController.deleteContainer(containerId: item.id);
                                                                              Get.back();
                                                                            }
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                40,
                                                                            width:
                                                                                Get.width,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              borderRadius: BorderRadius.circular(8),
                                                                              color: AppColor().primaryColorPurple,
                                                                            ),
                                                                            child: (authController.deleteContainerStatus == DeleteContainerStatus.loading)
                                                                                ? LoadingWidget()
                                                                                : Center(
                                                                                    child: CustomText(
                                                                                    title: 'Delete',
                                                                                    color: AppColor().primaryWhite,
                                                                                    weight: FontWeight.w600,
                                                                                    size: 12,
                                                                                  )),
                                                                          ),
                                                                        );
                                                                      }),
                                                                    ),
                                                                    const Gap(
                                                                        25),
                                                                    Expanded(
                                                                      child:
                                                                          InkWell(
                                                                        onTap:
                                                                            () {
                                                                          Get.back();
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          height:
                                                                              40,
                                                                          width:
                                                                              Get.width,
                                                                          decoration: BoxDecoration(
                                                                              borderRadius: BorderRadius.circular(8),
                                                                              color: AppColor().primaryWhite,
                                                                              border: Border.all(
                                                                                color: AppColor().primaryRed,
                                                                              )),
                                                                          child: Center(
                                                                              child: CustomText(
                                                                            title:
                                                                                'Cancel',
                                                                            color:
                                                                                AppColor().primaryRed,
                                                                            weight:
                                                                                FontWeight.w600,
                                                                            size:
                                                                                12,
                                                                          )),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                )
                                                              ],
                                                            ),
                                                          ));
                                                    },
                                                    child: SvgPicture.asset(
                                                      "assets/images/svgs/trash.svg",
                                                      color: AppColor()
                                                          .primaryGreen,
                                                    ),
                                                  ),
                                                  const Gap(15),
                                                  InkWell(
                                                    onTap: () {
                                                      showModalBottomSheet(
                                                          isScrollControlled:
                                                              true,
                                                          backgroundColor:
                                                              AppColor()
                                                                  .primaryWhite,
                                                          shape:
                                                              const RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .vertical(
                                                              top: Radius
                                                                  .circular(20),
                                                            ),
                                                          ),
                                                          context: context,
                                                          builder: (context) =>
                                                              CreateContainer(
                                                                create: 'false',
                                                                id: item.id
                                                                    .toString(),
                                                              ));
                                                    },
                                                    child: Expanded(
                                                      child: Container(
                                                        height: 25,
                                                        width: 50,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          color: AppColor()
                                                              .primaryColorGreen,
                                                        ),
                                                        child: Center(
                                                            child: CustomText(
                                                          title: 'Edit',
                                                          color: AppColor()
                                                              .primaryWhite,
                                                          weight:
                                                              FontWeight.w600,
                                                          size: 12,
                                                        )),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          )),
                                    );
                                  })
                              : CustomText(
                                  title: 'No Teams found',
                                  color: AppColor().primaryDark,
                                  size: 14,
                                  weight: FontWeight.w500,
                                );
                    }),
                  ),
                ))
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
