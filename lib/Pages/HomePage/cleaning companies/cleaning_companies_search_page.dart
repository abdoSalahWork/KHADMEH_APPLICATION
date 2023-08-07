// ignore_for_file: must_be_immutable

import 'dart:math';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khedma/Pages/HomePage/cleaning%20companies/cleaning_company.dart';
import 'package:khedma/Utils/utils.dart';
import 'package:khedma/widgets/dropdown_menu_button.dart';
import 'package:khedma/widgets/search_text_field.dart';
import 'package:sizer/sizer.dart';

class CleaningCompaniesSearchPage extends StatefulWidget {
  const CleaningCompaniesSearchPage({super.key});

  @override
  State<CleaningCompaniesSearchPage> createState() =>
      _RecruitmentCompaniesPageSSearchtate();
}

class _RecruitmentCompaniesPageSSearchtate
    extends State<CleaningCompaniesSearchPage> {
  List<String> tags = [
    "closest",
  ];

  List<String> options = [
    "closest",
    "best",
    "cheapest",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        // surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        title: coloredText(text: "cl_com".tr, fontSize: 15.0.sp),
      ),
      body: Padding(
        padding: EdgeInsets.all(12.0.sp),
        child: Column(
          children: [
            SearchTextField(
              hintText: "Search ...",
              prefixIcon: const Icon(
                EvaIcons.search,
                color: Color(0xffAFAFAF),
              ),
            ),
            spaceY(2.0.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomDropDownMenuButton(
                  width: 40.0.w,
                  items: ["item", "item2"]
                      .map(
                        (e) => DropdownMenuItem<String>(
                          value: e,
                          child: coloredText(text: e, color: Colors.black),
                        ),
                      )
                      .toList(),
                  onChanged: (p0) {},
                  hint: "country".tr,
                  borderc: Border.all(color: const Color(0xffE3E3E3)),
                  borderRadius: BorderRadius.circular(8),
                  padding:
                      const EdgeInsetsDirectional.symmetric(horizontal: 10),
                ),
                CustomDropDownMenuButton(
                  width: 40.0.w,
                  items: ["item", "item2"]
                      .map(
                        (e) => DropdownMenuItem<String>(
                          value: e,
                          child: coloredText(text: e, color: Colors.black),
                        ),
                      )
                      .toList(),
                  onChanged: (p0) {},
                  hint: "city".tr,
                  borderc: Border.all(color: const Color(0xffE3E3E3)),
                  borderRadius: BorderRadius.circular(8),
                  padding:
                      const EdgeInsetsDirectional.symmetric(horizontal: 10),
                ),
              ],
            ),
            // ChipsChoice<String>.multiple(
            //   scrollphysics: const NeverScrollableScrollPhysics(),
            //   padding: EdgeInsets.zero,
            //   value: tags,
            //   onChanged: (val) {},
            //   choiceItems: C2Choice.listFrom<String, String>(
            //     source: options,
            //     value: (i, v) => v,
            //     label: (i, v) => v,
            //   ),
            //   // choiceStyle: C2ChipStyle.outlined(),
            //   choiceCheckmark: true,

            //   choiceBuilder: (item, i) => GestureDetector(
            //     onTap: () {
            //       if (!tags.contains(item.label)) {
            //         tags = [];
            //         tags.add(item.label);
            //       }
            //       setState(() {});
            //     },
            //     child: Container(
            //       width: 28.0.w,
            //       height: 40,
            //       margin: EdgeInsets.symmetric(horizontal: 1.0.w),
            //       decoration: BoxDecoration(
            //           color: !tags.contains(item.label)
            //               ? const Color(0xffE8E8E8).withOpacity(0)
            //               : Theme.of(context)
            //                   .colorScheme
            //                   .secondary
            //                   .withOpacity(0.06),
            //           borderRadius: BorderRadius.circular(10),
            //           border: Border.all(
            //             color: !tags.contains(item.label)
            //                 ? const Color(0xffE8E8E8)
            //                 : Theme.of(context).colorScheme.secondary,
            //           )),
            //       child: Center(
            //         child: coloredText(
            //             text: item.label.tr,
            //             color: !tags.contains(item.label)
            //                 ? const Color(0xff919191)
            //                 : Theme.of(context).colorScheme.secondary,
            //             fontSize: 12.0.sp),
            //       ),
            //     ),
            //   ),
            // ),
            spaceY(2.0.h),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.zero,
                primary: false,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    Get.to(() => const CleaningCompany(),
                        transition: Transition.rightToLeft);
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 75.0.sp,
                        height: 75.0.sp,
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xffEEEEEE)),
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(
                                "assets/images/logo${Random().nextInt(2 - 0)}.png"),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      spaceX(10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                coloredText(
                                  text: 'lorem ipsun',
                                ),
                                const Icon(
                                  EvaIcons.heart,
                                  color: Color(0xffBFBFBF),
                                )
                              ],
                            ),
                            spaceY(10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  EvaIcons.pin,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  size: 15.0.sp,
                                ),
                                spaceX(3),
                                coloredText(
                                  text: 'Philippines',
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  fontSize: 13.0.sp,
                                ),
                              ],
                            ),
                            spaceY(10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Icon(EvaIcons.star, color: Colors.yellow),
                                spaceX(5),
                                coloredText(
                                  text: "4.5",
                                  fontSize: 13.0.sp,
                                  color: Colors.black,
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                separatorBuilder: (context, index) => Column(
                  children: [
                    spaceY(1.0.h),
                    const Divider(
                      color: Color(0xffEBEBEB),
                      thickness: 1,
                    ),
                    spaceY(1.0.h),
                  ],
                ),
                itemCount: 10,
              ),
            )
          ],
        ),
      ),
    );
  }
}