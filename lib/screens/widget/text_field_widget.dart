import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halal_design/screens/constants/color.dart';

class CustomTextField extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const CustomTextField({
    this.hint,
    this.label,
    this.pretext,
    this.sufText,
    this.maxLength,
    this.obscure,
    this.maxLines,
    this.minLines,
    this.initialValue,
    this.hintColor,
    this.icon,
    this.enabled,
    this.prefixIcon,
    this.suffixIcon,
    this.keyType,
    this.keyAction,
    this.textEditingController,
    this.onSubmited,
    this.onTap,
    this.validate,
    this.inputformater,
    this.onChanged,
    this.validatorText,
    this.onClick,
    this.AllowClickable = false,
    this.color,
    this.fillColor,
    this.borderColor,
    this.colors,
    this.enableColor,
    this.labelSize,
    this.radius,
    this.height,
  });

  final VoidCallback? onClick;
  final bool? AllowClickable;
  final bool? obscure;
  final String? hint;
  final String? label;
  final Color? color;
  final Color? colors;
  final Color? fillColor;
  final Color? hintColor;
  final Color? borderColor;
  final Color? enableColor;
  final String? pretext;
  final String? sufText;
  final String? initialValue;
  final int? maxLength;
  final int? maxLines;
  final int? minLines;
  final double? height;
  final double? labelSize, radius;
  final bool? enabled;
  final Widget? icon, prefixIcon, suffixIcon;
  final TextInputType? keyType;
  final TextEditingController? textEditingController;
  final TextInputAction? keyAction;
  final String? Function(String?)? validate;
  final ValueChanged<String>? onSubmited;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChanged;
  final String? validatorText;
  final List<TextInputFormatter>? inputformater;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      alignment: Alignment.center,
      child: TextFormField(
        inputFormatters: inputformater ?? [],
        autofocus: false,
        onChanged: onChanged,
        maxLength: maxLength,
        maxLines: maxLines ?? 1,
        minLines: minLines,
        controller: textEditingController,

        enabled: enabled,
        keyboardType: keyType,
        textInputAction: keyAction,
        validator: validate ??
            (value) {
              if (value == null || value.isEmpty) {
                return validatorText;
              // ignore: unnecessary_null_comparison
              } else if (value != null) {
                return null;
              }
              return null;
            },
        initialValue: initialValue,
        obscureText: obscure ?? false,
        decoration: InputDecoration(
          fillColor: fillColor ?? AppColor().primaryWhite,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          filled: true,
          isDense: true,
          prefixText: pretext,
          suffixText: sufText,
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: colors ?? AppColor().greyColor,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(radius ?? 10)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: enableColor ?? AppColor().greyColor, width: 1),
              borderRadius: BorderRadius.circular(radius ?? 10)),
          border: OutlineInputBorder(
              borderSide: BorderSide(
                  color: borderColor ?? AppColor().greyColor.withOpacity(0.5),
                  width: 1),
              borderRadius: BorderRadius.circular(radius ?? 10)),
          hintText: hint,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          hintStyle: GoogleFonts.nunito(
              color: hintColor ?? Colors.black54,
              fontSize: 13,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w500,
              height: 1.7),
        ),
        // validator: validate,
        onFieldSubmitted: onSubmited,
        onTap: onTap,
      ),
    );
  }
}