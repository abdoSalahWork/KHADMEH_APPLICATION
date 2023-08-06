import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart' as intl;
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class UnderlinedCustomTextField extends StatelessWidget {
  UnderlinedCustomTextField({
    super.key,
    this.hintText,
    this.prefixIcon,
    this.keyBoardType,
    this.obsecureText = false,
    this.readOnly = false,
    this.prefix,
    this.validator,
    this.onchanged,
    this.initialValue,
    this.controller,
    this.inputFormatters,
    this.padding = const EdgeInsets.only(left: 15, right: 15, top: 5),
    this.suffixIcon,
    this.textDirection,
    this.suffix,
    this.fillColor,
    this.textInputAction,
    this.autovalidateMode,
    this.width,
    this.height,
    this.focusNode,
    this.style,
    this.onTap,
    this.maxLength,
  });
  final TextStyle? style;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? prefix;
  final Widget? suffixIcon;
  final Widget? suffix;
  final double? width;
  final double? height;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final TextInputType? keyBoardType;
  final String? Function(String? s)? validator;
  final String? initialValue;
  final TextEditingController? controller;
  final Function(String? s)? onchanged;
  List<TextInputFormatter>? inputFormatters;
  final Color? fillColor;
  bool obsecureText = false;
  final void Function()? onTap;
  bool readOnly = false;
  AutovalidateMode? autovalidateMode;
  EdgeInsetsGeometry? padding =
      const EdgeInsets.only(left: 15, right: 15, top: 5);
  TextDirection? textDirection;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Theme(
        data: ThemeData(
          primaryColor: Colors.white,
        ),
        child: TextFormField(
          maxLength: maxLength,
          textDirection: textDirection,
          autovalidateMode: autovalidateMode,
          onChanged: onchanged,
          initialValue: initialValue,
          obscureText: obsecureText,
          textInputAction: textInputAction,
          focusNode: focusNode,

          controller: controller,
          // cursorHeight: 3.0.sp,
          keyboardType: keyBoardType,
          inputFormatters: inputFormatters,
          style: style ?? GoogleFonts.poppins(fontSize: 15.0.sp),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(10),
            iconColor: Colors.red,
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xffBDC1C8),
                width: 2.0,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: focusNode!.hasFocus
                    ? Theme.of(context).colorScheme.secondary
                    : const Color(0xffBDC1C8),
                width: 2.0,
              ),
            ),
            errorBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.red,
                width: 2.0,
              ),
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

          validator: validator,
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class SendMessageTextField extends StatelessWidget {
  SendMessageTextField({
    super.key,
    this.hintText,
    this.prefixIcon,
    this.keyBoardType,
    this.obsecureText = false,
    this.readOnly = false,
    this.prefix,
    this.validator,
    this.onchanged,
    this.initialValue,
    this.controller,
    this.inputFormatters,
    this.padding = const EdgeInsets.only(left: 15, right: 15, top: 5),
    this.suffixIcon,
    this.textDirection,
    this.suffix,
    this.fillColor,
    this.textInputAction,
    this.autovalidateMode,
    this.width,
    this.height,
    this.focusNode,
    this.style,
    this.onTap,
    this.maxLength,
  });
  final TextStyle? style;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? prefix;
  final Widget? suffixIcon;
  final Widget? suffix;
  final double? width;
  final double? height;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final TextInputType? keyBoardType;
  final String? Function(String? s)? validator;
  final String? initialValue;
  final TextEditingController? controller;
  final Function(String? s)? onchanged;
  List<TextInputFormatter>? inputFormatters;
  final Color? fillColor;
  bool obsecureText = false;
  final void Function()? onTap;
  bool readOnly = false;
  AutovalidateMode? autovalidateMode;
  EdgeInsetsGeometry? padding =
      const EdgeInsets.only(left: 15, right: 15, top: 5);
  TextDirection? textDirection;
  final int? maxLength;
  bool isRTL(String text) {
    return intl.Bidi.detectRtlDirectionality(text);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Theme(
        data: ThemeData(
          primaryColor: Colors.white,
        ),
        child: TextFormField(
          maxLength: maxLength,
          textDirection: textDirection ??
              (isRTL(controller!.text) ? TextDirection.rtl : TextDirection.ltr),
          autovalidateMode: autovalidateMode,
          onChanged: onchanged,
          initialValue: initialValue,
          obscureText: obsecureText,
          textInputAction: textInputAction,
          focusNode: focusNode,

          controller: controller,
          // cursorHeight: 3.0.sp,
          keyboardType: keyBoardType,
          inputFormatters: inputFormatters,
          style: style ?? GoogleFonts.poppins(fontSize: 15.0.sp),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(10),
            fillColor: const Color(0xffF1F1F1),
            filled: true,
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide.none,
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide.none,
            ),
            errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
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

          validator: validator,
        ),
      ),
    );
  }
}
