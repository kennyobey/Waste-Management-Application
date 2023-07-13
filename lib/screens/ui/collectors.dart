import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halal_design/controllers/auth_reposiotry.dart';
import 'package:halal_design/screens/constants/color.dart';
import 'package:halal_design/screens/ui/collector/create_collector.dart';
import 'package:halal_design/screens/widget/loading.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

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
            //color: AppColor().primaryWhite,
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
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          CustomText(
                                                            title:
                                                                'First Name:',
                                                            color: AppColor()
                                                                .primaryColorGreen,
                                                            size: 14,
                                                            weight:
                                                                FontWeight.w800,
                                                          ),
                                                          const Gap(5),
                                                          CustomText(
                                                            title:
                                                                item.firstName,
                                                            color: AppColor()
                                                                .primaryColorGreen,
                                                            size: 14,
                                                            weight:
                                                                FontWeight.w500,
                                                          ),
                                                        ],
                                                      ),
                                                      const Gap(5),
                                                      Row(
                                                        children: [
                                                          CustomText(
                                                            title: 'Last Name:',
                                                            color: AppColor()
                                                                .primaryColorGreen,
                                                            size: 14,
                                                            weight:
                                                                FontWeight.w800,
                                                          ),
                                                          const Gap(5),
                                                          CustomText(
                                                            title:
                                                                item.lastName,
                                                            color: AppColor()
                                                                .primaryColorGreen,
                                                            size: 14,
                                                            weight:
                                                                FontWeight.w500,
                                                          ),
                                                        ],
                                                      ),
                                                      const Gap(5),
                                                      Row(
                                                        children: [
                                                          CustomText(
                                                            title: 'Address:',
                                                            color: AppColor()
                                                                .primaryColorGreen,
                                                            size: 14,
                                                            weight:
                                                                FontWeight.w800,
                                                          ),
                                                          const Gap(5),
                                                          CustomText(
                                                            title: item.address,
                                                            color: AppColor()
                                                                .primaryColorGreen,
                                                            size: 14,
                                                            weight:
                                                                FontWeight.w500,
                                                          ),
                                                        ],
                                                      ),
                                                      const Gap(5),
                                                      Row(
                                                        children: [
                                                          CustomText(
                                                            title: 'Phone:',
                                                            color: AppColor()
                                                                .primaryColorGreen,
                                                            size: 14,
                                                            weight:
                                                                FontWeight.w800,
                                                          ),
                                                          const Gap(5),
                                                          CustomText(
                                                            title: item.phone,
                                                            color: AppColor()
                                                                .primaryColorGreen,
                                                            size: 14,
                                                            weight:
                                                                FontWeight.w500,
                                                          ),
                                                        ],
                                                      ),
                                                      const Gap(5),
                                                      Row(
                                                        children: [
                                                          CustomText(
                                                            title:
                                                                'Time created:',
                                                            color: AppColor()
                                                                .primaryColorGreen,
                                                            size: 14,
                                                            weight:
                                                                FontWeight.w800,
                                                          ),
                                                          const Gap(5),
                                                          CustomText(
                                                            title:
                                                                " ${item.createdAt.year.toString()}-${item.createdAt.month.toString().padLeft(2, '0')}-${item.createdAt.day.toString().padLeft(2, '0')} ",
                                                            color: AppColor()
                                                                .primaryGreen,
                                                            size: 14,
                                                          ),
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
                                                              title:
                                                                  "Delete Container",
                                                              middleText:
                                                                  "Are you sure you want to delete this contanier",
                                                              titleStyle: GoogleFonts
                                                                  .nunito(
                                                                      textStyle:
                                                                          TextStyle(
                                                                color: AppColor()
                                                                    .primaryColorPurple,
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w800,
                                                              )),
                                                              titlePadding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      top: 20),
                                                              contentPadding:
                                                                  const EdgeInsets
                                                                          .symmetric(
                                                                      horizontal:
                                                                          8,
                                                                      vertical:
                                                                          15),
                                                              content:
                                                                  Container(
                                                                padding: const EdgeInsets
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
                                                                          'Are you sure you want delete this container, This process can not be undo',
                                                                      color: AppColor()
                                                                          .primaryDark,
                                                                      size: 14,
                                                                      weight: FontWeight
                                                                          .w500,
                                                                    ),
                                                                    const Gap(
                                                                        15),
                                                                    Row(
                                                                      children: [
                                                                        Expanded(
                                                                          child:
                                                                              Obx(() {
                                                                            return InkWell(
                                                                              onTap: () {
                                                                                print(item.id);
                                                                                if (authController.deleteContainerStatus != DeleteContainerStatus.loading) {
                                                                                  authController.deleteContainer(containerId: item.id);
                                                                                  Get.back();
                                                                                }
                                                                              },
                                                                              child: Container(
                                                                                height: 40,
                                                                                width: Get.width,
                                                                                decoration: BoxDecoration(
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
                                                                              height: 40,
                                                                              width: Get.width,
                                                                              decoration: BoxDecoration(
                                                                                  borderRadius: BorderRadius.circular(8),
                                                                                  color: AppColor().primaryWhite,
                                                                                  border: Border.all(
                                                                                    color: AppColor().primaryRed,
                                                                                  )),
                                                                              child: Center(
                                                                                  child: CustomText(
                                                                                title: 'Cancel',
                                                                                color: AppColor().primaryRed,
                                                                                weight: FontWeight.w600,
                                                                                size: 12,
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
                                                      const Gap(5),
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
                                                                      .circular(
                                                                          20),
                                                                ),
                                                              ),
                                                              context: context,
                                                              builder: (context) =>
                                                                  CreateContainer(
                                                                    create:
                                                                        'false',
                                                                    id: item.id
                                                                        .toString(),
                                                                  ));
                                                        },
                                                        child: Container(
                                                          height: 25,
                                                          width: 50,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
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
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              const Gap(15),
                                              InkWell(
                                                onTap: () {
                                                  showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      backgroundColor:
                                                          AppColor()
                                                              .primaryWhite,
                                                      shape:
                                                          const RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .vertical(
                                                          top: Radius.circular(
                                                              20),
                                                        ),
                                                      ),
                                                      context: context,
                                                      builder: (context) =>
                                                          AddCollector(
                                                            create: 'false',
                                                            id: item.id
                                                                .toString(),
                                                          ));
                                                },
                                                child: Container(
                                                  height: 40,
                                                  width: Get.width,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    color: AppColor()
                                                        .primaryColorGreen,
                                                  ),
                                                  child: Center(
                                                      child: CustomText(
                                                    title: 'Add to Team',
                                                    color:
                                                        AppColor().primaryWhite,
                                                    weight: FontWeight.w600,
                                                    size: 14,
                                                  )),
                                                ),
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

class AddCollector extends StatefulWidget {
  final String? create;
  final String? id;
  const AddCollector({super.key, this.create, this.id});

  @override
  State<AddCollector> createState() => _AddCollectorState();
}

class _AddCollectorState extends State<AddCollector> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final authController = Get.put(AuthRepo());

  String? selectedTeamName;

  String? selectedPosition;

  final List<String> position = [
    'leader1',
    'leader2',
    'member',
  ];

  // var item = authController.getContainerList[index];
  @override
  Widget build(BuildContext context) {
    print("ID is ${widget.id}");
    return SizedBox(
        height: widget.create == "false" ? 350 : 440,
        child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Get.height * 0.025,
              vertical: Get.height * 0.03,
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        title: 'Add Collector to Team',
                        color: AppColor().primaryDark,
                        size: 16,
                        weight: FontWeight.w700,
                      ),
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
                  Container(
                    width: Get.width,
                    height: 58,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: AppColor().greyColor)),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2(
                        hint: Text(
                          'Team Name',
                          style: TextStyle(
                            fontSize: 14,
                            color: Theme.of(context).hintColor,
                          ),
                        ),
                        items: authController.getTeamsList
                            .map((category) => DropdownMenuItem(
                                  value: category.name,
                                  child: Text(
                                    category.name!,
                                    style: const TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ))
                            .toList(),
                        value: selectedTeamName,
                        onChanged: (value) {
                          setState(() {
                            selectedTeamName = value as String;
                          });
                        },
                        buttonStyleData: const ButtonStyleData(
                          height: 40,
                          width: 140,
                        ),
                        menuItemStyleData: const MenuItemStyleData(
                          height: 40,
                        ),
                      ),
                    ),
                  ),
                  // CustomTextField(
                  //   keyType: TextInputType.number,
                  //   textEditingController:
                  //       authController.containerVolumeController,
                  //   hint: "Conatainer Volume",
                  //   hintColor: AppColor().greyColor.withOpacity(0.3),
                  //   validate: (value) {
                  //     if (value!.isEmpty) {
                  //       return 'Conatainer Volume must not be empty';
                  //     }
                  //     return null;
                  //   },
                  // ),
                  Gap(Get.height * 0.015),
                  CustomText(
                    title: 'Position',
                    color: AppColor().greyColor,
                    size: 14,
                    weight: FontWeight.w500,
                  ),
                  Gap(Get.height * 0.01),
                  Container(
                    width: Get.width,
                    height: 58,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: AppColor().greyColor)),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2(
                        hint: Text(
                          'Collector Position',
                          style: TextStyle(
                            fontSize: 14,
                            color: Theme.of(context).hintColor,
                          ),
                        ),
                        items: position
                            .map((item) => DropdownMenuItem(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: const TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ))
                            .toList(),
                        value: selectedPosition,
                        onChanged: (value) {
                          setState(() {
                            selectedPosition = value as String;
                          });
                        },
                        buttonStyleData: const ButtonStyleData(
                          height: 40,
                          width: 140,
                        ),
                        menuItemStyleData: const MenuItemStyleData(
                          height: 40,
                        ),
                      ),
                    ),
                  ),
                  // CustomTextField(
                  //   textEditingController:
                  //       authController.containerTeamController,
                  //   hint: "Create Team",
                  //   hintColor: AppColor().greyColor.withOpacity(0.3),
                  //   validate: (value) {
                  //     if (value!.isEmpty) {
                  //       return 'Last Name must not be empty';
                  //     }
                  //     return null;
                  //   },
                  // ),
                  Gap(Get.height * 0.02),
                  Obx(() {
                    return InkWell(
                      onTap: () {
                        // print('Users: ${createCollector.toJson()}');
                        print('here on sending page');
                        if (authController.addColletorStatus !=
                            AddColletorStatus.loading) {
                          authController.addCollector(
                              collectorID: widget.id,
                              position: selectedPosition,
                              teamName: selectedTeamName);
                        }
                        Get.back();
                      },
                      child: Container(
                        height: 50,
                        width: Get.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: AppColor().primaryColorPurple,
                        ),
                        child: (authController.addColletorStatus ==
                                AddColletorStatus.loading)
                            ? LoadingWidget()
                            : Center(
                                child: CustomText(
                                title: "Add to Team",
                                color: AppColor().primaryWhite,
                                weight: FontWeight.w600,
                                size: 16,
                              )),
                      ),
                    );
                  }),
                ])));
  }
}
