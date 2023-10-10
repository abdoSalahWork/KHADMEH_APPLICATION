import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:khedma/Admin/models/drawer_menu_item.dart';
import 'package:khedma/Admin/pages/zoom_drawer_controller.dart';
import 'package:khedma/Utils/utils.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class MenuPage extends StatelessWidget {
  MenuPage(
      {super.key, required this.onSelectedItem, required this.currentItem});

  final ValueChanged<DrawerMenuItem> onSelectedItem;
  final DrawerMenuItem currentItem;
  Widget buildMenuItem(DrawerMenuItem item) => ListTile(
        title: coloredText(
          text: Get.locale == const Locale('en', 'US')
              ? item.titleEn
              : item.titleAr,
          color: item.titleEn == "Log out"
              ? const Color(0xffE47E7B)
              : Colors.white,
          fontSize: 12.5.sp,
          fontWeight: FontWeight.w500,
        ),
        leading: Icon(
          item.icon,
          color: item.titleEn == "Log out"
              ? const Color(0xffE47E7B)
              : const Color(0xffffffff),
        ),
        minLeadingWidth: 20,
        // selected: currentItem == item,
        onTap: () async {
          if (item.titleEn == "Log out") {
            logSuccess("msg");
            Get.back();
          } else {
            onSelectedItem(item);
          }
        },
      );
  MyZoomDrawerController myZoomDrawerController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildXButton(myZoomDrawerController),
            Expanded(
              child: Align(
                child: ListView(
                  primary: false,
                  children: [
                    ...MyAdminMenuItems.all.map(buildMenuItem).toList()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildXButton(MyZoomDrawerController myZoomDrawerController) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: InkWell(
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        onTap: myZoomDrawerController.zoomDrawerController.toggle,
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.3),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Icon(
            Icons.close_rounded,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class MyAdminMenuItems {
  // static const dashboard = DrawerMenuItem("Dashboard", Icons.abc);

  static const userProfiles = DrawerMenuItem(
      titleEn: "User Profiles",
      icon: EvaIcons.people,
      titleAr: "ملفات المستخدمين الشخصية");
  static const companyProfiles = DrawerMenuItem(
      titleEn: "Company Profiles",
      icon: FontAwesomeIcons.solidBuilding,
      titleAr: "ملفات الشركات الشخصية");
  static const categories = DrawerMenuItem(
      titleEn: "Categories", icon: EvaIcons.grid, titleAr: "الفئات");
  static const bookings = DrawerMenuItem(
      titleEn: "Bookings", icon: EvaIcons.calendarOutline, titleAr: "الحجوزات");
  static const advertisements = DrawerMenuItem(
      titleEn: "Advertisements", icon: EvaIcons.volumeUp, titleAr: "الإعلانات");
  // static const refunds = DrawerMenuItem(
  //     titleEn: "Refunds", icon: EvaIcons.refresh, titleAr: "المبالغ المستردة");
  static const acountStatment = DrawerMenuItem(
      titleEn: "Account statment",
      icon: EvaIcons.activity,
      titleAr: "كشف حساب");
  static const addresses = DrawerMenuItem(
      titleEn: "Addresses", icon: EvaIcons.pin, titleAr: "العناوين");
  static const languages = DrawerMenuItem(
      titleEn: "Languages", icon: EvaIcons.globe3, titleAr: "اللغات");
  static const contactUs = DrawerMenuItem(
      titleEn: "contact us", icon: EvaIcons.messageCircle, titleAr: "اتصل بنا");
  static const commissions = DrawerMenuItem(
      titleEn: "Commissions", icon: Icons.monetization_on, titleAr: "العمولات");
  static const about = DrawerMenuItem(
      titleEn: "About Khedma", icon: EvaIcons.info, titleAr: "حول خدمة");

  static const logOut = DrawerMenuItem(
      titleEn: "Log out", icon: EvaIcons.logOut, titleAr: "تسجيل الخروج");
  static const dropDowns = DrawerMenuItem(
      titleEn: "Dropdowns", icon: EvaIcons.arrowDownward, titleAr: "الخيارات");

  static const all = <DrawerMenuItem>[
    userProfiles,
    companyProfiles,
    categories,
    bookings,
    advertisements,
    // refunds,
    acountStatment,
    addresses,
    commissions,
    languages,
    dropDowns,
    contactUs,
    about,
    logOut,
  ];
}
