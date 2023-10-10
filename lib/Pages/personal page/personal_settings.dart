// ignore_for_file: must_be_immutable

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khedma/Pages/log-reg%20pages/login_page.dart';
import 'package:khedma/Pages/personal%20page/about_page.dart';
import 'package:khedma/Pages/personal%20page/company_profile_edit.dart';
import 'package:khedma/Pages/personal%20page/contact_us_page.dart';
import 'package:sizer/sizer.dart';

import './languages.dart';
import './password_change.dart';
import './profile_edit.dart';
import '../../Utils/utils.dart';

class PersonalSettings extends StatefulWidget {
  const PersonalSettings({super.key, required this.userType});
  final String userType;
  @override
  State<PersonalSettings> createState() => _PersonalSettingsState();
}

class _PersonalSettingsState extends State<PersonalSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        // surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        title: coloredText(text: "settings".tr, fontSize: 15.0.sp),
      ),
      body: Padding(
        padding: EdgeInsets.all(12.0.sp),
        child: Column(
          children: [
            spaceY(20),
            primaryBorderedButton(
              onTap: () {
                if (widget.userType == "company") {
                  Get.to(() => const CompanyProfileEditPage(),
                      transition: Transition.rightToLeft);
                } else {
                  Get.to(() => ProfileEditPage(userType: widget.userType),
                      transition: Transition.rightToLeft);
                }
              },
              width: 100.w,
              text: Row(
                children: [
                  spaceX(10),
                  Icon(
                    EvaIcons.personOutline,
                    size: 18.0.sp,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  spaceX(10),
                  coloredText(
                    color: const Color(0xff919191),
                    text: "edit_profile".tr,
                  ),
                ],
              ),
              color: const Color(0xffE9E9E9),
            ),
            spaceY(20),
            primaryBorderedButton(
              onTap: () {
                Get.to(() => LanguagesPage(),
                    transition: Transition.rightToLeft);
              },
              width: 100.w,
              text: Row(
                children: [
                  spaceX(10),
                  Icon(
                    Icons.g_translate_outlined,
                    size: 18.0.sp,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  spaceX(10),
                  coloredText(
                    color: const Color(0xff919191),
                    text: "language".tr,
                  ),
                ],
              ),
              color: const Color(0xffE9E9E9),
            ),
            spaceY(20),
            primaryBorderedButton(
              onTap: () {
                Get.to(() => const PasswordChangePage(),
                    transition: Transition.rightToLeft);
              },
              width: 100.w,
              text: Row(
                children: [
                  spaceX(10),
                  Icon(
                    Icons.lock_outline,
                    size: 18.0.sp,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  spaceX(10),
                  coloredText(
                    color: const Color(0xff919191),
                    text: "change_password".tr,
                  ),
                ],
              ),
              color: const Color(0xffE9E9E9),
            ),
            spaceY(20),
            primaryBorderedButton(
              onTap: () {
                Get.to(() => ContactUsPage());
              },
              width: 100.w,
              text: Row(
                children: [
                  spaceX(10),
                  Icon(
                    EvaIcons.messageCircleOutline,
                    size: 18.0.sp,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  spaceX(10),
                  coloredText(
                    color: const Color(0xff919191),
                    text: "contact".tr,
                  ),
                ],
              ),
              color: const Color(0xffE9E9E9),
            ),
            spaceY(20),
            primaryBorderedButton(
              onTap: () {
                Get.to(() => AboutPage());
              },
              width: 100.w,
              text: Row(
                children: [
                  spaceX(10),
                  Icon(
                    Icons.info_outline,
                    size: 18.0.sp,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  spaceX(10),
                  coloredText(
                    color: const Color(0xff919191),
                    text: "about_app".tr,
                  ),
                ],
              ),
              color: const Color(0xffE9E9E9),
            ),
            spaceY(20),
            primaryBorderedButton(
              onTap: () async {
                await Utils.deleteToken();
                await Utils.deleteRemmemberMe();
                await Utils.deleteFBToken();
                Get.offAll(() => const LoginPage());
              },
              width: 100.w,
              text: Row(
                children: [
                  spaceX(10),
                  Icon(
                    EvaIcons.logOut,
                    size: 18.0.sp,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  spaceX(10),
                  coloredText(
                    color: const Color(0xff919191),
                    text: "logout".tr,
                  ),
                ],
              ),
              color: const Color(0xffE9E9E9),
            ),
          ],
        ),
      ),
    );
  }
}
