import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:khedma/Pages/HomePage/controllers/companies_controller.dart';
import 'package:sizer/sizer.dart';

import '../../Utils/utils.dart';
import '../HomePage/user home/user_home_page.dart';

class InvoicePage extends StatefulWidget {
  const InvoicePage(
      {super.key,
      required this.invoiceId,
      required this.employeeName,
      required this.companyId,
      required this.contractDuration,
      required this.contractAmount});
  final String invoiceId;
  final String employeeName;
  final int companyId;
  final String contractDuration;
  final String contractAmount;

  @override
  State<InvoicePage> createState() => _InvoicePageState();
}

class _InvoicePageState extends State<InvoicePage> {
  CompaniesController _companiesController = Get.find();

  @override
  void initState() {
    _companiesController.getRecruitmentCompanies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<CompaniesController>(builder: (c) {
        return SafeArea(
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
                    //   spaceX(5),
                    //   primaryButton(
                    //       width: 32.0.w,
                    //       height: 45,
                    //       radius: 10,
                    //       color: const Color(0xffF5F5F5),
                    //       text: Row(
                    //         mainAxisAlignment: MainAxisAlignment.center,
                    //         children: [
                    //           Icon(EvaIcons.shareOutline,
                    //               color: Theme.of(context).colorScheme.tertiary,
                    //               size: 15.0.sp),
                    //           spaceX(10),
                    //           coloredText(
                    //               text: "share".tr,
                    //               color: Theme.of(context).colorScheme.tertiary,
                    //               fontSize: 11.0.sp),
                    //         ],
                    //       )),
                    //   primaryButton(
                    //       width: 32.0.w,
                    //       height: 45,
                    //       radius: 10,
                    //       color: const Color(0xffF5F5F5),
                    //       text: Row(
                    //         mainAxisAlignment: MainAxisAlignment.center,
                    //         children: [
                    //           Icon(EvaIcons.downloadOutline,
                    //               color: Theme.of(context).colorScheme.tertiary,
                    //               size: 15.0.sp),
                    //           spaceX(10),
                    //           coloredText(
                    //               text: "download".tr,
                    //               color: Theme.of(context).colorScheme.tertiary,
                    //               fontSize: 11.0.sp),
                    //         ],
                    //       )),
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
                            text: widget.invoiceId,
                            fontSize: 13.0.sp,
                          )
                        ]),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          coloredText(
                              text: "${"date".tr}: ",
                              color: const Color(0xff919191),
                              fontSize: 12.0.sp),
                          coloredText(
                            text: DateFormat(DateFormat.YEAR_MONTH_DAY)
                                .format(DateTime.now()),
                            fontSize: 13.0.sp,
                          )
                        ]),
                  ],
                ),
                spaceY(3.0.h),
                Container(
                  width: 100.0.w,
                  height: 40.0.h,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      color: Colors.white),
                  child: c.getRecruitmentCompaniesFlag
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  coloredText(
                                      text: "${"employee_name".tr}:",
                                      color: const Color(0xff919191),
                                      fontSize: 12.0.sp),
                                  spaceY(6),
                                  coloredText(
                                    text: widget.employeeName,
                                    fontSize: 13.0.sp,
                                  )
                                ]),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  coloredText(
                                      text: "${"company_name".tr}:",
                                      color: const Color(0xff919191),
                                      fontSize: 12.0.sp),
                                  spaceY(6),
                                  coloredText(
                                    text: widget.companyId.toString(),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    coloredText(
                      text: "${"price".tr} :",
                      fontSize: 13.0.sp,
                    ),
                    spaceX(10),
                    coloredText(
                        text: "30 KWD",
                        fontSize: 13.0.sp,
                        color: Theme.of(context).colorScheme.secondary),
                  ],
                ),
                spaceY(10.0.h),
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
        );
      }),
    );
  }
}
