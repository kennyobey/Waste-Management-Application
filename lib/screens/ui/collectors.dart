import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:halal_design/controllers/auth_reposiotry.dart';
import 'package:halal_design/screens/constants/color.dart';
import 'package:halal_design/screens/widget/loading.dart';

import '../widget/custom_text.dart';

class Cardpage extends StatefulWidget {
  const Cardpage({super.key});

  @override
  State<Cardpage> createState() => _CardState();
}

class _CardState extends State<Cardpage> {
  final authController = Get.put(AuthRepo());
  @override
  Widget build(BuildContext context) {
    print('home page ${authController.getCollector()}');
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
                          title: 'Collectors',
                          color: AppColor().primaryDark,
                          size: 22,
                          weight: FontWeight.w900,
                        ),
                        CustomText(
                          title: 'List of collectors',
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
                      return authController.getColletorStatus ==
                              GetColletorStatus.loading
                          ? LoadingWidget(
                              color: AppColor().primaryColorPurple,
                            )
                          : authController.getColletorList.isNotEmpty
                              ? ListView.separated(
                                  padding: EdgeInsets.zero,
                                  scrollDirection: Axis.vertical,
                                  physics: const ScrollPhysics(),
                                  shrinkWrap: false,
                                  itemCount:
                                      authController.getColletorList.length,
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(
                                        height: 5,
                                      ),
                                  itemBuilder: (context, index) {
                                    var item =
                                        authController.getColletorList[index];
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
                                                    title: 'First Name:',
                                                    color:
                                                        AppColor().primaryWhite,
                                                    size: 14,
                                                    weight: FontWeight.w500,
                                                  ),
                                                  const Gap(5),
                                                  CustomText(
                                                    title: item.firstName,
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
                                                    title: 'Last Name:',
                                                    color:
                                                        AppColor().primaryWhite,
                                                    size: 14,
                                                    weight: FontWeight.w500,
                                                  ),
                                                  const Gap(5),
                                                  CustomText(
                                                    title: item.lastName,
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
                                                    title: item.address,
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
                                                    title: item.phone,
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
                                  title: 'No history found',
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
