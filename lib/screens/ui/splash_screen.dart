import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:halal_design/screens/constants/color.dart';
import 'package:halal_design/screens/ui/onboarding_screen.dart';
import 'package:halal_design/screens/widget/custom_text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //final _controller = Get.find<UserRepository>();
  Timer? timer;

  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = const Duration(seconds: 5);
    return Timer(duration, route);
  }

  route() async {
    // if (_controller.status == Status.IsFirstTime) {
    //   Get.off(() => const Onboarding());
    // } else if (_controller.status == Status.Authenticated) {
    //   Get.off(() => const Dashboard());
    // } else if (_controller.status == Status.Unauthenticated) {
    //   Get.off(() => const Login());
    // } else {
    //   Get.off(() => LoadingPage());
    // }
    Get.off(() => const Onboarding());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor().primaryWhite,
      body: Padding(
        padding: const EdgeInsets.only(top: 200),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                'assets/images/pngs/splash_image.png',
                height: 300,
                width: 300,
              ),
            ),
             const Gap(40),
             CustomText(
              title: "Waste Management System",
              size: 18,
              weight: FontWeight.w700,
              textAlign: TextAlign.start,
              color: AppColor().primaryDark,
            ),
            const Spacer(),
            CustomText(
              title: "Dispose  |  Manage  |  Monitor",
              size: 18,
              weight: FontWeight.w700,
              textAlign: TextAlign.start,
              color: AppColor().primaryDark,
            ),
            const Gap(50),
          ],
        ),
      ),
    );
  }
}
