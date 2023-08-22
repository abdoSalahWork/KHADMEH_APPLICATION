import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../Utils/utils.dart';
import 'pay_page.dart';

// ignore: must_be_immutable
class FillingDataPage extends StatefulWidget {
  const FillingDataPage({super.key});

  @override
  State<FillingDataPage> createState() => _FillingDataPageState();
}

class _FillingDataPageState extends State<FillingDataPage> {
  final List<String> items = [
    'Hours',
    'Days',
    'Years',
  ];

  List<String> tags = [
    "Company Headquarters",
  ];

  List<String> options = [
    "Company Headquarters",
    "Representative from the company",
    "Representative from the application",
  ];

  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        title: coloredText(text: "filling_data".tr, fontSize: 15.0.sp),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          primary: false,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            coloredText(
              text: "Determind hours required:",
            ),
            spaceY(10),
            Row(
              children: [
                SizedBox(
                    width: 25.0.w,
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      initialValue: "2",
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                            color: Color(0xffE3E3E3),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                            color: Color(0xffE3E3E3),
                          ),
                        ),
                        isDense: true,
                        contentPadding:
                            const EdgeInsets.fromLTRB(20, 20, 20, 0),
                      ),
                    )),
                spaceX(15),
                coloredText(text: "Hours", fontSize: 15.0.sp)
                // SizedBox(
                //   width: 35.0.w,
                //   child: DropdownButtonFormField2<String>(
                //     value: items[0],
                //     isExpanded: true,
                //     decoration: InputDecoration(
                //       isDense: true,
                //       // Add Horizontal padding using menuItemStyleData.padding so it matches
                //       // the menu padding when button's width is not specified.
                //       contentPadding: const EdgeInsets.fromLTRB(5, 20, 5, 0),

                //       focusedBorder: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(8),
                //         borderSide: const BorderSide(
                //           color: Color(0xffE3E3E3),
                //         ),
                //       ),
                //       enabledBorder: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(8),
                //         borderSide: const BorderSide(
                //           color: Color(0xffE3E3E3),
                //         ),
                //       ),
                //       // Add more decoration..
                //     ),
                //     items: items
                //         .map((item) => DropdownMenuItem<String>(
                //               value: item,
                //               child: coloredText(text: item, fontSize: 15),
                //             ))
                //         .toList(),
                //     onChanged: (value) {
                //       //Do something when selected item is changed.
                //     },
                //     buttonStyleData: const ButtonStyleData(
                //       padding: EdgeInsets.only(right: 8),
                //     ),
                //     iconStyleData: const IconStyleData(
                //       icon: Icon(
                //         Icons.arrow_drop_down,
                //         color: Colors.black45,
                //       ),
                //       iconSize: 24,
                //     ),
                //     dropdownStyleData: DropdownStyleData(
                //       decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(15),
                //       ),
                //     ),
                //     menuItemStyleData: const MenuItemStyleData(
                //       padding: EdgeInsets.symmetric(horizontal: 16),
                //     ),
                //   ),
                // ),
              ],
            ),
            spaceY(15),
            coloredText(
              text: "Determine receipt method:",
            ),
            ChipsChoice<String>.multiple(
              padding: EdgeInsets.zero,
              value: tags,
              onChanged: (val) {}, direction: Axis.vertical,
              choiceItems: C2Choice.listFrom<String, String>(
                source: options,
                value: (i, v) => v,
                label: (i, v) => v,
              ),
              // choiceStyle: C2ChipStyle.outlined(),
              choiceCheckmark: true,

              choiceBuilder: (item, i) => GestureDetector(
                onTap: () {
                  if (!tags.contains(item.label)) {
                    tags = [];
                    tags.add(item.label);
                  }

                  setState(() {});
                },
                child: Container(
                  width: 100.0.w,
                  height: 50,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: !tags.contains(item.label)
                            ? const Color(0xff919191)
                            : Theme.of(context).colorScheme.secondary,
                      )),
                  child: Center(
                    child: coloredText(
                        text: item.label.tr,
                        color: !tags.contains(item.label)
                            ? const Color(0xff919191)
                            : Theme.of(context).colorScheme.secondary,
                        fontSize: 12.0.sp),
                  ),
                ),
              ),
            ),
            spaceY(15),
            coloredText(
              text: "Type the details:",
            ),
            spaceY(10),
            TextField(
              maxLines: 3,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: Color(0xffE3E3E3),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: Color(0xffE3E3E3),
                  ),
                ),
              ),
            ),
            spaceY(15),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                coloredText(
                  text: "${"total".tr} :",
                  fontSize: 13.0.sp,
                ),
                spaceX(10),
                primaryButton(
                  color:
                      Theme.of(context).colorScheme.secondary.withOpacity(0.1),
                  width: 30.0.w,
                  height: 45,
                  radius: 8,
                  text: coloredText(
                      text: "30\$",
                      fontSize: 13.0.sp,
                      color: Theme.of(context).colorScheme.secondary),
                ),
              ],
            ),
            spaceY(10.0.h),
            primaryButton(
                onTap: () {
                  Get.to(() => const PayPage(employeeType: EmployeeType.clean));
                },
                width: 80.0.w,
                gradient: LinearGradient(colors: [
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.secondary,
                ]),
                text: coloredText(
                  text: "apply".tr,
                  color: Colors.white,
                ))
          ],
        ),
      ),
    );
  }
}
