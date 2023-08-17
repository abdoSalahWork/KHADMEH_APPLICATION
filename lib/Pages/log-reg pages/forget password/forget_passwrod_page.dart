import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:khedma/Utils/utils.dart';
import 'package:khedma/widgets/underline_text_field.dart';
import 'package:sizer/sizer.dart';

class ForgetPasswordPage extends StatefulWidget {
  ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  final formKey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  bool phoneEmailFlag = false;
  String mobileCode = "+971";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        title: coloredText(text: "reset_password".tr, fontSize: 15.0.sp),
      ),
      body: ListView(
        primary: false,
        padding: EdgeInsets.all(20),
        children: [
          coloredText(
              text: phoneEmailFlag
                  ? "write_your_ph_num".tr
                  : "write_your_email".tr,
              fontSize: 14.sp),
          Form(
            key: formKey,
            child: phoneEmailFlag
                ? Directionality(
                    textDirection: TextDirection.ltr,
                    child: IntlPhoneField(
                      flagsButtonPadding: EdgeInsets.symmetric(horizontal: 20),
                      dropdownIconPosition: IconPosition.trailing,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        fillColor: Color(0xffF8F8F8),
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide.none),
                      ),
                      initialCountryCode: 'AE',
                      onChanged: (phone) {},
                      onCountryChanged: (value) =>
                          mobileCode = "+${value.dialCode}",
                      controller: phoneController,
                      validator: (p0) {
                        if (p0!.number.isEmpty) {
                          return "can't be empty";
                        }
                        return null;
                      },
                    ),
                  )
                : UnderlinedCustomTextField(
                    focusNode: FocusNode(),
                    padding: EdgeInsets.all(0),
                    keyBoardType: TextInputType.emailAddress,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: emailController,
                    textDirection: TextDirection.ltr,
                    validator: (s) {
                      if (!EmailValidator.validate(s!)) {
                        return "please_enter_a_valid_email".tr;
                      } else if (s.isEmpty) {
                        return "can't be empty";
                      } else {
                        return null;
                      }
                    },
                  ),
          ),
          spaceY(20),
          primaryButton(
            text: coloredText(
                text: "next".tr, color: Colors.white, fontSize: 13.sp),
            width: 75.w,
            color: Theme.of(context).colorScheme.primary,
          ),
          spaceY(20),
          Align(
            child: GestureDetector(
              onTap: () {
                phoneEmailFlag = !phoneEmailFlag;
                setState(() {});
              },
              child: Container(
                decoration: const BoxDecoration(
                    border: Border(
                  bottom: BorderSide(
                    width: 2,
                    color: Color.fromARGB(255, 47, 130, 75),
                  ),
                )),
                child: coloredText(
                    text: phoneEmailFlag ? "try_email".tr : "try_ph_num".tr,
                    fontSize: 14.sp,
                    color: Theme.of(context).colorScheme.secondary),
              ),
            ),
          )
        ],
      ),
    );
  }
}
