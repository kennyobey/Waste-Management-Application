import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:halal_design/controllers/auth_reposiotry.dart';
import 'package:halal_design/screens/constants/color.dart';
import 'package:halal_design/screens/widget/custom_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final authController = Get.put(AuthRepository());
  @override
  Widget build(BuildContext context) {
    print('home page ${authController.getUser()}');
    return Scaffold(
      backgroundColor: AppColor().backGround,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              //  height: 320,
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 60, bottom: 20),
              color: AppColor().primaryWhite,
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        "assets/images/pngs/alexandra-fuller-wkgv7I2VTzM-unsplash.png",
                        width: 50,
                        height: 70,
                        fit: BoxFit.contain,
                      ),
                      const Gap(10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            title: 'Hello!',
                            color: AppColor().primaryDark,
                            size: 18,
                            weight: FontWeight.w700,
                          ),
                          CustomText(
                            title: 'Ade Bamidele',
                            color: AppColor().primaryDark,
                            size: 16,
                            weight: FontWeight.w500,
                          ),
                        ],
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          SvgPicture.asset(
                            "assets/images/svgs/notification_bell.svg",
                            // height: 30,
                          ),
                          const Gap(10),
                          SvgPicture.asset(
                            "assets/images/svgs/vertical_line.svg",
                            // height: 30,
                          ),
                          const Gap(10),
                          SvgPicture.asset(
                            "assets/images/svgs/menuIcon.svg",
                            // height: 30,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Gap(30),
                  Container(
                    height: 114,
                    width: MediaQuery.maybeOf(context)?.size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColor().primaryColorGreen),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 22, vertical: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CustomText(
                                title: 'Wallet balance',
                                color: AppColor().primaryWhite,
                                size: 10,
                                weight: FontWeight.w500,
                              ),
                              const Spacer(),
                              Container(
                                padding: const EdgeInsets.all(4),
                                height: 23.6,
                                width: 57,
                                decoration: BoxDecoration(
                                    color: AppColor().lightPurple,
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        color: AppColor().brightPurple,
                                        width: 1)),
                                alignment: Alignment.center,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Image.asset(
                                        'assets/images/pngs/image 11.png'),
                                    SvgPicture.asset(
                                      "assets/images/svgs/arrow_down.svg",
                                      height: 7, width: 7,
                                      // height: 30,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          const Gap(10),
                          Row(
                            children: [
                              CustomText(
                                title: '₦460,000.00',
                                color: AppColor().primaryWhite,
                                size: 16,
                                weight: FontWeight.w900,
                              ),
                              const Gap(5),
                              Icon(
                                Icons.visibility_off,
                                color: AppColor().lightPurple,
                              )
                            ],
                          ),
                          const Gap(20),
                          Row(
                            children: [
                              CustomText(
                                title: 'GTB | 0123456789 | Ade bamidele',
                                color: AppColor().primaryWhite,
                                size: 10,
                                weight: FontWeight.w400,
                              ),
                              const Spacer(),
                              SvgPicture.asset(
                                "assets/images/svgs/copy_svg.svg",
                                // height: 30,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Gap(20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    height: 84,
                    decoration: BoxDecoration(
                      color: AppColor().primaryWhite,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/images/svgs/transfer_icon.svg",
                          // height: 30,
                        ),
                        const Gap(15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(
                              title: 'Transfer',
                              color: AppColor().primaryDark,
                              size: 16,
                              weight: FontWeight.w600,
                            ),
                            const Gap(3),
                            CustomText(
                              title: 'Make instant wire or swift transfer ',
                              color: AppColor().primaryDark,
                              size: 10,
                              weight: FontWeight.w400,
                            ),
                          ],
                        ),
                        const Spacer(),
                        SvgPicture.asset(
                          "assets/images/svgs/forward_arrow.svg",
                          // height: 30,
                        ),
                      ],
                    ),
                  ),
                  const Gap(15),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    height: 84,
                    decoration: BoxDecoration(
                      color: AppColor().primaryWhite,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/images/svgs/top_up_icon.svg",
                          // height: 30,
                        ),
                        const Gap(15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(
                              title: 'Top Up',
                              color: AppColor().lightPurple,
                              size: 16,
                              weight: FontWeight.w600,
                            ),
                            const Gap(3),
                            CustomText(
                              title: 'Fund your account with ease',
                              color: AppColor().primaryDark,
                              size: 10,
                              weight: FontWeight.w400,
                            ),
                          ],
                        ),
                        const Spacer(),
                        SvgPicture.asset(
                          "assets/images/svgs/forward_arrow.svg",
                          // height: 30,
                        ),
                      ],
                    ),
                  ),
                  const Gap(15),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    height: 84,
                    decoration: BoxDecoration(
                      color: AppColor().primaryWhite,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/images/svgs/xchange_icon.svg",
                          // height: 30,
                        ),
                        const Gap(15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(
                              title: 'Xchange',
                              color: AppColor().primaryWine,
                              size: 16,
                              weight: FontWeight.w600,
                            ),
                            const Gap(3),
                            CustomText(
                              title: 'Get the best currency exchange rate',
                              color: AppColor().primaryDark,
                              size: 10,
                              weight: FontWeight.w400,
                            ),
                          ],
                        ),
                        const Spacer(),
                        SvgPicture.asset(
                          "assets/images/svgs/forward_arrow.svg",
                          // height: 30,
                        ),
                      ],
                    ),
                  ),
                  const Gap(20),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    width: MediaQuery.of(context).size.width,
                    height: 150,
                    decoration: BoxDecoration(
                      color: AppColor().primaryWhite,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          title: 'Almost there, Kindly complete your KYC',
                          color: AppColor().primaryDark,
                          size: 10,
                          weight: FontWeight.w400,
                        ),
                        const Gap(10),
                        Row(
                          children: [
                            SizedBox(
                              width: 200,
                              child: LinearProgressIndicator(
                                minHeight: 5,
                                backgroundColor: AppColor().backGround,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  AppColor().loadingGreen,
                                ),
                              ),
                            ),
                            const Gap(10),
                            CustomText(
                              title: '50%',
                              color: AppColor().primaryDark,
                              size: 12,
                              weight: FontWeight.w400,
                            ),
                          ],
                        ),
                        const Gap(10),
                        Row(
                          children: [
                            SvgPicture.asset(
                              "assets/images/svgs/next_of_kin.svg",
                              // height: 30,
                            ),
                            const Gap(10),
                            CustomText(
                              title: 'Next of KIN',
                              color: AppColor().primaryDark,
                              size: 12,
                              weight: FontWeight.w600,
                            ),
                            const Spacer(),
                            CustomText(
                              title: 'PENDING',
                              color: AppColor().primaryYellow,
                              size: 12,
                              weight: FontWeight.w600,
                            ),
                          ],
                        ),
                        Divider(
                          color: AppColor().primaryDark,
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              "assets/images/svgs/location.svg",
                              // height: 30,
                            ),
                            const Gap(10),
                            CustomText(
                              title: 'Residential Address',
                              color: AppColor().primaryDark,
                              size: 12,
                              weight: FontWeight.w600,
                            ),
                            const Spacer(),
                            CustomText(
                              title: 'PENDING',
                              color: AppColor().primaryYellow,
                              size: 12,
                              weight: FontWeight.w600,
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
