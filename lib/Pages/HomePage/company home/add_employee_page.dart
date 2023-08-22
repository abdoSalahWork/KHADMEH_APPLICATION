import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:khedma/Pages/global_controller.dart';
import 'package:khedma/Themes/themes.dart';
import 'package:khedma/widgets/radio_button.dart';
import 'package:khedma/widgets/underline_text_field.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:sizer/sizer.dart';

import '../../../Utils/utils.dart';
import '../../../widgets/dropdown_menu_button.dart';

// ignore: must_be_immutable
class AddEmployeePage extends StatefulWidget {
  const AddEmployeePage({super.key});

  @override
  State<AddEmployeePage> createState() => _AddEmployeePageState();
}

class _AddEmployeePageState extends State<AddEmployeePage> {
  String nationality = "";
  String religion = "";
  String birthplace = "";
  String livingTown = "";
  String maritalStatus = "";
  String complexion = "";
  String issuePlace = "";
  String contractDuration = "";
  String workAbroad = "";
  String educationalCertificate = "";
  String languagesKnown = "";

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

  int offerRadio = 0;

  final List<FocusNode> _focusNodes = List.generate(21, (index) => FocusNode());
  @override
  void initState() {
    for (var node in _focusNodes) {
      node.addListener(() {
        setState(() {});
      });
    }
    super.initState();
  }

  final ExpandableController _expandableController =
      ExpandableController(initialExpanded: true);
  final ExpandableController _expandable2Controller =
      ExpandableController(initialExpanded: false);
  final ExpandableController _expandable3Controller =
      ExpandableController(initialExpanded: false);
  final ExpandableController _expandable4Controller =
      ExpandableController(initialExpanded: false);
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _employmentDurationController =
      TextEditingController();
  final TextEditingController _childrenNumController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _expirydateController = TextEditingController();
  final TextEditingController _issuedateController = TextEditingController();
  final TextEditingController _passportNoController = TextEditingController();
  final TextEditingController _monthlySaleryNoController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        title: coloredText(text: "Add new employee".tr, fontSize: 15.0.sp),
      ),
      body: ExpandableNotifier(
        child: ExpandableTheme(
          data: const ExpandableThemeData(
            iconColor: Colors.black,
            useInkWell: false,
          ),
          child: GetBuilder<GlobalController>(builder: (c) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  spaceY(8.sp),
                  Stack(
                    children: [
                      Align(
                        child: Container(
                          width: 40.w,
                          height: 40.w,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xffEFEFEF),
                          ),
                          child: Icon(
                            EvaIcons.person,
                            size: 35.w,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      PositionedDirectional(
                        bottom: 0,
                        end: 23.w,
                        child: Align(
                          child: Container(
                            width: 15.w,
                            height: 15.w,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 4),
                              shape: BoxShape.circle,
                              color: const Color(0xffEFEFEF),
                            ),
                            child: Icon(
                              EvaIcons.plus,
                              size: 10.w,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  spaceY(8.sp),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        bottom: BorderSide(color: Color(0xffEFEFEF)),
                      ),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: ScrollOnExpand(
                      scrollOnExpand: true,
                      scrollOnCollapse: false,
                      child: ExpandablePanel(
                        controller: _expandableController,
                        theme: const ExpandableThemeData(
                          headerAlignment:
                              ExpandablePanelHeaderAlignment.center,
                          tapBodyToCollapse: true,
                        ),
                        header: Padding(
                          padding: const EdgeInsets.all(10),
                          child: coloredText(
                            text: "Personal info",
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp,
                          ),
                        ),
                        collapsed: Container(),
                        expanded: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            border: Border(
                              top: BorderSide(color: Color(0xffEFEFEF)),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  spaceY(10),
                                  coloredText(text: "Full name"),
                                  spaceY(5.sp),
                                  SendMessageTextField(
                                    borderRadius: 10,
                                    focusNode: _focusNodes[0],
                                    fillColor: const Color(0xffF8F8F8),
                                    controller: _fullNameController,
                                  ),
                                  spaceY(10.sp),
                                  coloredText(text: "Nationality"),
                                  spaceY(5.sp),
                                  CustomDropDownMenuButton(
                                    hintPadding: 0,
                                    padding: const EdgeInsetsDirectional.only(
                                        start: 10),
                                    focusNode: _focusNodes[1],

                                    validator: (String? value) {
                                      if (value!.isEmpty) return "required";
                                      return null;
                                    },
                                    // borderc: Border.all(color: Colors.red),
                                    fillColor: const Color(0xffF8F8F8),
                                    width: 100.w,
                                    value:
                                        nationality == "" ? null : nationality,
                                    items: c.countries
                                        .map(
                                          (e) => DropdownMenuItem<String>(
                                            value: e.nameEn,
                                            child: coloredText(
                                                text: e.nameEn!,
                                                color: Colors.black),
                                          ),
                                        )
                                        .toList(),
                                    border: null,

                                    onChanged: (p0) {
                                      nationality = p0!;
                                      setState(() {});
                                    },

                                    // borderc: Border.all(color: const Color(0xffE3E3E3)),
                                    borderRadius: BorderRadius.circular(10),
                                    // padding:
                                    //     const EdgeInsetsDirectional.symmetric(horizontal: 10),
                                  ),
                                  spaceY(10.sp),
                                  coloredText(text: "Religion"),
                                  spaceY(5.sp),
                                  CustomDropDownMenuButton(
                                    hintPadding: 0,
                                    padding: const EdgeInsetsDirectional.only(
                                        start: 10),
                                    focusNode: _focusNodes[2],
                                    validator: (String? value) {
                                      if (value!.isEmpty) return "required";
                                      return null;
                                    },
                                    // borderc: Border.all(color: Colors.red),
                                    fillColor: const Color(0xffF8F8F8),
                                    width: 100.w,
                                    value: religion == "" ? null : religion,
                                    items: c.countries
                                        .map(
                                          (e) => DropdownMenuItem<String>(
                                            value: e.nameEn,
                                            child: coloredText(
                                                text: e.nameEn!,
                                                color: Colors.black),
                                          ),
                                        )
                                        .toList(),
                                    border: null,

                                    onChanged: (p0) {
                                      religion = p0!;
                                      setState(() {});
                                    },

                                    // borderc: Border.all(color: const Color(0xffE3E3E3)),
                                    borderRadius: BorderRadius.circular(10),
                                    // padding:
                                    //     const EdgeInsetsDirectional.symmetric(horizontal: 10),
                                  ),
                                  spaceY(10.sp),
                                  coloredText(text: "Date of birth"),
                                  spaceY(5.sp),
                                  SendMessageTextField(
                                    onTap: () async {
                                      DateTime? x = await showDatePicker(
                                          builder: (context, child) => Theme(
                                                data: ThemeData(
                                                  colorScheme:
                                                      ColorScheme.fromSeed(
                                                    seedColor:
                                                        AppThemes.colorCustom,
                                                  ),
                                                ),
                                                child: child!,
                                              ),
                                          context: context,
                                          initialDate: DateTime.now().subtract(
                                            const Duration(days: 365 * 20),
                                          ),
                                          firstDate: DateTime.now().subtract(
                                            const Duration(days: 365 * 50),
                                          ),
                                          lastDate: DateTime.now().subtract(
                                              const Duration(days: 365 * 15)));
                                      if (x != null) {
                                        _dateController.text =
                                            DateFormat('y/MM/dd').format(x);
                                      }
                                    },
                                    focusNode: _focusNodes[3],
                                    hintText: 'YYYY/MM/DD',
                                    fillColor: const Color(0xffF8F8F8),
                                    borderRadius: 10,
                                    controller: _dateController,
                                    readOnly: true,
                                  ),
                                  spaceY(10.sp),
                                  coloredText(text: "Birth Place"),
                                  spaceY(5.sp),
                                  CustomDropDownMenuButton(
                                    hintPadding: 0,
                                    padding: const EdgeInsetsDirectional.only(
                                        start: 10),
                                    focusNode: _focusNodes[4],
                                    validator: (String? value) {
                                      if (value!.isEmpty) return "required";
                                      return null;
                                    },
                                    // borderc: Border.all(color: Colors.red),
                                    fillColor: const Color(0xffF8F8F8),
                                    width: 100.w,
                                    value: birthplace == "" ? null : birthplace,
                                    items: c.countries
                                        .map(
                                          (e) => DropdownMenuItem<String>(
                                            value: e.nameEn,
                                            child: coloredText(
                                                text: e.nameEn!,
                                                color: Colors.black),
                                          ),
                                        )
                                        .toList(),
                                    border: null,

                                    onChanged: (p0) {
                                      birthplace = p0!;
                                      setState(() {});
                                    },

                                    // borderc: Border.all(color: const Color(0xffE3E3E3)),
                                    borderRadius: BorderRadius.circular(10),
                                    // padding:
                                    //     const EdgeInsetsDirectional.symmetric(horizontal: 10),
                                  ),
                                  spaceY(10.sp),
                                  coloredText(text: "Living town"),
                                  spaceY(5.sp),
                                  CustomDropDownMenuButton(
                                    hintPadding: 0,
                                    padding: const EdgeInsetsDirectional.only(
                                        start: 10),
                                    focusNode: _focusNodes[5],
                                    validator: (String? value) {
                                      if (value!.isEmpty) return "required";
                                      return null;
                                    },
                                    // borderc: Border.all(color: Colors.red),
                                    fillColor: const Color(0xffF8F8F8),
                                    width: 100.w,
                                    value: livingTown == "" ? null : livingTown,
                                    items: c.countries
                                        .map(
                                          (e) => DropdownMenuItem<String>(
                                            value: e.nameEn,
                                            child: coloredText(
                                                text: e.nameEn!,
                                                color: Colors.black),
                                          ),
                                        )
                                        .toList(),
                                    border: null,

                                    onChanged: (p0) {
                                      livingTown = p0!;
                                      setState(() {});
                                    },

                                    // borderc: Border.all(color: const Color(0xffE3E3E3)),
                                    borderRadius: BorderRadius.circular(10),
                                    // padding:
                                    //     const EdgeInsetsDirectional.symmetric(horizontal: 10),
                                  ),
                                  spaceY(10.sp),
                                  coloredText(text: "Marital Status"),
                                  spaceY(5.sp),
                                  CustomDropDownMenuButton(
                                    hintPadding: 0,
                                    padding: const EdgeInsetsDirectional.only(
                                        start: 10),
                                    focusNode: _focusNodes[6],
                                    validator: (String? value) {
                                      if (value!.isEmpty) return "required";
                                      return null;
                                    },
                                    // borderc: Border.all(color: Colors.red),
                                    fillColor: const Color(0xffF8F8F8),
                                    width: 100.w,
                                    value: maritalStatus == ""
                                        ? null
                                        : maritalStatus,
                                    items: c.countries
                                        .map(
                                          (e) => DropdownMenuItem<String>(
                                            value: e.nameEn,
                                            child: coloredText(
                                                text: e.nameEn!,
                                                color: Colors.black),
                                          ),
                                        )
                                        .toList(),
                                    border: null,

                                    onChanged: (p0) {
                                      maritalStatus = p0!;
                                      setState(() {});
                                    },

                                    // borderc: Border.all(color: const Color(0xffE3E3E3)),
                                    borderRadius: BorderRadius.circular(10),
                                    // padding:
                                    //     const EdgeInsetsDirectional.symmetric(horizontal: 10),
                                  ),
                                  spaceY(10.sp),
                                  coloredText(text: "No. of children"),
                                  spaceY(5.sp),
                                  SendMessageTextField(
                                    focusNode: _focusNodes[7],
                                    validator: (String? value) {
                                      if (value!.isEmpty) return "required";
                                      return null;
                                    },
                                    controller: _childrenNumController,
                                    keyBoardType: TextInputType.number,
                                    fillColor: const Color(0xffF8F8F8),
                                    width: 100.w,

                                    // borderc: Border.all(color: const Color(0xffE3E3E3)),
                                    borderRadius: 8,
                                    // padding:
                                    //     const EdgeInsetsDirectional.symmetric(horizontal: 10),
                                  ),
                                  spaceY(10.sp),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            coloredText(text: "Weight"),
                                            SizedBox(
                                              width: 40.w,
                                              child: SendMessageTextField(
                                                focusNode: _focusNodes[8],
                                                validator: (String? value) {
                                                  if (value!.isEmpty)
                                                    return "required";
                                                  return null;
                                                },
                                                controller: _weightController,
                                                keyBoardType:
                                                    TextInputType.number,
                                                fillColor:
                                                    const Color(0xffF8F8F8),
                                                width: 100.w,

                                                // borderc: Border.all(color: const Color(0xffE3E3E3)),
                                                borderRadius: 8,
                                                // padding:
                                                //     const EdgeInsetsDirectional.symmetric(horizontal: 10),
                                              ),
                                            ),
                                          ]),
                                      Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            coloredText(text: "Height"),
                                            SizedBox(
                                              width: 40.w,
                                              child: SendMessageTextField(
                                                focusNode: _focusNodes[9],
                                                validator: (String? value) {
                                                  if (value!.isEmpty)
                                                    return "required";
                                                  return null;
                                                },
                                                controller: _heightController,
                                                keyBoardType:
                                                    TextInputType.number,
                                                fillColor:
                                                    const Color(0xffF8F8F8),
                                                width: 100.w,

                                                // borderc: Border.all(color: const Color(0xffE3E3E3)),
                                                borderRadius: 8,
                                                // padding:
                                                //     const EdgeInsetsDirectional.symmetric(horizontal: 10),
                                              ),
                                            ),
                                          ]),
                                    ],
                                  ),
                                  spaceY(10.sp),
                                  coloredText(text: "Complexion"),
                                  spaceY(5.sp),
                                  CustomDropDownMenuButton(
                                    hintPadding: 0,
                                    padding: const EdgeInsetsDirectional.only(
                                        start: 10),
                                    focusNode: _focusNodes[10],
                                    validator: (String? value) {
                                      if (value!.isEmpty) return "required";
                                      return null;
                                    },
                                    // borderc: Border.all(color: Colors.red),
                                    fillColor: const Color(0xffF8F8F8),
                                    width: 100.w,
                                    value: complexion == "" ? null : complexion,
                                    items: c.countries
                                        .map(
                                          (e) => DropdownMenuItem<String>(
                                            value: e.nameEn,
                                            child: coloredText(
                                                text: e.nameEn!,
                                                color: Colors.black),
                                          ),
                                        )
                                        .toList(),
                                    border: null,

                                    onChanged: (p0) {
                                      complexion = p0!;
                                      setState(() {});
                                    },

                                    // borderc: Border.all(color: const Color(0xffE3E3E3)),
                                    borderRadius: BorderRadius.circular(10),
                                    // padding:
                                    //     const EdgeInsetsDirectional.symmetric(horizontal: 10),
                                  ),
                                  spaceY(10.sp),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  spaceY(10.sp),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        bottom: BorderSide(color: Color(0xffEFEFEF)),
                      ),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: ScrollOnExpand(
                      scrollOnExpand: true,
                      scrollOnCollapse: false,
                      child: ExpandablePanel(
                        controller: _expandable2Controller,
                        theme: const ExpandableThemeData(
                          headerAlignment:
                              ExpandablePanelHeaderAlignment.center,
                          tapBodyToCollapse: true,
                        ),
                        header: Padding(
                          padding: const EdgeInsets.all(10),
                          child: coloredText(
                            text: "Passport data",
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp,
                          ),
                        ),
                        collapsed: Container(),
                        expanded: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            border: Border(
                              top: BorderSide(color: Color(0xffEFEFEF)),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  spaceY(10),
                                  coloredText(text: "Passport data"),
                                  spaceY(5.sp),
                                  SendMessageTextField(
                                    borderRadius: 10,
                                    focusNode: _focusNodes[11],
                                    fillColor: const Color(0xffF8F8F8),
                                    controller: _passportNoController,
                                  ),
                                  spaceY(10.sp),
                                  coloredText(text: "Issue date"),
                                  spaceY(5.sp),
                                  SendMessageTextField(
                                    onTap: () async {
                                      DateTime? x = await showDatePicker(
                                          builder: (context, child) => Theme(
                                                data: ThemeData(
                                                  colorScheme:
                                                      ColorScheme.fromSeed(
                                                    seedColor:
                                                        AppThemes.colorCustom,
                                                  ),
                                                ),
                                                child: child!,
                                              ),
                                          context: context,
                                          initialDate: DateTime.now().subtract(
                                            const Duration(days: 365 * 20),
                                          ),
                                          firstDate: DateTime.now().subtract(
                                            const Duration(days: 365 * 50),
                                          ),
                                          lastDate: DateTime.now().subtract(
                                              const Duration(days: 365 * 15)));
                                      if (x != null) {
                                        _issuedateController.text =
                                            DateFormat('y/MM/dd').format(x);
                                      }
                                    },
                                    focusNode: _focusNodes[12],
                                    hintText: 'YYYY/MM/DD',
                                    fillColor: const Color(0xffF8F8F8),
                                    borderRadius: 10,
                                    controller: _issuedateController,
                                    readOnly: true,
                                  ),
                                  spaceY(10.sp),
                                  coloredText(text: "Place of issue"),
                                  spaceY(5.sp),
                                  CustomDropDownMenuButton(
                                    hintPadding: 0,
                                    padding: const EdgeInsetsDirectional.only(
                                        start: 10),
                                    focusNode: _focusNodes[13],
                                    validator: (String? value) {
                                      if (value!.isEmpty) return "required";
                                      return null;
                                    },
                                    // borderc: Border.all(color: Colors.red),
                                    fillColor: const Color(0xffF8F8F8),
                                    width: 100.w,
                                    value: issuePlace == "" ? null : issuePlace,
                                    items: c.countries
                                        .map(
                                          (e) => DropdownMenuItem<String>(
                                            value: e.nameEn,
                                            child: coloredText(
                                                text: e.nameEn!,
                                                color: Colors.black),
                                          ),
                                        )
                                        .toList(),
                                    border: null,

                                    onChanged: (p0) {
                                      issuePlace = p0!;
                                      setState(() {});
                                    },

                                    // borderc: Border.all(color: const Color(0xffE3E3E3)),
                                    borderRadius: BorderRadius.circular(10),
                                    // padding:
                                    //     const EdgeInsetsDirectional.symmetric(horizontal: 10),
                                  ),
                                  spaceY(10.sp),
                                  coloredText(text: "Expiry date"),
                                  spaceY(5.sp),
                                  SendMessageTextField(
                                    onTap: () async {
                                      DateTime? x = await showDatePicker(
                                          builder: (context, child) => Theme(
                                                data: ThemeData(
                                                  colorScheme:
                                                      ColorScheme.fromSeed(
                                                    seedColor:
                                                        AppThemes.colorCustom,
                                                  ),
                                                ),
                                                child: child!,
                                              ),
                                          context: context,
                                          initialDate: DateTime.now().subtract(
                                            const Duration(days: 365 * 20),
                                          ),
                                          firstDate: DateTime.now().subtract(
                                            const Duration(days: 365 * 50),
                                          ),
                                          lastDate: DateTime.now().subtract(
                                              const Duration(days: 365 * 15)));
                                      if (x != null) {
                                        _expirydateController.text =
                                            DateFormat('y/MM/dd').format(x);
                                      }
                                    },
                                    focusNode: _focusNodes[14],
                                    hintText: 'YYYY/MM/DD',
                                    fillColor: const Color(0xffF8F8F8),
                                    borderRadius: 10,
                                    controller: _expirydateController,
                                    readOnly: true,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  spaceY(10.sp),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        bottom: BorderSide(color: Color(0xffEFEFEF)),
                      ),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: ScrollOnExpand(
                      scrollOnExpand: true,
                      scrollOnCollapse: false,
                      child: ExpandablePanel(
                        controller: _expandable3Controller,
                        theme: const ExpandableThemeData(
                          headerAlignment:
                              ExpandablePanelHeaderAlignment.center,
                          tapBodyToCollapse: true,
                        ),
                        header: Padding(
                          padding: const EdgeInsets.all(10),
                          child: coloredText(
                            text: "Work info",
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp,
                          ),
                        ),
                        collapsed: Container(),
                        expanded: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            border: Border(
                              top: BorderSide(color: Color(0xffEFEFEF)),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  spaceY(10),
                                  coloredText(text: "Job name"),
                                  spaceY(5.sp),
                                  Theme(
                                    data: Theme.of(context).copyWith(
                                      dialogTheme: DialogTheme(
                                        backgroundColor: Colors.white,
                                        surfaceTintColor: Colors.white,
                                        elevation: 5,
                                        shadowColor: Colors.grey,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          side: const BorderSide(
                                              color: Colors.grey, width: 0.5),
                                        ),
                                      ),
                                    ),
                                    child: MultiSelectDialogField(
                                      buttonText: coloredText(
                                          text: "choose".tr,
                                          color: Colors.grey,
                                          fontSize: 15),
                                      items: jobs
                                          .map((e) => MultiSelectItem(e, e))
                                          .toList(),
                                      listType: MultiSelectListType.CHIP,
                                      // selectedColor: Theme.of(context).colorScheme.secondary,
                                      // backgroundColor: Colors.white,
                                      selectedItemsTextStyle: coloredText(
                                              text: "text",
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .secondary)
                                          .style,
                                      selectedColor: Theme.of(context)
                                          .colorScheme
                                          .secondary
                                          .withOpacity(0.05),

                                      buttonIcon: Icon(
                                        FontAwesomeIcons.sortDown,
                                        color: Colors.grey.shade700,
                                        size: 15,
                                      ),
                                      decoration: BoxDecoration(
                                        color: const Color(0xffF8F8F8),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      chipDisplay:
                                          MultiSelectChipDisplay<String>.none(),
                                      //     `(
                                      //   chipColor: Theme.of(context)
                                      //       .colorScheme
                                      //       .secondary
                                      //       .withOpacity(0.05),
                                      //   shape: RoundedRectangleBorder(
                                      //     borderRadius:
                                      //         BorderRadius.circular(10),
                                      //   ),
                                      //   onTap: (p0) {
                                      //     selectedJobs.remove(p0);
                                      //     setState(() {});
                                      //   },
                                      //   textStyle: coloredText(
                                      //           text: "text",
                                      //           color: Theme.of(context)
                                      //               .colorScheme
                                      //               .secondary)
                                      //       .style,
                                      // ),
                                      onConfirm: (values) {
                                        selectedJobs = values;
                                        setState(() {});
                                      },
                                    ),
                                  ),
                                  spaceY(5.sp),
                                  selectedJobs.isEmpty
                                      ? Container()
                                      : SizedBox(
                                          height: 28.sp,
                                          child: ListView.separated(
                                              scrollDirection: Axis.horizontal,
                                              itemBuilder: (context, index) =>
                                                  GestureDetector(
                                                    onTap: () {
                                                      selectedJobs
                                                          .removeAt(index);
                                                      setState(() {});
                                                    },
                                                    child: Container(
                                                      child: Center(
                                                          child: coloredText(
                                                              text:
                                                                  selectedJobs[
                                                                      index],
                                                              color: Theme.of(
                                                                      context)
                                                                  .colorScheme
                                                                  .secondary)),
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                        horizontal: 20,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: Theme.of(
                                                                    context)
                                                                .colorScheme
                                                                .secondary),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                        color: Theme.of(context)
                                                            .colorScheme
                                                            .secondary
                                                            .withOpacity(0.05),
                                                      ),
                                                    ),
                                                  ),
                                              separatorBuilder:
                                                  (context, index) =>
                                                      spaceX(10.sp),
                                              itemCount: selectedJobs.length),
                                        ),
                                  spaceY(10.sp),
                                  coloredText(text: "Is there offer"),
                                  Row(
                                    children: [
                                      MyRadioButton(
                                        text: "no",
                                        color: Colors.black,
                                        value: 0,
                                        groupValue: offerRadio,
                                        onChanged: (p0) {
                                          offerRadio = p0;
                                          setState(() {});
                                        },
                                      ),
                                      spaceX(20),
                                      MyRadioButton(
                                        text: "Yes",
                                        color: Colors.black,
                                        value: 1,
                                        groupValue: offerRadio,
                                        onChanged: (p0) {
                                          offerRadio = p0;
                                          setState(() {});
                                        },
                                      )
                                    ],
                                  ),
                                  spaceY(10.sp),
                                  coloredText(text: "Monthly salery"),
                                  spaceY(5.sp),
                                  SendMessageTextField(
                                    focusNode: _focusNodes[15],
                                    validator: (String? value) {
                                      if (value!.isEmpty) return "required";
                                      return null;
                                    },
                                    hintText: "0 KD",
                                    controller: _monthlySaleryNoController,
                                    keyBoardType: TextInputType.number,
                                    fillColor: const Color(0xffF8F8F8),
                                    width: 100.w,

                                    // borderc: Border.all(color: const Color(0xffE3E3E3)),
                                    borderRadius: 8,
                                    // padding:
                                    //     const EdgeInsetsDirectional.symmetric(horizontal: 10),
                                  ),
                                  spaceY(10.sp),
                                  coloredText(text: "Contract duration"),
                                  spaceY(5.sp),
                                  CustomDropDownMenuButton(
                                    hintPadding: 0,
                                    padding: const EdgeInsetsDirectional.only(
                                        start: 10),
                                    focusNode: _focusNodes[16],

                                    validator: (String? value) {
                                      if (value!.isEmpty) return "required";
                                      return null;
                                    },
                                    // borderc: Border.all(color: Colors.red),
                                    fillColor: const Color(0xffF8F8F8),
                                    width: 100.w,
                                    value: contractDuration == ""
                                        ? null
                                        : contractDuration,
                                    items: c.countries
                                        .map(
                                          (e) => DropdownMenuItem<String>(
                                            value: e.nameEn,
                                            child: coloredText(
                                                text: e.nameEn!,
                                                color: Colors.black),
                                          ),
                                        )
                                        .toList(),
                                    border: null,

                                    onChanged: (p0) {
                                      contractDuration = p0!;
                                      setState(() {});
                                    },

                                    // borderc: Border.all(color: const Color(0xffE3E3E3)),
                                    borderRadius: BorderRadius.circular(10),
                                    // padding:
                                    //     const EdgeInsetsDirectional.symmetric(horizontal: 10),
                                  ),
                                  spaceY(10.sp),
                                  coloredText(text: "Previous work abroad"),
                                  spaceY(5.sp),
                                  CustomDropDownMenuButton(
                                    hintPadding: 0,
                                    padding: const EdgeInsetsDirectional.only(
                                        start: 10),
                                    focusNode: _focusNodes[17],

                                    validator: (String? value) {
                                      if (value!.isEmpty) return "required";
                                      return null;
                                    },
                                    // borderc: Border.all(color: Colors.red),
                                    fillColor: const Color(0xffF8F8F8),
                                    width: 100.w,
                                    value: workAbroad == "" ? null : workAbroad,
                                    items: ["Yes", "No"]
                                        .map(
                                          (e) => DropdownMenuItem<String>(
                                            value: e,
                                            child: coloredText(
                                                text: e, color: Colors.black),
                                          ),
                                        )
                                        .toList(),
                                    border: null,

                                    onChanged: (p0) {
                                      workAbroad = p0!;
                                      setState(() {});
                                    },

                                    // borderc: Border.all(color: const Color(0xffE3E3E3)),
                                    borderRadius: BorderRadius.circular(10),
                                    // padding:
                                    //     const EdgeInsetsDirectional.symmetric(horizontal: 10),
                                  ),
                                  spaceY(10.sp),
                                  coloredText(text: "Duration of employment"),
                                  spaceY(5.sp),
                                  SendMessageTextField(
                                    focusNode: _focusNodes[18],
                                    validator: (String? value) {
                                      if (value!.isEmpty) return "required";
                                      return null;
                                    },
                                    // hintText: "0 KD",
                                    controller: _employmentDurationController,
                                    keyBoardType: TextInputType.number,
                                    fillColor: const Color(0xffF8F8F8),
                                    width: 100.w,

                                    // borderc: Border.all(color: const Color(0xffE3E3E3)),
                                    borderRadius: 8,
                                    // padding:
                                    //     const EdgeInsetsDirectional.symmetric(horizontal: 10),
                                  ),
                                  spaceY(10.sp),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  spaceY(10.sp),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        bottom: BorderSide(color: Color(0xffEFEFEF)),
                      ),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: ScrollOnExpand(
                      scrollOnExpand: true,
                      scrollOnCollapse: false,
                      child: ExpandablePanel(
                        controller: _expandable4Controller,
                        theme: const ExpandableThemeData(
                          headerAlignment:
                              ExpandablePanelHeaderAlignment.center,
                          tapBodyToCollapse: true,
                        ),
                        header: Padding(
                          padding: const EdgeInsets.all(10),
                          child: coloredText(
                            text: "Other data",
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp,
                          ),
                        ),
                        collapsed: Container(),
                        expanded: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            border: Border(
                              top: BorderSide(color: Color(0xffEFEFEF)),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  spaceY(10),
                                  coloredText(
                                      text: "Educational certification"),
                                  spaceY(5.sp),
                                  CustomDropDownMenuButton(
                                    hintPadding: 0,
                                    padding: const EdgeInsetsDirectional.only(
                                        start: 10),
                                    focusNode: _focusNodes[19],

                                    validator: (String? value) {
                                      if (value!.isEmpty) return "required";
                                      return null;
                                    },
                                    // borderc: Border.all(color: Colors.red),
                                    fillColor: const Color(0xffF8F8F8),
                                    width: 100.w,
                                    value: educationalCertificate == ""
                                        ? null
                                        : educationalCertificate,
                                    items: c.countries
                                        .map(
                                          (e) => DropdownMenuItem<String>(
                                            value: e.nameEn,
                                            child: coloredText(
                                                text: e.nameEn!,
                                                color: Colors.black),
                                          ),
                                        )
                                        .toList(),
                                    border: null,

                                    onChanged: (p0) {
                                      educationalCertificate = p0!;
                                      setState(() {});
                                    },

                                    // borderc: Border.all(color: const Color(0xffE3E3E3)),
                                    borderRadius: BorderRadius.circular(10),
                                    // padding:
                                    //     const EdgeInsetsDirectional.symmetric(horizontal: 10),
                                  ),
                                  spaceY(10.sp),
                                  coloredText(text: "Knowledge of languages"),
                                  spaceY(5.sp),
                                  CustomDropDownMenuButton(
                                    hintPadding: 0,
                                    padding: const EdgeInsetsDirectional.only(
                                        start: 10),
                                    focusNode: _focusNodes[20],

                                    validator: (String? value) {
                                      if (value!.isEmpty) return "required";
                                      return null;
                                    },
                                    // borderc: Border.all(color: Colors.red),
                                    fillColor: const Color(0xffF8F8F8),
                                    width: 100.w,
                                    value: languagesKnown == ""
                                        ? null
                                        : languagesKnown,
                                    items: ["Yes", "No"]
                                        .map(
                                          (e) => DropdownMenuItem<String>(
                                            value: e,
                                            child: coloredText(
                                                text: e, color: Colors.black),
                                          ),
                                        )
                                        .toList(),
                                    border: null,

                                    onChanged: (p0) {
                                      languagesKnown = p0!;
                                      setState(() {});
                                    },

                                    // borderc: Border.all(color: const Color(0xffE3E3E3)),
                                    borderRadius: BorderRadius.circular(10),
                                    // padding:
                                    //     const EdgeInsetsDirectional.symmetric(horizontal: 10),
                                  ),
                                  spaceY(10.sp),
                                  coloredText(text: "Duration of employment"),
                                  spaceY(5.sp),
                                  SendMessageTextField(
                                    focusNode: _focusNodes[18],
                                    validator: (String? value) {
                                      if (value!.isEmpty) return "required";
                                      return null;
                                    },
                                    // hintText: "0 KD",
                                    controller: _employmentDurationController,
                                    keyBoardType: TextInputType.number,
                                    fillColor: const Color(0xffF8F8F8),
                                    width: 100.w,

                                    // borderc: Border.all(color: const Color(0xffE3E3E3)),
                                    borderRadius: 8,
                                    // padding:
                                    //     const EdgeInsetsDirectional.symmetric(horizontal: 10),
                                  ),
                                  spaceY(10.sp),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  spaceY(10.sp),
                  primaryButton(
                      width: 40.w,
                      color: Theme.of(context).colorScheme.primary,
                      height: 35.sp,
                      radius: 10.w,
                      text: coloredText(
                          text: "add".tr,
                          color: Colors.white,
                          fontSize: 14.sp)),
                  spaceY(10.sp),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
