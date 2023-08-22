import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
        // padding: EdgeInsetsDirectional.only(start: hintPadding),
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
