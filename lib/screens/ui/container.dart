import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:halal_design/screens/constants/color.dart';

import '../widget/custom_text.dart';

class BayarX extends StatefulWidget {
  const BayarX({super.key});

  @override
  State<BayarX> createState() => _BayarXState();
}

class _BayarXState extends State<BayarX> {
  @override
  Widget build(BuildContext context) {
    print("BayarX");
    return Scaffold(
      backgroundColor: AppColor().backGround,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  //height: 320,
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 70, bottom: 60),
                  color: AppColor().primaryWhite,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                title: 'Card',
                                color: AppColor().primaryDark,
                                size: 22,
                                weight: FontWeight.w900,
                              ),
                              CustomText(
                                title: 'View card details',
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
                const Gap(20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    padding: EdgeInsets.all(20),
                    height: 253,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(color: AppColor().primaryWhite),
                    child: Center(
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Image.asset(
                                'assets/images/pngs/virtual_card.png',
                              ),
                              Positioned(
                                top: 5,
                                left: 10,
                                child: Image.asset(
                                  'assets/images/pngs/virtual_card2.png',
                                ),
                              ),
                            ],
                          ),
                          const Gap(20),
                          CustomText(
                            title: '+   Fund Card',
                            size: 16,
                            weight: FontWeight.w500,
                            color: AppColor().lightPurple,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const Gap(20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    height: 250,
                    decoration: BoxDecoration(color: AppColor().primaryWhite),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CustomText(
                              title: 'Visa Card',
                              size: 10,
                              weight: FontWeight.w500,
                              color: AppColor().primaryGreen,
                            ),
                          ],
                        ),
                        const Gap(20),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  title: 'Account name',
                                  size: 10,
                                  weight: FontWeight.w400,
                                  color: AppColor().greyColor,
                                ),
                                const Gap(10),
                                Row(
                                  children: [
                                    CustomText(
                                      title: 'Ade Bamidele',
                                      size: 12,
                                      weight: FontWeight.w600,
                                      color: AppColor().primaryDark,
                                    ),
                                    const Gap(10),
                                    SvgPicture.asset(
                                      'assets/images/svgs/copy2.svg',
                                      color: AppColor().greyColor,
                                      height: 10,
                                      width: 10,
                                    )
                                  ],
                                ),
                              ],
                            ),
                            const Spacer(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                CustomText(
                                  title: 'Card number',
                                  size: 10,
                                  weight: FontWeight.w400,
                                  color: AppColor().greyColor,
                                ),
                                const Gap(10),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/images/svgs/copy2.svg',
                                      color: AppColor().greyColor,
                                      height: 10,
                                      width: 10,
                                    ),
                                    const Gap(10),
                                    CustomText(
                                      title: '0934 ***** 3289',
                                      size: 12,
                                      weight: FontWeight.w600,
                                      color: AppColor().primaryDark,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Gap(20),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  title: 'CVV',
                                  size: 10,
                                  weight: FontWeight.w400,
                                  color: AppColor().greyColor,
                                ),
                                const Gap(10),
                                Row(
                                  children: [
                                    CustomText(
                                      title: '870',
                                      size: 12,
                                      weight: FontWeight.w600,
                                      color: AppColor().primaryDark,
                                    ),
                                    const Gap(10),
                                    SvgPicture.asset(
                                      'assets/images/svgs/copy2.svg',
                                      color: AppColor().greyColor,
                                      height: 10,
                                      width: 10,
                                    )
                                  ],
                                ),
                              ],
                            ),
                            const Spacer(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                CustomText(
                                  title: 'Expiry Date',
                                  size: 10,
                                  weight: FontWeight.w400,
                                  color: AppColor().greyColor,
                                ),
                                const Gap(10),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/images/svgs/copy2.svg',
                                      color: AppColor().greyColor,
                                      height: 10,
                                      width: 10,
                                    ),
                                    const Gap(10),
                                    CustomText(
                                      title: '2023 - 02',
                                      size: 12,
                                      weight: FontWeight.w600,
                                      color: AppColor().primaryDark,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Gap(20),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  title: 'Billing Address',
                                  size: 10,
                                  weight: FontWeight.w400,
                                  color: AppColor().greyColor,
                                ),
                                const Gap(10),
                                Row(
                                  children: [
                                    CustomText(
                                      title: '870',
                                      size: 12,
                                      weight: FontWeight.w600,
                                      color: AppColor().primaryDark,
                                    ),
                                    const Gap(10),
                                    SvgPicture.asset(
                                      'assets/images/svgs/copy2.svg',
                                      color: AppColor().greyColor,
                                      height: 10,
                                      width: 10,
                                    )
                                  ],
                                ),
                              ],
                            ),
                            const Spacer(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                CustomText(
                                  title: 'Card number',
                                  size: 10,
                                  weight: FontWeight.w400,
                                  color: AppColor().greyColor,
                                ),
                                const Gap(10),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/images/svgs/copy2.svg',
                                      color: AppColor().greyColor,
                                      height: 10,
                                      width: 10,
                                    ),
                                    const Gap(10),
                                    CustomText(
                                      title: '0934 ***** 3289',
                                      size: 12,
                                      weight: FontWeight.w600,
                                      color: AppColor().primaryDark,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const Gap(20),
                Center(
                    child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        SvgPicture.asset(
                          'assets/images/svgs/delete.svg',
                          height: 30,
                          width: 30,
                        ),
                        const Gap(5),
                        CustomText(
                          title: 'Delete card',
                          size: 10,
                          weight: FontWeight.w400,
                          color: AppColor().greyColor,
                        ),
                      ],
                    ),
                    const Gap(15),
                    Column(
                      children: [
                        SvgPicture.asset(
                          'assets/images/svgs/freeze.svg',
                          height: 30,
                          width: 30,
                        ),
                        const Gap(5),
                        CustomText(
                          title: 'Freeze',
                          size: 10,
                          weight: FontWeight.w400,
                          color: AppColor().greyColor,
                        ),
                      ],
                    )
                  ],
                ))
              ]),
        ),
      ),
    );
  }
}
