import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../Utils/utils.dart';
import '../HomePage/user home/user_home_page.dart';

class InvoicePage extends StatelessWidget {
  const InvoicePage({super.key, required this.employeeType});
  final EmployeeType employeeType;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20),
          width: 100.0.w,
          height: 100.0.h,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/invoice_background.png"),
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      coloredText(
                        text: "invoice".tr,
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: 13.0.sp,
                      ),
                      Container(
                        width: 35.0.sp,
                        height: 2,
                        color: Theme.of(context).colorScheme.secondary,
                      )
                    ],
                  ),
                  spaceX(5),
                  primaryButton(
                      width: 32.0.w,
                      height: 45,
                      radius: 10,
                      color: const Color(0xffF5F5F5),
                      text: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(EvaIcons.shareOutline,
                              color: Theme.of(context).colorScheme.tertiary,
                              size: 15.0.sp),
                          spaceX(10),
                          coloredText(
                              text: "share".tr,
                              color: Theme.of(context).colorScheme.tertiary,
                              fontSize: 11.0.sp),
                        ],
                      )),
                  primaryButton(
                      width: 32.0.w,
                      height: 45,
                      radius: 10,
                      color: const Color(0xffF5F5F5),
                      text: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(EvaIcons.downloadOutline,
                              color: Theme.of(context).colorScheme.tertiary,
                              size: 15.0.sp),
                          spaceX(10),
                          coloredText(
                              text: "download".tr,
                              color: Theme.of(context).colorScheme.tertiary,
                              fontSize: 11.0.sp),
                        ],
                      )),
                ],
              ),
              spaceY(2.0.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        coloredText(
                            text: "ID:",
                            color: const Color(0xff919191),
                            fontSize: 12.0.sp),
                        coloredText(
                          text: "#IN215481",
                          fontSize: 13.0.sp,
                        )
                      ]),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        coloredText(
                            text: "Date:",
                            color: const Color(0xff919191),
                            fontSize: 12.0.sp),
                        coloredText(
                          text: "July 20, 2023",
                          fontSize: 13.0.sp,
                        )
                      ]),
                ],
              ),
              spaceY(3.0.h),
              employeeType == EmployeeType.recruitment
                  ? Container(
                      width: 100.0.w,
                      height: employeeType == EmployeeType.recruitment
                          ? 40.0.h
                          : 50.0.h,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ],
                          color: Colors.white),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                coloredText(
                                    text: "Employee name:",
                                    color: const Color(0xff919191),
                                    fontSize: 12.0.sp),
                                spaceY(6),
                                coloredText(
                                  text: "Lorem Ipsum",
                                  fontSize: 13.0.sp,
                                )
                              ]),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                coloredText(
                                    text: "Company name:",
                                    color: const Color(0xff919191),
                                    fontSize: 12.0.sp),
                                spaceY(6),
                                coloredText(
                                  text: "Lorem Ipsum",
                                  fontSize: 13.0.sp,
                                )
                              ]),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                coloredText(
                                    text: "Required period:",
                                    color: const Color(0xff919191),
                                    fontSize: 12.0.sp),
                                spaceY(6),
                                coloredText(
                                  text: "2 Years",
                                  fontSize: 13.0.sp,
                                )
                              ]),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                coloredText(
                                    text: "Payment method used:",
                                    color: const Color(0xff919191),
                                    fontSize: 12.0.sp),
                                spaceY(6),
                                coloredText(
                                  text: "Myfatoorah",
                                  fontSize: 13.0.sp,
                                )
                              ]),
                        ],
                      ),
                    )
                  : Container(
                      width: 100.0.w,
                      height: employeeType == EmployeeType.recruitment
                          ? 40.0.h
                          : 50.0.h,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ],
                          color: Colors.white),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                coloredText(
                                    text: "Employee name:",
                                    color: const Color(0xff919191),
                                    fontSize: 12.0.sp),
                                spaceY(6),
                                coloredText(
                                  text: "Lorem Ipsum",
                                  fontSize: 13.0.sp,
                                )
                              ]),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                coloredText(
                                    text: "Company name:",
                                    color: const Color(0xff919191),
                                    fontSize: 12.0.sp),
                                spaceY(6),
                                coloredText(
                                  text: "Lorem Ipsum",
                                  fontSize: 13.0.sp,
                                )
                              ]),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                coloredText(
                                    text: "Receipt method:",
                                    color: const Color(0xff919191),
                                    fontSize: 12.0.sp),
                                spaceY(6),
                                coloredText(
                                  text: "Representative from the application",
                                  fontSize: 13.0.sp,
                                )
                              ]),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                coloredText(
                                    text: "Required period:",
                                    color: const Color(0xff919191),
                                    fontSize: 12.0.sp),
                                spaceY(6),
                                coloredText(
                                  text: "2 Years",
                                  fontSize: 13.0.sp,
                                )
                              ]),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                coloredText(
                                    text: "Payment method used:",
                                    color: const Color(0xff919191),
                                    fontSize: 12.0.sp),
                                spaceY(6),
                                coloredText(
                                  text: "Myfatoorah",
                                  fontSize: 13.0.sp,
                                )
                              ]),
                        ],
                      ),
                    ),
              spaceY(2.0.h),
              employeeType == EmployeeType.recruitment
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        coloredText(
                          text: "${"price".tr} :",
                          fontSize: 13.0.sp,
                        ),
                        spaceX(10),
                        coloredText(
                            text: "30\$",
                            fontSize: 13.0.sp,
                            color: Theme.of(context).colorScheme.secondary),
                      ],
                    )
                  : Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            coloredText(
                              text: "${"price".tr} :",
                              fontSize: 13.0.sp,
                            ),
                            spaceX(10),
                            coloredText(
                              text: "30\$",
                              fontSize: 13.0.sp,
                              color: const Color(0xff919191),
                            ),
                          ],
                        ),
                        spaceY(5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            coloredText(
                              text: "${"delivery".tr} :",
                              fontSize: 13.0.sp,
                            ),
                            spaceX(10),
                            coloredText(
                              text: "30\$",
                              fontSize: 13.0.sp,
                              color: const Color(0xff919191),
                            ),
                          ],
                        ),
                        spaceY(5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            coloredText(
                              text: "${"total".tr} :",
                              fontSize: 13.0.sp,
                            ),
                            spaceX(10),
                            coloredText(
                                text: "30\$",
                                fontSize: 13.0.sp,
                                color: Theme.of(context).colorScheme.secondary),
                          ],
                        )
                      ],
                    ),
              employeeType == EmployeeType.recruitment
                  ? spaceY(10.0.h)
                  : spaceY(3.0.h),
              primaryButton(
                  onTap: () {
                    Get.offAll(() => const UserHomePage());
                  },
                  width: 80.0.w,
                  gradient: LinearGradient(colors: [
                    Theme.of(context).colorScheme.primary,
                    Theme.of(context).colorScheme.secondary,
                  ]),
                  text: coloredText(
                    text: "done".tr,
                    color: Colors.white,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
