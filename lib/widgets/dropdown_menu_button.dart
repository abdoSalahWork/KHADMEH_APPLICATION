import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../Utils/utils.dart';

// ignore: must_be_immutable
class CustomDropDownMenuButton extends StatelessWidget {
  CustomDropDownMenuButton({
    super.key,
    required this.items,
    this.onChanged,
    this.height,
    this.width,
    this.hint,
    this.borderRadius,
    this.borderc,
    this.border,
    this.padding,
    this.hintPadding = 10,
    this.contentPadding = 0,
    this.value,
    this.fillColor,
    this.filled,
    this.prefixIcon,
    this.prefix,
    this.suffixIcon,
    this.suffix,
    this.focusNode,
    this.validator,
    this.autovalidateMode,
    this.hintSize,
  });
  final List<DropdownMenuItem<String>> items;
  final void Function(String?)? onChanged;
  bool? filled;
  Color? fillColor;
  double? width;
  double? hintSize;
  final FocusNode? focusNode;

  double? height;
  String? hint;
  double hintPadding;
  double contentPadding;
  BoxBorder? borderc;
  InputBorder? border;
  BorderRadiusGeometry? borderRadius;
  EdgeInsetsGeometry? padding;
  String? value;
  final Widget? prefixIcon;
  final Widget? prefix;
  final Widget? suffixIcon;
  final Widget? suffix;
  AutovalidateMode? autovalidateMode;
  String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
          border: borderc, borderRadius: borderRadius, color: fillColor),
      width: width ?? 80,
      height: height,
      child: DropdownButtonFormField<String>(
        validator: validator,
        autovalidateMode: autovalidateMode,
        padding: EdgeInsetsDirectional.only(start: contentPadding),
        value: value,
        dropdownColor: Colors.white,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          prefix: prefix,
          suffix: suffix,
          fillColor: fillColor,
          prefixIconColor: focusNode == null
              ? null
              : focusNode!.hasFocus
                  ? Theme.of(context).colorScheme.secondary
                  : const Color(0xffBDC1C8),
          filled: filled,
          enabledBorder: border != null
              ? const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xffBDC1C8),
                    width: 2.0,
                  ),
                )
              : null,
          focusedBorder: border != null
              ? UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.secondary,
                    width: 2.0,
                  ),
                )
              : null,
          errorBorder: border != null
              ? const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                    width: 2.0,
                  ),
                )
              : null,
          border: border ?? InputBorder.none,
        ),
        isExpanded: true,
        items: items,
        hint: Row(
          children: [
            spaceX(hintPadding),
            coloredText(
                text: hint ?? "select".tr,
                color: Colors.grey,
                fontSize: hintSize ?? 13.sp),
          ],
        ),
        onChanged: onChanged,
      ),
    );
  }
}

// ignore: must_be_immutable
class CustomDropDownMenuButtonV2 extends StatelessWidget {
  CustomDropDownMenuButtonV2({
    super.key,
    required this.items,
    this.onChanged,
    this.height,
    this.width,
    this.hint,
    this.borderRadius,
    this.borderc,
    this.border,
    this.padding,
    this.hintPadding = 10,
    this.contentPadding = 0,
    this.value,
    this.fillColor,
    this.filled,
    this.prefixIcon,
    this.prefix,
    this.suffixIcon,
    this.suffix,
    this.focusNode,
    this.validator,
    this.autovalidateMode,
    this.hintSize,
    this.style,
    this.hintText,
    this.textInputAction,
    this.keyBoardType,
    this.initialValue,
    this.controller,
    this.onchanged,
    this.onTap,
    this.maxLength,
  });
  final List<DropdownMenuItem<String>> items;
  final void Function(String?)? onChanged;
  bool? filled;
  Color? fillColor;
  double? width;
  double? hintSize;
  final FocusNode? focusNode;

  double? height;
  String? hint;
  double hintPadding;
  double contentPadding;
  BoxBorder? borderc;
  InputBorder? border;
  double? borderRadius;
  EdgeInsetsGeometry? padding;
  String? value;
  final Widget? prefixIcon;
  final Widget? prefix;
  final Widget? suffixIcon;
  final Widget? suffix;
  AutovalidateMode? autovalidateMode;
  String? Function(String?)? validator;
  final TextStyle? style;
  final String? hintText;

  final TextInputAction? textInputAction;
  final TextInputType? keyBoardType;
  final String? initialValue;
  final TextEditingController? controller;
  final Function(String? s)? onchanged;

  bool obsecureText = false;
  final void Function()? onTap;
  bool? readOnly;

  TextDirection? textDirection;
  final int? maxLength;

  InputBorder? wholeBorder;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      validator: validator,
      autovalidateMode: autovalidateMode,
      padding: EdgeInsetsDirectional.only(start: contentPadding),
      value: value,
      dropdownColor: Colors.white,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(10),
        fillColor: fillColor ?? const Color(0xffF1F1F1),
        filled: true,
        enabledBorder: wholeBorder ??
            OutlineInputBorder(
              borderRadius:
                  BorderRadius.all(Radius.circular(borderRadius ?? 20)),
              borderSide: BorderSide.none,
            ),
        focusedBorder: wholeBorder ??
            OutlineInputBorder(
              borderRadius:
                  BorderRadius.all(Radius.circular(borderRadius ?? 20)),
              borderSide: BorderSide.none,
            ),
        errorBorder: wholeBorder ??
            OutlineInputBorder(
              borderRadius:
                  BorderRadius.all(Radius.circular(borderRadius ?? 20)),
              borderSide: BorderSide.none,
            ),
        focusedErrorBorder: wholeBorder ??
            OutlineInputBorder(
              borderRadius:
                  BorderRadius.all(Radius.circular(borderRadius ?? 20)),
              borderSide: BorderSide.none,
            ),
        prefixIconColor: focusNode!.hasFocus
            ? Theme.of(context).colorScheme.secondary
            : const Color(0xffBDC1C8),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        prefix: prefix,
        suffix: suffix,
        hintText: hintText,
        hintStyle: GoogleFonts.poppins(
          fontSize: 13.0.sp,
          color: Colors.grey,
        ),
      ),
      isExpanded: true,
      items: items,
      hint: Row(
        children: [
          spaceX(hintPadding),
          coloredText(
              text: hint ?? "select".tr,
              color: Colors.grey,
              fontSize: hintSize ?? 13.sp),
        ],
      ),
      onChanged: onChanged,
    );
  }
}
