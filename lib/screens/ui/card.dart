import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:halal_design/screens/constants/color.dart';

import '../widget/custom_text.dart';

class Card extends StatefulWidget {
  const Card({super.key});

  @override
  State<Card> createState() => _CardState();
}

class _CardState extends State<Card> {
  @override
  Widget build(BuildContext context) {
    print("CaRD");
    return Scaffold(
      backgroundColor: AppColor().primaryColorPurple,
      body: Center(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                //  height: 320,
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 200, bottom: 60),
                color: AppColor().primaryWhite,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              title: 'Account',
                              color: AppColor().primaryDark,
                              size: 22,
                              weight: FontWeight.w900,
                            ),
                            CustomText(
                              title: 'Manage your account and transactios',
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
            ]),
      ),
    );
  }
}
