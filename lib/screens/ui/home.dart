

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:halal_design/controllers/auth_reposiotry.dart';
import 'package:halal_design/screens/constants/color.dart';
import 'package:halal_design/screens/ui/collector/create_collector.dart';
import 'package:halal_design/screens/widget/custom_text.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

  Future<void> GetAddressFromLatLong(Position position) async {
    List<Placemark> placemark =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemark);
    Placemark place = placemark[0];
    address =
        '${place.street}, ${place.subLocality} ${place.locality}, ${place.country}';
    setState(() {});
  }

  // void getLocation() async {
  //   await Geolocator.checkPermission();
  //   await Geolocator.requestPermission();
  //   Position position = await Geolocator.getCurrentPosition(
  //       desiredAccuracy: LocationAccuracy.high);
  //   print(position);
  // }

  // void getAddress() async {
  //   List<Placemark> placemarks =
  //       await placemarkFromCoordinates(37.78583, -122.406417);
  //   print(placemarks);
  //   Placemark place = placemarks[0];
  //   address = ', ${place.street}, ${place.subLocality} ${place.locality}';
  //   setState(() {});
  // }

  String? locaion = "Lat and Long";
  String? address = "Address";

  final authController = Get.put(AuthRepo());
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
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CustomText(
                            title: 'Welcome',
                            color: AppColor().primaryDark,
                            size: 18,
                            weight: FontWeight.w700,
                          ),
                          Row(
                            children: [
                              CustomText(
                                title: authController.user!.firstName,
                                color: AppColor().primaryDark,
                                size: 16,
                                weight: FontWeight.w500,
                              ),
                              const Gap(5),
                              CustomText(
                                title: authController.user!.lastName,
                                color: AppColor().primaryDark,
                                size: 16,
                                weight: FontWeight.w500,
                              ),
                            ],
                          ),
                          // const Gap(3),
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
                    // height: 114,
                    width: MediaQuery.maybeOf(context)?.size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColor().primaryColorGreen),
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
                                title: 'Role:',
                                color: AppColor().primaryWhite,
                                size: 12,
                                weight: FontWeight.w800,
                              ),
                              const Gap(5),
                              CustomText(
                                title: authController.user!.role!.toUpperCase(),
                                color: AppColor().primaryWhite,
                                size: 10,
                                weight: FontWeight.w500,
                              ),
                              // const Spacer(),
                              // Container(
                              //   padding: const EdgeInsets.all(4),
                              //   height: 23.6,
                              //   width: 57,
                              //   decoration: BoxDecoration(
                              //       color: AppColor().lightPurple,
                              //       borderRadius: BorderRadius.circular(5),
                              //       border: Border.all(
                              //           color: AppColor().brightPurple,
                              //           width: 1)),
                              //   alignment: Alignment.center,
                              //   child: Row(
                              //     mainAxisAlignment:
                              //         MainAxisAlignment.spaceAround,
                              //     children: [
                              //       Image.asset(
                              //           'assets/images/pngs/image 11.png'),
                              //       SvgPicture.asset(
                              //         "assets/images/svgs/arrow_down.svg",
                              //         height: 7, width: 7,
                              //         // height: 30,
                              //       ),
                              //     ],
                              //   ),
                              // )
                            ],
                          ),
                          const Gap(5),
                          Row(
                            children: [
                              CustomText(
                                title: 'Phone No',
                                color: AppColor().primaryWhite,
                                size: 12,
                                weight: FontWeight.w800,
                              ),
                              const Gap(10),
                              CustomText(
                                title: '${authController.user!.phone}',
                                color: AppColor().primaryWhite,
                                size: 14,
                                weight: FontWeight.w500,
                              ),
                              const Gap(5),
                              // Icon(
                              //   Icons.visibility_off,
                              //   color: AppColor().lightPurple,
                              // )
                            ],
                          ),
                          const Gap(5),
                          Row(
                            children: [
                              CustomText(
                                title: 'Address:',
                                color: AppColor().primaryWhite,
                                size: 12,
                                weight: FontWeight.w800,
                              ),
                              const Gap(10),
                              CustomText(
                                title: authController.user!.address,
                                color: AppColor().primaryWhite,
                                size: 14,
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
                        InkWell(
                          onTap: () {
                            showModalBottomSheet(
                                isScrollControlled: true,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20),
                                  ),
                                ),
                                context: context,
                                builder: (context) => const CreateCollector());
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText(
                                title: 'Create Collector',
                                color: AppColor().primaryDark,
                                size: 16,
                                weight: FontWeight.w600,
                              ),
                              const Gap(3),
                              CustomText(
                                title:
                                    'Create a list of collector you will be managing',
                                color: AppColor().primaryDark,
                                size: 10,
                                weight: FontWeight.w400,
                              ),
                            ],
                          ),
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
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                          isScrollControlled: true,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20),
                            ),
                          ),
                          context: context,
                          builder: (context) => CreateTeam());
                    },
                    child: Container(
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
                                title: 'Create Team',
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
                  ),
                  const Gap(15),
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                          isScrollControlled: true,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20),
                            ),
                          ),
                          context: context,
                          builder: (context) => CreateContainer());
                    },
                    child: Container(
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
                                title: 'Create Container',
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
                  ),
                  const Gap(10),
                  CustomText(
                    title: 'Location',
                    color: AppColor().primaryDark,
                    size: 16,
                    weight: FontWeight.w600,
                  ),
                  const Gap(10),
                  CustomText(
                    title: locaion,
                    color: AppColor().primaryColorPurple,
                    size: 14,
                    weight: FontWeight.w400,
                  ),
                  const Gap(10),
                  CustomText(
                    title: 'Location',
                    color: AppColor().primaryDark,
                    size: 16,
                    weight: FontWeight.w600,
                  ),
                  const Gap(10),
                  CustomText(
                    title: address,
                    color: AppColor().primaryColorPurple,
                    size: 14,
                    weight: FontWeight.w400,
                  ),
                  const Gap(15),
                  InkWell(
                    onTap: () async {
                      Position position = await _determinePosition();
                      print("Longitude ${position.latitude}");
                      print("Latitude ${position.longitude}");
                      locaion =
                          "Latitude : ${position.latitude} and Longitude: ${position.longitude}";
                      GetAddressFromLatLong(position);
                      setState(() {});
                      // getLocation();
                      // getAddress();
                    },
                    child: Container(
                      height: 50,
                      width: Get.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColor().primaryColorPurple,
                      ),
                      child: Center(
                          child: CustomText(
                        title: 'Get Loctaion',
                        color: AppColor().primaryWhite,
                        weight: FontWeight.w600,
                        size: 16,
                      )),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
