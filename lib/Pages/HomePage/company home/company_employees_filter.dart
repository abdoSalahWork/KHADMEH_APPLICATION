import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:khedma/Pages/global_controller.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../../Utils/utils.dart';
import '../../../widgets/dropdown_menu_button.dart';
import '../../../widgets/radio_button.dart';

class CompanyEmployeesFilterPage extends StatefulWidget {
  const CompanyEmployeesFilterPage({super.key});

  @override
  State<CompanyEmployeesFilterPage> createState() =>
      _CompanyEmployeesFilterPageState();
}

class _CompanyEmployeesFilterPageState
    extends State<CompanyEmployeesFilterPage> {
  SfRangeValues values = const SfRangeValues(20, 60);

  TextEditingController maxController = TextEditingController();

  TextEditingController minController = TextEditingController();
  int genderGroupValue = 0;
  String nationality = "";
  String status = "";
  List<String> jobs = [
    "cleaner",
    "driver",
    "chef",
    "babysitter",
    "nurse",
    "sewing",
    "washing",
  ];
  List<String> selectedJobs = [];
  @override
  void initState() {
    maxController.text = values.end.toString();
    minController.text = values.start.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: coloredText(
          text: "employee_filter_page".tr,
          fontSize: 14.0.sp,
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
        scrolledUnderElevation: 0,
        iconTheme:
            IconThemeData(color: Theme.of(context).colorScheme.onBackground),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        primary: false,
        children: [
          coloredText(fontSize: 14.0.sp, text: "Job name"),
          spaceY(5),
          Theme(
            data: Theme.of(context).copyWith(
              dialogTheme: DialogTheme(
                backgroundColor: Colors.white,
                surfaceTintColor: Colors.white,
                elevation: 5,
                shadowColor: Colors.grey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: const BorderSide(color: Colors.grey, width: 0.5),
                ),
              ),
            ),
            child: MultiSelectDialogField(
                buttonText: coloredText(
                    text: "choose".tr, color: Colors.grey, fontSize: 15),
                items: jobs.map((e) => MultiSelectItem(e, e)).toList(),
                listType: MultiSelectListType.CHIP,
                // selectedColor: Theme.of(context).colorScheme.secondary,
                // backgroundColor: Colors.white,
                selectedItemsTextStyle: coloredText(
                        text: "text",
                        color: Theme.of(context).colorScheme.secondary)
                    .style,
                selectedColor:
                    Theme.of(context).colorScheme.secondary.withOpacity(0.05),
                buttonIcon: Icon(
                  FontAwesomeIcons.sortDown,
                  color: Colors.grey.shade700,
                  size: 15,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xffE3E3E3),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                chipDisplay: MultiSelectChipDisplay<String>.none(),
                //  MultiSelectChipDisplay<String>(
                //   chipColor:
                //       Theme.of(context).colorScheme.secondary.withOpacity(0.05),
                //   shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(20),
                //   ),
                //   onTap: (p0) {
                //     selectedJobs.remove(p0);
                //     setState(() {});
                //   },
                //   textStyle: coloredText(
                //           text: "text",
                //           color: Theme.of(context).colorScheme.secondary)
                //       .style,
                // ),

                onConfirm: (values) {
                  selectedJobs = values;
                  setState(() {});
                }),
          ),
          spaceY(5.sp),
          selectedJobs.isEmpty
              ? Container()
              : SizedBox(
                  height: 28.sp,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              selectedJobs.removeAt(index);
                              setState(() {});
                            },
                            child: Container(
                              child: Center(
                                  child: coloredText(
                                      text: selectedJobs[index],
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary)),
                              padding: EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary),
                                borderRadius: BorderRadius.circular(20),
                                color: Theme.of(context)
                                    .colorScheme
                                    .secondary
                                    .withOpacity(0.05),
                              ),
                            ),
                          ),
                      separatorBuilder: (context, index) => spaceX(10.sp),
                      itemCount: selectedJobs.length),
                ),
          spaceY(10.sp),
          coloredText(fontSize: 14.0.sp, text: "nationality".tr),
          spaceY(5.sp),
          GetBuilder<GlobalController>(builder: (c) {
            return CustomDropDownMenuButton(
              value: nationality == "" ? null : nationality,
              items: c.countries
                  .map(
                    (e) => DropdownMenuItem<String>(
                      value: e.nameEn,
                      child: coloredText(text: e.nameEn!, color: Colors.black),
                    ),
                  )
                  .toList(),
              onChanged: (p0) {
                nationality = p0!;
                setState(() {});
              },
              borderc: Border.all(color: const Color(0xffE3E3E3)),
              borderRadius: BorderRadius.circular(8),
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 10),
            );
          }),
          spaceY(10.sp),
          coloredText(fontSize: 14.0.sp, text: "Status".tr),
          spaceY(5.sp),
          GetBuilder<GlobalController>(builder: (c) {
            return CustomDropDownMenuButton(
              value: status == "" ? null : status,
              items: c.countries
                  .map(
                    (e) => DropdownMenuItem<String>(
                      value: e.nameEn,
                      child: coloredText(text: e.nameEn!, color: Colors.black),
                    ),
                  )
                  .toList(),
              onChanged: (p0) {
                status = p0!;
                setState(() {});
              },
              borderc: Border.all(color: const Color(0xffE3E3E3)),
              borderRadius: BorderRadius.circular(8),
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 10),
            );
          }),
          spaceY(10.sp),
          coloredText(fontSize: 14.0.sp, text: "gender".tr),
          Row(
            children: [
              MyRadioButton(
                text: "male".tr,
                value: 0,
                color: Theme.of(Get.context!).colorScheme.secondary,
                groupValue: genderGroupValue,
                onChanged: (p0) {
                  genderGroupValue = p0;
                  setState(() {});
                },
              ),
              spaceX(10),
              MyRadioButton(
                color: Theme.of(Get.context!).colorScheme.secondary,
                text: "female".tr,
                value: 1,
                groupValue: genderGroupValue,
                onChanged: (p0) {
                  genderGroupValue = p0;
                  setState(() {});
                },
              ),
            ],
          ),
          spaceY(20.sp),
          primaryButton(
              height: 50,
              width: 50.0.w,
              gradient: LinearGradient(
                begin: AlignmentDirectional.centerStart,
                end: AlignmentDirectional.centerEnd,
                colors: [
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.secondary,
                ],
              ),
              text: coloredText(
                text: "apply".tr,
                color: Colors.white,
                fontSize: 15.0.sp,
              ),
              radius: 15)
        ],
      ),
    );
  }
}
