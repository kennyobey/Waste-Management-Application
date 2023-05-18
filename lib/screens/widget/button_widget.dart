import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:halal_design/screens/constants/color.dart';

import 'custom_text.dart';

class CustomFillButton extends StatelessWidget {
  const CustomFillButton({
    Key? key,
    this.onTap,
    this.width,
    this.textColor,
    this.buttonColor,
    this.borderRadius,
    this.isLoading = false,
    required this.buttonText,
    this.boarderColor,
    this.height,
    this.textSize,
    this.fontWeight,
  }) : super(key: key);
  final double? width;
  final double? height;
  final double? textSize;
  final FontWeight? fontWeight;
  final Color? textColor;
  final Color? buttonColor;
  final Color? boarderColor;
  final String? buttonText;
  final VoidCallback? onTap;
  final BorderRadiusGeometry? borderRadius;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width ?? MediaQuery.of(context).size.width,
        height: height ?? 45,
        decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: borderRadius ?? BorderRadius.circular(10),
            border: Border.all(color: boarderColor ?? AppColor().primaryDark)),
        child: Center(
          child: (isLoading)
              ? const CircularProgressIndicator(
                  color: Colors.white,
                )
              : CustomText(
                  title: buttonText!,
                  size: textSize ?? 14,
                  weight: fontWeight ?? FontWeight.w500,
                  textAlign: TextAlign.center,
                  color: textColor!,
                ),
        ),
      ),
    );
  }
}
