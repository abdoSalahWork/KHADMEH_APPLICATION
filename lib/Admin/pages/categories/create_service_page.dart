import 'dart:math';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:khedma/Admin/pages/categories/controller/categories_controller.dart';
import 'package:khedma/Admin/pages/categories/models/categories_model.dart';
import 'package:khedma/widgets/underline_text_field.dart';
import 'package:sizer/sizer.dart';

import '../../../Utils/utils.dart';

// ignore: must_be_immutable
class AdminCreateService extends StatefulWidget {
  const AdminCreateService({super.key, this.categoryToEdit});
  final CategoryModel? categoryToEdit;
  @override
  State<AdminCreateService> createState() => _AdminCreateServiceState();
}

class _AdminCreateServiceState extends State<AdminCreateService> {
  String button1Text = "upload_service_icon".tr;
  CategoryModel categoryToCreate = CategoryModel();
  CategoriesController _categoriesController = Get.find();
  String? selectedValue;
  List<FocusNode> _focusNodes = [
    FocusNode(),
    FocusNode(),
  ];
  @override
  void initState() {
    if (widget.categoryToEdit != null) {
      button1Text = widget.categoryToEdit!.image.toString().substring(
          widget.categoryToEdit!.image.toString().lastIndexOf("/") + 1);
    }
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
        title: coloredText(
            text:
                widget.categoryToEdit != null ? "edit".tr : "create_service".tr,
            fontSize: 15.0.sp),
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
              initialValue: widget.categoryToEdit != null
                  ? widget.categoryToEdit!.nameAr
                  : null,
              focusNode: _focusNodes[0],
              borderRadius: 10,
              onchanged: (s) {
                if (widget.categoryToEdit != null) {
                  widget.categoryToEdit!.nameAr = s;
                } else {
                  categoryToCreate.nameAr = s;
                }
              },
            ),
            spaceY(10.sp),
            coloredText(text: "name_en".tr),
            spaceY(5.sp),
            SendMessageTextField(
              initialValue: widget.categoryToEdit != null
                  ? widget.categoryToEdit!.nameEn
                  : null,
              focusNode: _focusNodes[1],
              onchanged: (s) {
                if (widget.categoryToEdit != null) {
                  widget.categoryToEdit!.nameEn = s;
                } else {
                  categoryToCreate.nameEn = s;
                }
              },
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
                    if (widget.categoryToEdit != null) {
                      widget.categoryToEdit!.image = result.files[0];
                    } else {
                      categoryToCreate.image = result.files[0];
                    }
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
                onTap: () async {
                  bool b = false;
                  FocusScope.of(context).unfocus();
                  if (widget.categoryToEdit != null) {
                    b = await _categoriesController.updateCategory(
                        category: widget.categoryToEdit!);
                    logSuccess("edit");
                  } else {
                    b = await _categoriesController.createCategory(
                        category: categoryToCreate);
                    logSuccess("create");
                  }
                  // ignore: use_build_context_synchronously
                  if (b) Utils.doneDialog(context: context, backTimes: 2);
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
