// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables, unused_field

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:halal_design/screens/constants/color.dart';
import 'package:halal_design/screens/ui/auth_screen/account_type.dart';
import 'package:halal_design/screens/widget/button_widget.dart';
import 'package:halal_design/screens/widget/custom_text.dart';


class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int pageCount = 0;

  final PageController _pageController = PageController();

  void setPageCount(int aPageCount) {
    setState(() {
      pageCount = aPageCount;
    });
  }

  final List<Map<String?, String?>> data = [
    {
      'title': "Dispose your waste",
      'desc': "Manage your waste",
    },
    {
      'title': "Manage Waste Team",
      'desc':
          "Buy and sell your gift card with no hassle, security and transparency guaranteed !",
    },
    {
      'title': "Monitor Waste Disposal",
      'desc':
          "Either you want to shop anywhere or subscribe for your favorite entertainment channel, Bayar Card covers you",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // backgroundColor: AppColor().primaryColorGreen,
      body: Container(
        color: AppColor().primaryWhite,
        // height: 700,
        // color: pageCount == 1
        //     ? AppColor().primaryColorGreen.withOpacity(0.2)
        //     : AppColor().primaryColorPurple.withOpacity(0.2),
        child: Padding(
          padding: EdgeInsets.only(
            top: Get.height * 0.1,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // IllustrationPageView(_pageController, setPageCount),

              if (pageCount == 0) ...[
                Container(
                  color: AppColor().primaryColorGreen.withOpacity(0.2),
                ),
                Image.asset(
                  "assets/images/pngs/onboarding1.png",
                  height: Get.height * 0.4,
                  fit: BoxFit.contain,
                ),
              ] else if (pageCount == 1) ...[
                Container(
                  color: AppColor().primaryColorGreen.withOpacity(0.2),
                ),
                Image.asset(
                  "assets/images/pngs/onboarding2.png",
                  height: Get.height * 0.4,
                  fit: BoxFit.contain,
                ),
              ] else ...[
                Container(
                  color: AppColor().primaryColorGreen.withOpacity(0.2),
                ),
                Image.asset(
                  "assets/images/pngs/onboarding3.png",
                  height: Get.height * 0.4,
                  fit: BoxFit.contain,
                ),
              ],
              //Gap(Get.height * 0.09),
              Expanded(
                child: Container(
                  color: AppColor().primaryWhite,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: Get.width * 0.1,
                      right: Get.width * 0.1,
                      top: Get.height * 0.04,
                    ),
                    child: Column(
                      children: [
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     PageIndicator(pageCount, 0, 16),
                        //     const SizedBox(width: 3),
                        //     PageIndicator(pageCount, 1, 16),
                        //     SizedBox(
                        //       width:Get.height * 0.4,
                        //     ),
                        //     PageIndicator(pageCount, 2, 16),
                        //   ],
                        // ),
                        // Gap(Get.height * 0.001),
                        Container(
                          padding: EdgeInsets.only(
                            left: Get.width * 0.02,
                            right: Get.width * 0.02,
                            top: Get.height * 0.02,
                            bottom: Get.height * 0.02,
                          ),
                          //  height: Get.height * 0.20,
                          width: Get.width * 0.9,
                          decoration: BoxDecoration(
                              color: AppColor().primaryWhite,
                              // color: pageCount == 1
                              //     ? AppColor()
                              //         .primaryColorPurple
                              //         .withOpacity(0.05)
                              //     : AppColor()
                              //         .primaryColorGreen
                              //         .withOpacity(0.05),
                              borderRadius: BorderRadius.circular(8)),
                          child: Center(
                            child: Column(
                              children: [
                                CustomText(
                                  title: data[pageCount]['title']!,
                                  size: 22,
                                  weight: FontWeight.w900,
                                  textAlign: TextAlign.center,
                                  color: AppColor().primaryDark,
                                ),
                                Gap(
                                  Get.height * 0.02,
                                ),
                                CustomText(
                                  title: data[pageCount]['desc']!,
                                  size: 14,
                                  weight: FontWeight.w500,
                                  textAlign: TextAlign.center,
                                  color: AppColor().textBlack,
                                ),
                                Gap(Get.height * 0.04),
                                // const Spacer(),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomFillButton(
                                      onTap: () {
                                        if (pageCount < 2) {
                                          setState(() {
                                            pageCount++;
                                            if (kDebugMode) {
                                              print('PageCount: $pageCount');
                                            }
                                          });
                                        } else {
                                          Get.off(() => const AccountType());
                                          // Get.off(() => const SignUpEmail());
                                          Get.snackbar(
                                            'Alert',
                                            'Please choose an account type to proceed!',
                                          );
                                        }
                                      },
                                      height: 50,
                                      width: Get.width,
                                      buttonText: 'Get Started',
                                      textColor: AppColor().primaryWhite,
                                      buttonColor: AppColor().primaryColorGreen,
                                      boarderColor:
                                          AppColor().primaryColorGreen,
                                      borderRadius: BorderRadius.circular(25),
                                      fontWeight: FontWeight.w600,
                                    ),
                                    Gap(Get.height * 0.02),
                                    CustomFillButton(
                                      onTap: () {
                                        //  Get.off(() => const LoginPage());
                                        // Get.snackbar(
                                        //   'Alert',
                                        //   'Please choose an account type to proceed!',
                                        // );
                                      },
                                      height: 50,
                                      width: Get.width,
                                      buttonText: 'Sign in',
                                      textColor: AppColor().primaryWhite,
                                      buttonColor:
                                          AppColor().primaryColorPurple,
                                      boarderColor:
                                          AppColor().primaryColorPurple,
                                      borderRadius: BorderRadius.circular(25),
                                      fontWeight: FontWeight.w600,
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
                ),
              ),
              // TextView(pageCount),
              // Gap(Geteight * 0.02),
            ],
          ),
        ),
      ),
    );
  }
}

// class TextView extends StatelessWidget {
//   int pageCount;

//   TextView(this.pageCount, {Key? key}) : super(key: key);

//   //final controller = Get.find<UserRepository>();
//   @override
//   Widget build(BuildContext context) {
//     final List<Map<String?, String?>> data = [
//       {
//         'title': "Pay Your supplier with Good Exchange Rate",
//         'desc':
//             "pay your suppliers in the US, HongKong, and Europe between 1 - 24 hour.",
//       },
//       {
//         'title': "Send Money home and Spend Easily",
//         'desc':
//             "Send money to your family using the local account and spend easily using the foreign account",
//       },
//       {
//         'title': "A Virtual Card for Everything",
//         'desc':
//             "Either you want to shop anywhere or subscribe for your favorite entertainment channel, Bayar Card covers you",
//       },
//     ];
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 10.0),
//       child: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               PageIndicator(pageCount, 0, 50),
//               const SizedBox(
//                 width: 8,
//               ),
//               PageIndicator(pageCount, 1, 50),
//               const SizedBox(
//                 width: 8,
//               ),
//               PageIndicator(pageCount, 2, 50),
//             ],
//           ),
//
//           Container(
//             padding: const EdgeInsets.all(12),
//             height: 370,
//             width: 343,
//             decoration: BoxDecoration(
//                 color: AppColor().primaryColorGreen.withOpacity(0.5),
//                 borderRadius: BorderRadius.circular(8)),
//             child: Column(
//               children: [
//                 CustomText(
//                   title: data[pageCount]['title']!,
//                   size: 22,
//                   weight: FontWeight.w900,
//                   textAlign: TextAlign.center,
//                   color: AppColor().primaryDark,
//                 ),
//                 const Gap(20),
//                 CustomText(
//                   title: data[pageCount]['desc']!,
//                   size: 16,
//                   weight: FontWeight.w300,
//                   textAlign: TextAlign.center,
//                   color: AppColor().textBlack,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class IllustrationPageView extends StatefulWidget {
  final controller;
  final Function(int) callback;

  const IllustrationPageView(this.controller, this.callback, {Key? key})
      : super(key: key);

  @override
  State<IllustrationPageView> createState() => _IllustrationPageViewState();
}

class _IllustrationPageViewState extends State<IllustrationPageView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.38,
      width: double.infinity,
      child: PageView(
        controller: widget.controller,
        onPageChanged: (pageNum) {
          widget.callback(pageNum);
        },
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Align(
              alignment: Alignment.center,
              child: Image.asset("assets/images/pngs/image 8.png"),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Image.asset("assets/images/pngs/image 8.png"),
          ),
          Align(
            alignment: Alignment.center,
            child: Image.asset("assets/images/pngs/image 10.png"),
          ),
        ],
      ),
    );
  }
}
