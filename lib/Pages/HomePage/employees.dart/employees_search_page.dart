// ignore_for_file: must_be_immutable

import 'package:chips_choice/chips_choice.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:khedma/Pages/HomePage/employees.dart/employees_filter_page.dart';
import 'package:khedma/Utils/utils.dart';
import 'package:khedma/widgets/profile_card.dart';
import 'package:khedma/widgets/search_text_field.dart';
import 'package:sizer/sizer.dart';

class EmployeesSearchPage extends StatefulWidget {
  const EmployeesSearchPage({super.key});

  @override
  State<EmployeesSearchPage> createState() => _EmployeesSearchPageState();
}

class _EmployeesSearchPageState extends State<EmployeesSearchPage> {
  List<String> tags = [];
  List<String> categories = ["Per hour", "Per year"];
  String selectedCategory = "Per hour";
  List<String> options = [
    "cleaner",
    "driver",
    "chef",
    "babysitter",
    "nurse",
    "sewing",
    "washing",
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
        title: coloredText(text: "employees".tr, fontSize: 15.0.sp),
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
              suffixIcon: GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                  Get.to(() => const EmployeesFilterPage(),
                      transition: Transition.rightToLeft);
                },
                child: const Image(
                  width: 15,
                  height: 15,
                  image: AssetImage("assets/images/filter-icon.png"),
                ),
              ),
            ),
            spaceY(2.0.h),
            // coloredText(
            //   text: "services".tr,
            //   fontSize: 13.0.sp,
            //   fontWeight: FontWeight.w500,
            // ),
            // spaceY(1.5.h),
            SizedBox(
                height: 85.sp,
                child: ChipsChoice<String>.multiple(
                  padding: EdgeInsets.zero,
                  value: tags,
                  onChanged: (val) {},
                  choiceItems: C2Choice.listFrom<String, String>(
                    source: options,
                    value: (i, v) => v,
                    label: (i, v) => v,
                    avatarImage: (index, item) =>
                        AssetImage("assets/images/$item.png"),
                  ),
                  // choiceStyle: C2ChipStyle.outlined(),
                  choiceCheckmark: true,

                  choiceBuilder: (item, i) => GestureDetector(
                    onTap: () {
                      if (tags.contains(item.label)) {
                        tags.remove(item.label);
                      } else {
                        tags.add(item.label);
                      }
                      logSuccess(tags);
                      setState(() {});
                    },
                    child: Container(
                      margin: const EdgeInsetsDirectional.only(end: 15),
                      child: Column(
                        children: [
                          Container(
                            width: 60.0.sp,
                            height: 60.0.sp,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: const Color(0xffEFEFEF),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: !tags.contains(item.label)
                                      ? Colors.red.withOpacity(0)
                                      : Theme.of(context).colorScheme.secondary,
                                )),
                            child: Center(
                              child: Image(
                                width: 35.0.sp,
                                height: 35.0.sp,
                                image: item.avatarImage!,
                              ),
                            ),
                          ),
                          spaceY(5),
                          coloredText(
                              text: item.label.tr,
                              color: Colors.black,
                              fontSize: 12.0.sp),
                        ],
                      ),
                    ),
                  ),
                )),
            spaceY(1.0.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                coloredText(
                  text: "categories".tr,
                  fontSize: 13.0.sp,
                  fontWeight: FontWeight.w500,
                ),

                Theme(
                  data: ThemeData(primaryColor: Colors.white),
                  child: PopupMenuButton(
                    itemBuilder: (BuildContext context) => [
                      PopupMenuItem<int>(
                        value: 0,
                        child: coloredText(text: categories[0]),
                        onTap: () {
                          selectedCategory = categories[0];
                          setState(() {});
                        },
                      ),
                      PopupMenuItem<int>(
                        value: 1,
                        child: coloredText(text: categories[1]),
                        onTap: () {
                          selectedCategory = categories[1];
                          setState(() {});
                        },
                      ),
                    ],
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      width: 35.0.w,
                      height: 40,
                      decoration: BoxDecoration(
                        color: const Color(0xffF8F8F8),
                        border: Border.all(
                          color: const Color(0xffE1E1E1),
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          coloredText(
                              text: selectedCategory,
                              color: Colors.black,
                              fontSize: 15),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: Icon(
                              FontAwesomeIcons.sortDown,
                              color: Colors.grey.shade700,
                              size: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
                // CustomDropDownMenuButton(
                //   width: 35.0.w,

                //   items: ["per hour", "per year"]
                //       .map(
                //         (e) => DropdownMenuItem<String>(
                //           value: e,
                //           child: coloredText(
                //               text: e, color: Colors.black, fontSize: 15),
                //         ),
                //       )
                //       .toList(),
                //   onChanged: (p0) {},
                //   borderc: Border.all(color: const Color(0xffE3E3E3)),
                //   borderRadius: BorderRadius.circular(25),
                //   padding: const EdgeInsetsDirectional.only(
                //     start: 20,
                //     end: 5,
                //   ),
                // ),
              ],
            ),
            spaceY(2.0.h),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.zero,
                primary: false,
                itemBuilder: (context, index) => ProfileCard(),
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
