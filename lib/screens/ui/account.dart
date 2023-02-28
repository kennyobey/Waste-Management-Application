import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:halal_design/screens/constants/color.dart';
import 'package:halal_design/screens/widget/custom_text.dart';

import 'home.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> with SingleTickerProviderStateMixin {
  TabController? _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor().backGround,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            //  height: 320,
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 70, bottom: 40),
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
          const Gap(20),
          TabBar(
            indicatorColor: AppColor().lightPurple,
            tabs: const [
              CustomText(
                title: 'Account',
                size: 18,
                weight: FontWeight.w600,
              ),
              CustomText(
                title: 'Transactions',
                size: 18,
                weight: FontWeight.w600,
              ),
              CustomText(
                title: '',
                size: 18,
                weight: FontWeight.w600,
              ),
            ],
            controller: _tabController,
            indicatorSize: TabBarIndicatorSize.tab,
          ),
          const Gap(20),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [AccountPage(), AccountPage(), EmptyPage()],
            ),
          ),
          const Gap(20),
        ],
      ),
    );
  }
}

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SizedBox(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Container(
                  width: 201,
                  height: 117,
                  decoration: BoxDecoration(
                      color: AppColor().primaryGreen,
                      borderRadius: BorderRadius.circular(8)),
                  child: const Center(
                      child: Text(
                    'Item 1',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  )),
                ),
                const Gap(10),
                Container(
                  width: 201,
                  height: 117,
                  decoration: BoxDecoration(
                      color: AppColor().primaryGreen,
                      borderRadius: BorderRadius.circular(8)),
                  child: const Center(
                      child: Text(
                    'Item 1',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  )),
                ),
                const Gap(10),
                Container(
                  width: 201,
                  height: 117,
                  decoration: BoxDecoration(
                      color: AppColor().primaryGreen,
                      borderRadius: BorderRadius.circular(8)),
                  child: const Center(
                      child: Text(
                    'Item 1',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  )),
                ),
                const Gap(10),
                Container(
                  width: 201,
                  height: 117,
                  decoration: BoxDecoration(
                      color: AppColor().primaryGreen,
                      borderRadius: BorderRadius.circular(8)),
                  child: const Center(
                      child: Text(
                    'Item 1',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  )),
                ),
              ],
            ),
          ),
        ),
        const Gap(20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            padding: const EdgeInsets.all(12),
            height: 300,
            decoration: BoxDecoration(color: AppColor().primaryWhite),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  height: 50,
                  decoration: BoxDecoration(color: AppColor().backGround),
                  child: Row(
                    children: [
                      Image.asset('assets/images/pngs/usa_flag.png'),
                      const Gap(10),
                      const CustomText(
                        title: 'Your USD Bank Account',
                        size: 16,
                        weight: FontWeight.w800,
                      ),
                      const Spacer(),
                      SvgPicture.asset(
                        'assets/images/svgs/arrow_down.svg',
                        color: AppColor().primaryDark,
                        height: 10,
                        width: 10,
                      )
                    ],
                  ),
                ),
                const Gap(10),
                Row(
                  children: [
                    CustomText(
                      title: 'Account details',
                      size: 10,
                      weight: FontWeight.w500,
                      color: AppColor().lightPurple,
                    ),
                    const Spacer(),
                    CustomText(
                      title: 'Share',
                      size: 12,
                      weight: FontWeight.w500,
                      color: AppColor().greyColor,
                    ),
                    const Gap(10),
                    SvgPicture.asset(
                      'assets/images/svgs/share.svg',
                      color: AppColor().greyColor,
                      height: 10,
                      width: 10,
                    )
                  ],
                ),
                const Gap(20),
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
                const Gap(20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      title: 'Account no.',
                      size: 10,
                      weight: FontWeight.w400,
                      color: AppColor().greyColor,
                    ),
                    const Gap(10),
                    Row(
                      children: [
                        CustomText(
                          title: '0934 5678 3289',
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
                const Gap(20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      title: 'Bank name',
                      size: 10,
                      weight: FontWeight.w400,
                      color: AppColor().greyColor,
                    ),
                    const Gap(10),
                    Row(
                      children: [
                        CustomText(
                          title: '1234567894356',
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
              ],
            ),
          ),
        ),
        const Gap(10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: CustomText(
            title: 'View more details',
            size: 12,
            weight: FontWeight.w600,
            color: AppColor().primaryGreen,
          ),
        ),
      ],
    );
  }
}

class EmptyPage extends StatefulWidget {
  const EmptyPage({super.key});

  @override
  State<EmptyPage> createState() => _EmptyPageState();
}

class _EmptyPageState extends State<EmptyPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
