import 'dart:math';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:khedma/widgets/underline_text_field.dart';
import 'package:sizer/sizer.dart';

import '../../../Utils/utils.dart';

// ignore: must_be_immutable
class AdminCreateCategory extends StatefulWidget {
  const AdminCreateCategory({super.key});

  @override
  State<AdminCreateCategory> createState() => _AdminCreateCategoryState();
}

class _AdminCreateCategoryState extends State<AdminCreateCategory> {
  String button1Text = "upload_category_icon".tr;

  String? selectedValue;
  List<FocusNode> _focusNodes = [
    FocusNode(),
    FocusNode(),
  ];
  @override
  void initState() {
    for (var i in _focusNodes) {
      i.addListener(() {
        setState(() {});
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        title: coloredText(text: "crete_category".tr, fontSize: 15.0.sp),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          primary: false,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            coloredText(text: "name_ar".tr),
            spaceY(5.sp),
            SendMessageTextField(
              focusNode: _focusNodes[0],
              borderRadius: 10,
            ),
            spaceY(10.sp),
            coloredText(text: "name_ar".tr),
            spaceY(5.sp),
            SendMessageTextField(
              focusNode: _focusNodes[0],
              borderRadius: 10,
            ),
            spaceY(20.sp),
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: GestureDetector(
                onTap: () async {
                  final result = await FilePicker.platform.pickFiles(
                    allowMultiple: false,
                    type: FileType.image,
                  );
                  if (result != null) {
                    button1Text = result.files[0].name
                        .substring(0, min(15, result.files[0].name.length));
                    setState(() {});
                  }
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35),
                    color: Theme.of(context)
                        .colorScheme
                        .secondary
                        .withOpacity(0.13),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        FontAwesomeIcons.upload,
                        color: Theme.of(context).colorScheme.secondary,
                        size: 13.0.sp,
                      ),
                      spaceX(10.0.sp),
                      coloredText(
                          text: button1Text,
                          color: Theme.of(context).colorScheme.secondary,
                          fontSize: 13.0.sp)
                    ],
                  ),
                ),
              ),
            ),
            spaceY(10.0.h),
            primaryButton(
                onTap: () {},
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
