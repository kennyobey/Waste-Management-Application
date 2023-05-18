import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:halal_design/screens/ui/account.dart';
import 'package:halal_design/screens/ui/bayarx.dart';
import 'package:halal_design/screens/ui/home.dart';
import '../constants/color.dart';
import '../widget/custom_text.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int selectedIndex = 0;

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const HomePage();
  bool isclicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: AppColor().primaryWhite,
        body: PageStorage(
          bucket: bucket,
          child: currentScreen,
        ),
        bottomNavigationBar: BottomAppBar(
          color: AppColor().backGround,
          child: Container(
            padding: const EdgeInsets.all(12),
            //   margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                color: AppColor().primaryWhite),
            height: 74,
            child: Column(
              children: [
                const Gap(10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildButton(
                          onPress: () {
                            setState(() {
                              currentScreen = const HomePage();
                              selectedIndex = 0;
                              isclicked = !isclicked;
                            });
                          },
                          image: 'assets/images/svgs/home.svg',
                          title: 'Dahboard'),
                      buildButton(
                          onPress: () {
                            setState(() {
                              currentScreen = const Card();
                              selectedIndex = 1;
                            });
                          },
                          image: 'assets/images/svgs/cards.svg',
                          title: 'Cards'),
                      buildButton(
                          onPress: () {
                            setState(() {
                              currentScreen = const Account();
                              selectedIndex = 2;
                            });
                          },
                          image: 'assets/images/svgs/bank.svg',
                          title: 'Accounts'),
                      buildButton(
                          onPress: () {
                            setState(() {
                              currentScreen = const BayarX();
                              selectedIndex = 3;
                            });
                          },
                          image: 'assets/images/svgs/stickynote.svg',
                          title: 'BayarX'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Widget buildButton({VoidCallback? onPress, String? image, String? title}) {
    return InkWell(
      onTap: onPress,
      child: SizedBox(
        height: 40,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              image!,
              height: isclicked ? 20 : 18,
              // color: isclicked ? AppColor().lightPurple : AppColor().greyColor,
            ),
            CustomText(
                title: title!,
                size: 11,
                weight: FontWeight.w400,
                color:
                    isclicked ? AppColor().lightPurple : AppColor().greyColor),
          ],
        ),
      ),
    );
  }
}

class Dash extends StatefulWidget {
  const Dash({super.key});

  @override
  State<Dash> createState() => _DashState();
}

class _DashState extends State<Dash> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      ),
      bottomNavigationBar: CreateBottombar(context),
    );
  }

  final _widgetOptions = [
    const HomePage(),
    const Card(),
    const Account(),
    const BayarX()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Container CreateBottombar(BuildContext context) {
    return Container(
      height: 130,
      //add ClipRRect widget for Round Corner
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
        child: BottomNavigationBar(
          //add background color
          // backgroundColor: AppColor().primaryColor,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/images/svgs/home.svg',
                height: 18,
                // color: isclicked ? AppColor().lightPurple : AppColor().greyColor,
              ),
              label: 'Dashboard',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/images/svgs/cards.svg',
                height: 18,
              ),
              label: 'Cards',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/images/svgs/bank.svg',
                height: 18,
              ),
              label: 'Accounts',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/images/svgs/stickynote.svg',
                height: 18,
              ),
              label: 'BayarX',
            )
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: AppColor().lightPurple,
          unselectedItemColor: AppColor().greyColor,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
