import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:halal_design/controllers/auth_reposiotry.dart';
import 'package:halal_design/screens/constants/color.dart';
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
                                            color: AppColor().primaryColorGreen,
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
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  CustomText(
                                                    title: 'Team Name:',
                                                    color:
                                                        AppColor().primaryWhite,
                                                    size: 14,
                                                    weight: FontWeight.w500,
                                                  ),
                                                  const Gap(5),
                                                  CustomText(
                                                    title: item.name,
                                                    color:
                                                        AppColor().primaryWhite,
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
                                                    color:
                                                        AppColor().primaryWhite,
                                                    size: 14,
                                                    weight: FontWeight.w500,
                                                  ),
                                                  const Gap(5),
                                                  CustomText(
                                                    title: item.area,
                                                    color:
                                                        AppColor().primaryWhite,
                                                    size: 14,
                                                    weight: FontWeight.w500,
                                                  ),
                                                ],
                                              ),
                                              const Gap(5),
                                              Row(
                                                children: [
                                                  CustomText(
                                                    title: 'Address:',
                                                    color:
                                                        AppColor().primaryWhite,
                                                    size: 14,
                                                    weight: FontWeight.w500,
                                                  ),
                                                  const Gap(5),
                                                  CustomText(
                                                    title:
                                                        item.leader1.toString(),
                                                    color:
                                                        AppColor().primaryWhite,
                                                    size: 14,
                                                    weight: FontWeight.w500,
                                                  ),
                                                ],
                                              ),
                                              const Gap(5),
                                              Row(
                                                children: [
                                                  CustomText(
                                                    title: 'Phone:',
                                                    color:
                                                        AppColor().primaryWhite,
                                                    size: 14,
                                                    weight: FontWeight.w500,
                                                  ),
                                                  const Gap(5),
                                                  CustomText(
                                                    title:
                                                        item.leader2.toString(),
                                                    color:
                                                        AppColor().primaryWhite,
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
                                                    color:
                                                        AppColor().primaryWhite,
                                                    size: 14,
                                                    weight: FontWeight.w500,
                                                  ),
                                                  const Gap(5),
                                                  CustomText(
                                                    title: item.createdAt
                                                        .toString(),
                                                    color:
                                                        AppColor().primaryWhite,
                                                    size: 14,
                                                    weight: FontWeight.w500,
                                                  ),
                                                ],
                                              ),
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
