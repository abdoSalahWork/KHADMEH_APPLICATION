import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../Utils/utils.dart';
import '../../widgets/dropdown_menu_button.dart';
import '../../widgets/underline_text_field.dart';

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({super.key, required this.userType});
  final String userType;
  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  final TextEditingController _phoneNumberController =
      TextEditingController(text: "933 564 291");
  final TextEditingController _nationallityController =
      TextEditingController(text: "Syrian");
  final TextEditingController _jobNameController =
      TextEditingController(text: "Engineer");
  final TextEditingController _pieceNumberController =
      TextEditingController(text: "Piece number");
  final TextEditingController _streetController =
      TextEditingController(text: "street ");
  final TextEditingController _buildingController =
      TextEditingController(text: "building");
  final TextEditingController _adnController =
      TextEditingController(text: "Automated address number");

  final List<FocusNode> _focusNodes = [
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
  ];
  @override
  void initState() {
    for (var node in _focusNodes) {
      node.addListener(() {
        setState(() {});
      });
    }
    super.initState();
  }

  final key = GlobalKey<FormState>();
  bool valid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        // surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        title: coloredText(text: "Edit Profile", fontSize: 15.0.sp),
      ),
      body: Form(
        key: key,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          primary: false,
          children: [
            spaceY(10.0.sp),
            UnderlinedCustomTextField(
              focusNode: _focusNodes[0],
              controller: _phoneNumberController,
              keyBoardType: TextInputType.number,
              prefixIcon: Container(
                margin: const EdgeInsetsDirectional.only(start: 10),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      EvaIcons.phoneOutline,
                      size: 15.0.sp,
                    ),
                    CustomDropDownMenuButton(
                      value: "+963",
                      width: 100,
                      hintPadding: 13,
                      items: [
                        "+963",
                        "+954",
                        "+94",
                      ]
                          .map((e) => DropdownMenuItem<String>(
                                value: e,
                                child: coloredText(
                                  text: e,
                                  fontSize: 17,
                                ),
                              ))
                          .toList(),
                      onChanged: (p0) {},
                    ),
                  ],
                ),
              ),
              //
            ),
            spaceY(15.0.sp),
            UnderlinedCustomTextField(
              focusNode: _focusNodes[1],
              keyBoardType: TextInputType.text,
              controller: _nationallityController,
              readOnly: true,
              prefixIcon: Icon(
                EvaIcons.globe2Outline,
                size: 15.0.sp,
              ),
            ),
            spaceY(15.0.sp),
            UnderlinedCustomTextField(
              focusNode: _focusNodes[2],
              controller: _jobNameController,
              keyBoardType: TextInputType.text,
              prefixIcon: Icon(
                EvaIcons.briefcaseOutline,
                size: 15.0.sp,
              ),
            ),
            spaceY(15.0.sp),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomDropDownMenuButton(
                  hint: "city".tr,
                  border: const UnderlineInputBorder(),
                  width: 40.0.w,
                  value: "syria",
                  items: [
                    "syria",
                    "iraq",
                    "Egybt",
                  ]
                      .map((e) => DropdownMenuItem<String>(
                            value: e,
                            child: coloredText(
                              text: e,
                              fontSize: 17,
                            ),
                          ))
                      .toList(),
                  onChanged: (p0) {},
                ),
                CustomDropDownMenuButton(
                  hint: "region".tr,
                  border: const UnderlineInputBorder(),
                  width: 40.0.w,
                  value: "syria",
                  items: [
                    "syria",
                    "iraq",
                    "Egybt",
                  ]
                      .map((e) => DropdownMenuItem<String>(
                            value: e,
                            child: coloredText(
                              text: e,
                              fontSize: 17,
                            ),
                          ))
                      .toList(),
                  onChanged: (p0) {},
                ),
              ],
            ),
            spaceY(15.0.sp),
            UnderlinedCustomTextField(
              focusNode: _focusNodes[3],
              controller: _pieceNumberController,
              keyBoardType: TextInputType.number,
            ),
            spaceY(15.0.sp),
            UnderlinedCustomTextField(
              focusNode: _focusNodes[4],
              controller: _streetController,
              keyBoardType: TextInputType.text,
            ),
            spaceY(15.0.sp),
            UnderlinedCustomTextField(
              focusNode: _focusNodes[5],
              controller: _buildingController,
              keyBoardType: TextInputType.text,
            ),
            spaceY(15.0.sp),
            UnderlinedCustomTextField(
              focusNode: _focusNodes[6],
              controller: _adnController,
              keyBoardType: TextInputType.number,
            ),
            spaceY(40.0.sp),
            primaryButton(
                text: coloredText(text: "apply".tr, color: Colors.white),
                gradient: LinearGradient(
                  begin: AlignmentDirectional.centerStart,
                  end: AlignmentDirectional.centerEnd,
                  colors: [
                    Theme.of(context).colorScheme.primary,
                    Theme.of(context).colorScheme.secondary,
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
