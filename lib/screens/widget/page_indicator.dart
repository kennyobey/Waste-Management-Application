import 'package:flutter/material.dart';
import 'package:halal_design/screens/constants/color.dart';

class PageIndicator extends StatelessWidget {
  const PageIndicator(this.pageCount, this.index, this.height, {Key? key})
      : super(key: key);

  final int pageCount;
  final int index;
  final double height;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      width: pageCount == index ? 16 : 4,
      height: 3,
      decoration: BoxDecoration(
        color: pageCount == index
            ? AppColor().primaryColorPurple
            : AppColor().primaryColorPurple,
        borderRadius: BorderRadius.circular(
          6,
        ),
      ),
    );
  }
}
