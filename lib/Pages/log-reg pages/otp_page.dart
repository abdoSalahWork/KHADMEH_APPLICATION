import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../Utils/utils.dart';
import '../../widgets/underline_text_field.dart';
import '../HomePage/user_home_page.dart';

class OTPPage extends StatefulWidget {
  const OTPPage({super.key});

  @override
  State<OTPPage> createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  FocusNode node = FocusNode();
  @override
  void initState() {
    node.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: ZeroAppBar(color: Colors.red),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        primary: false,
        children: [
          spaceY(10.0.h),
          Align(
            child: Container(
              width: 40.0.w,
              height: 40.0.w,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/well-done.png"),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          spaceY(5.0.h),
          Align(
            child: coloredText(
              text: "otp_text_1".tr,
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
              fontSize: 16.0.sp,
            ),
          ),
          spaceY(3.0.h),
          Align(
            child: coloredText(
              text: "otp_text_2".tr,
              color: Colors.grey,
              fontWeight: FontWeight.normal,
              fontSize: 13.0.sp,
              textAlign: TextAlign.center,
            ),
          ),
          spaceY(3.0.h),
          Center(
            child: UnderlinedCustomTextField(
              // width: 90.0.w,
              focusNode: node,
              hintText: "code",
            ),
          ),
          spaceY(7.0.h),
          primaryButton(
            height: 50,
            width: 45.0.w,
            radius: 30,
            text: coloredText(
              text: "send".tr,
              color: Colors.white,
              fontSize: 16.0.sp,
            ),
            color: Theme.of(context).colorScheme.primary,
            onTap: () => Get.to(
              () => const UserHomePage(),
              transition: Transition.downToUp,
            ),
          ),
          spaceY(2.0.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              coloredText(
                text: "otp_text_3".tr,
                color: Colors.grey,
              ),
              spaceX(10),
              coloredText(
                text: "otp_text_4".tr,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ],
          )
        ],
      ),
    );
  }
}
