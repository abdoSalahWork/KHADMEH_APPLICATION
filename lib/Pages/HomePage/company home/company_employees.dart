// ignore_for_file: must_be_immutable

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khedma/Pages/HomePage/company%20home/company_employees_filter.dart';
import 'package:khedma/Pages/HomePage/company%20home/emloyee_details.dart';
import 'package:khedma/Utils/utils.dart';
import 'package:khedma/widgets/company_employee_card.dart';
import 'package:khedma/widgets/search_text_field.dart';
import 'package:sizer/sizer.dart';

class CompanyEmployeesSearchPage extends StatefulWidget {
  const CompanyEmployeesSearchPage({super.key});

  @override
  State<CompanyEmployeesSearchPage> createState() =>
      _CompanyEmployeesSearchPageState();
}

class _CompanyEmployeesSearchPageState
    extends State<CompanyEmployeesSearchPage> {
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
              hintText: "${"search".tr} ...",
              prefixIcon: const Icon(
                EvaIcons.search,
                color: Color(0xffAFAFAF),
              ),
              suffixIcon: GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                  Get.to(() => CompanyEmployeesFilterPage());
                },
                child: const Image(
                  width: 15,
                  height: 15,
                  image: AssetImage("assets/images/filter-icon.png"),
                ),
              ),
            ),
            spaceY(2.0.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(
                  EvaIcons.personAddOutline,
                ),
                spaceX(10),
                coloredText(
                  text: "Add new",
                  fontSize: 13.0.sp,
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
            spaceY(2.0.h),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.zero,
                primary: false,
                itemBuilder: (context, index) => CompanyEmployeeCard(
                  onTap: () => Get.to(() => EmployeeDetailsPage()),
                  booked: index % 2 == 0,
                  trailing: Theme(
                    data: ThemeData(primaryColor: Colors.white),
                    child: PopupMenuButton(
                      constraints: BoxConstraints(
                        minWidth: 2.0 * 56.0,
                        maxWidth: MediaQuery.of(context).size.width,
                      ),
                      itemBuilder: (BuildContext context) => [
                        PopupMenuItem<int>(
                          value: 0,
                          child: coloredText(
                              text: 'More details', fontSize: 11.0.sp),
                          onTap: () {},
                        ),
                        PopupMenuItem<int>(
                          value: 1,
                          child: coloredText(text: 'Edit', fontSize: 11.0.sp),
                          onTap: () {},
                        ),
                        PopupMenuItem<int>(
                          value: 2,
                          child: coloredText(text: 'Delete', fontSize: 12.0.sp),
                          onTap: () {},
                        ),
                      ],
                      child: const Icon(
                        EvaIcons.moreVertical,
                      ),
                    ),
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
