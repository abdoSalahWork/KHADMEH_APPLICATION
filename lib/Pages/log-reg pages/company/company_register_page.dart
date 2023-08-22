import 'dart:math';

import 'package:dotted_border/dotted_border.dart' as db;
import 'package:easy_stepper/easy_stepper.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:khedma/Pages/global_controller.dart';
import 'package:khedma/Pages/log-reg%20pages/controller/auth_controller.dart';
import 'package:khedma/Pages/log-reg%20pages/models/company_register_model.dart';
import 'package:khedma/Pages/log-reg%20pages/otp_page.dart';
import 'package:line_icons/line_icons.dart';
import 'package:sizer/sizer.dart';
import 'package:textfield_datepicker/textfield_datepicker.dart';

import '../../../Themes/themes.dart';
import '../../../Utils/utils.dart';
import '../../../widgets/dropdown_menu_button.dart';
import '../../../widgets/radio_button.dart';
import '../../../widgets/underline_text_field.dart';

class CompanyRegisterPage extends StatefulWidget {
  const CompanyRegisterPage({super.key, required this.userType});
  final String userType;

  @override
  State<CompanyRegisterPage> createState() => _CompanyRegisterPageState();
}

class _CompanyRegisterPageState extends State<CompanyRegisterPage> {
  int _currentStep = 0;
  tapped(int step) {
    setState(() => _currentStep = step);
  }

  final AuthController _authController = Get.find();

  cancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  }

  CompanyRegisterData companyRegisterData = CompanyRegisterData();

  PageController pageController = PageController(initialPage: 0);
  var errors = {};
  String ownerphoneCode = "";
  String ownerNationality = "";
  String companyphoneCode = "";
  String companyType = "recruitment";
  String city = "";
  String region = "";
  int idPassRadio = 0;
  final formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _urlController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _companyNameEnController =
      TextEditingController();
  final TextEditingController _ownerPhoneNumberController =
      TextEditingController();
  final TextEditingController _companyPhoneNumberController =
      TextEditingController();
  // final TextEditingController _nationallityController = TextEditingController();
  final TextEditingController _pieceNumberController = TextEditingController();
  final TextEditingController _streetController = TextEditingController();
  final TextEditingController _buildingController = TextEditingController();
  final TextEditingController _adnController = TextEditingController();
  final TextEditingController _idNumController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmController =
      TextEditingController();
  final TextEditingController _crnController = TextEditingController();
  final TextEditingController _taxController = TextEditingController();
  final TextEditingController _licenseController = TextEditingController();
  bool _obsecureflag = true;
  bool _obsecureflag2 = true;
  void toggleObsecure() {
    _obsecureflag = !_obsecureflag;
    setState(() {});
  }

  void toggleObsecure2() {
    _obsecureflag2 = !_obsecureflag2;
    setState(() {});
  }

  final List<FocusNode> _focusNodes = List.generate(20, (index) => FocusNode());
  String logobuttonText = "Upload company logo";
  String frontIdButton = "Upload front side of ID";
  String backIdButton = "Upload back side of ID";
  String passportButton = "Upload your passport";

  @override
  void initState() {
    for (var node in _focusNodes) {
      node.addListener(() {
        setState(() {});
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: ZeroAppBar(color: Theme.of(context).primaryColor),
      body: Stack(
        children: [
          Column(
            children: [
              ClipPath(
                clipper: OvalBottomBorderClipper(),
                // clipper: WaveClipperOne(flip: true),
                child: Container(
                  height: 16.0.h,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              SizedBox(
                height: 4.0.h,
              ),
              Expanded(
                  child: Column(
                children: [
                  EasyStepper(
                    activeStep: _currentStep,
                    lineLength: 18.0.w,
                    lineSpace: 0,
                    lineType: LineType.normal,
                    defaultLineColor: Colors.grey,

                    finishedLineColor: Theme.of(context).colorScheme.tertiary,
                    activeStepTextColor: Theme.of(context).colorScheme.tertiary,
                    finishedStepTextColor: Colors.transparent,
                    internalPadding: 0,
                    showLoadingAnimation: false,
                    stepRadius: 12,
                    showStepBorder: false,
                    lineThickness: 1,
                    alignment: Alignment.topCenter,
                    disableScroll: true,
                    fitWidth: true,
                    steps: stepList(),
                    // onStepReached: (index) =>
                    //     setState(() => _currentStep = index),
                  ),
                  Expanded(
                    child: PageView(
                      controller: pageController,
                      physics: const NeverScrollableScrollPhysics(),
                      children: pageList,
                    ),
                  ),
                ],
              )
                  //  Container(
                  //   width: 100.0.w,
                  //   margin: EdgeInsetsDirectional.only(bottom: 10),
                  //   child: Form(
                  //     key: formKey,
                  //     child: MyStepper(
                  //         type: MyStepperType.horizontal,
                  //         onStepContinue: () {
                  //           _currentStep < stepList(0, 0).length - 1
                  //               ? setState(() => _currentStep += 1)
                  //               : null;
                  //         },
                  //         elevation: 0,
                  //         onStepCancel: cancel,
                  //         onStepTapped: tapped,
                  //         currentStep: _currentStep,
                  //         steps: stepList(100.0.h, 100.0.w),
                  //         // physics: const NeverScrollableScrollPhysics(),
                  //         controlsBuilder: (context, details) {
                  //           return primaryButton(
                  //             height: 50,
                  //             width: 45.0.w,
                  //             radius: 30,
                  //             onTap: () {
                  //               _currentStep < stepList(0, 0).length - 1
                  //                   ? setState(() => _currentStep += 1)
                  //                   : Get.to(
                  //                       () => const OTPPage(),
                  //                       transition: Transition.rightToLeft,
                  //                     );
                  //             },
                  //             text: coloredText(
                  //               text: "next".tr,
                  //               color: Colors.white,
                  //               fontSize: 16.0.sp,
                  //             ),
                  //             color: Theme.of(context).primaryColor,
                  //           );
                  //         }),
                  //   ),
                  // ),

                  )
            ],
          ),
          Positioned(
            top: -282.0.w,
            left: -95.0.w,
            child: Container(
              width: 300.0.w,
              height: 300.0.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
              ),
            ),
          ),
          Positioned(
            top: -288.0.w,
            left: -100.0.w,
            child: Container(
              width: 300.0.w,
              height: 300.0.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).colorScheme.secondary.withOpacity(0.3),
              ),
            ),
          ),
          Positioned(
            top: -292.0.w,
            left: -105.0.w,
            child: Container(
              width: 300.0.w,
              height: 300.0.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
              ),
            ),
          ),
          PositionedDirectional(
            top: 40,
            start: 20,
            child: GestureDetector(
              onTap: () {
                if (_currentStep == 0) {
                  Get.back();
                } else {
                  cancel();
                  pageController.jumpToPage(_currentStep);
                }
              },
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 22.0.sp,
              ),
            ),
          ),
          Positioned.fill(
            top: 40,
            child: Align(
              alignment: AlignmentDirectional.topCenter,
              child: coloredText(
                text: "create_an_account".tr,
                color: Colors.white,
                fontSize: 16.0.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<EasyStep> stepList() => [
        EasyStep(
          customStep: CircleAvatar(
            radius: 12,
            backgroundColor: _currentStep >= 0
                ? Theme.of(context).colorScheme.tertiary
                : Colors.grey,
            child: const CircleAvatar(
              radius: 4,
              backgroundColor: Colors.white,
            ),
          ),
          title: _currentStep == 0 ? "owner_info".tr : "",
        ),
        EasyStep(
          customStep: CircleAvatar(
            radius: 12,
            backgroundColor: _currentStep >= 1
                ? Theme.of(context).colorScheme.tertiary
                : Colors.grey,
            child: const CircleAvatar(
              radius: 4,
              backgroundColor: Colors.white,
            ),
          ),
          title: _currentStep == 1 ? 'company_info'.tr : "",
        ),
        EasyStep(
          customStep: CircleAvatar(
            radius: 12,
            backgroundColor: _currentStep >= 2
                ? Theme.of(context).colorScheme.tertiary
                : Colors.grey,
            child: const CircleAvatar(
              radius: 4,
              backgroundColor: Colors.white,
            ),
          ),
          title: _currentStep == 2 ? 'docs'.tr : "",
        ),
        EasyStep(
          customStep: CircleAvatar(
            radius: 12,
            backgroundColor: _currentStep >= 3
                ? Theme.of(context).colorScheme.tertiary
                : Colors.grey,
            child: const CircleAvatar(
              radius: 4,
              backgroundColor: Colors.white,
            ),
          ),
          title: _currentStep == 3 ? 'security'.tr : "",
        ),
      ];
  List<Widget> get pageList => [
        GetBuilder<GlobalController>(builder: (c) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child:
                ListView(padding: EdgeInsets.zero, primary: false, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  UnderlinedCustomTextField(
                    width: 40.0.w,
                    focusNode: _focusNodes[0],
                    controller: _firstNameController,
                    hintText: "First name",
                    prefixIcon: Icon(
                      EvaIcons.personOutline,
                      size: 20.0.sp,
                    ),
                    autovalidateMode: AutovalidateMode.always,
                    onchanged: (s) {
                      errors['first_name'] = null;
                      setState(() {});
                      companyRegisterData.firstName = s;
                    },
                    validator: (String? value) {
                      if (errors['first_name'] != null) {
                        String tmp = "";
                        tmp = errors['first_name'].join("\n");

                        return tmp;
                      }
                      return null;
                    },
                  ),
                  UnderlinedCustomTextField(
                    width: 40.0.w,
                    focusNode: _focusNodes[1],
                    controller: _lastNameController,
                    hintText: "Last name",
                    prefixIcon: Icon(
                      EvaIcons.personOutline,
                      size: 20.0.sp,
                    ),
                    autovalidateMode: AutovalidateMode.always,
                    onchanged: (s) {
                      errors['last_name'] = null;
                      setState(() {});
                      companyRegisterData.lastName = s;
                    },
                    validator: (String? value) {
                      if (errors['last_name'] != null) {
                        String tmp = "";
                        tmp = errors['last_name'].join("\n");

                        return tmp;
                      }
                      return null;
                    },
                  )
                ],
              ),
              spaceY(10.0.sp),
              UnderlinedCustomTextField(
                focusNode: _focusNodes[2],
                controller: _ownerPhoneNumberController,
                keyBoardType: TextInputType.number,
                autovalidateMode: AutovalidateMode.always,
                onchanged: (s) {
                  errors['phone'] = null;
                  setState(() {});
                  companyRegisterData.phone = s;
                },
                validator: (String? value) {
                  if (errors['phone'] != null) {
                    String tmp = "";
                    tmp = errors['phone'].join("\n");

                    return tmp;
                  }
                  return null;
                },
                prefixIcon: Container(
                  margin: const EdgeInsetsDirectional.only(start: 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        EvaIcons.phoneOutline,
                        size: 20.0.sp,
                      ),
                      CustomDropDownMenuButton(
                        width: 100,
                        hintPadding: 5,
                        hintSize: 14,
                        value: ownerphoneCode == "" ? null : ownerphoneCode,
                        items: c.countries
                            .map((e) => DropdownMenuItem<String>(
                                  value: e.code!,
                                  child: coloredText(
                                    text: e.code!,
                                    fontSize: 17,
                                  ),
                                ))
                            .toList(),
                        onChanged: (p0) {
                          ownerphoneCode = p0!;
                        },
                      ),
                    ],
                  ),
                ),
                hintText: "phone_number".tr,
              ),
              spaceY(10.0.sp),
              CustomDropDownMenuButton(
                hintPadding: 0, focusNode: _focusNodes[3],
                hint: "Nationality",
                autovalidateMode: AutovalidateMode.always,
                validator: (String? value) {
                  if (errors['nationality_id'] != null) {
                    String tmp = "";
                    tmp = errors['nationality_id'].join("\n");

                    return tmp;
                  }
                  return null;
                },
                width: 100.w,
                value: ownerNationality == "" ? null : ownerNationality,
                items: c.countries
                    .map(
                      (e) => DropdownMenuItem<String>(
                        value: e.nameEn,
                        child:
                            coloredText(text: e.nameEn!, color: Colors.black),
                      ),
                    )
                    .toList(),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: _focusNodes[4].hasFocus
                        ? Theme.of(context).colorScheme.secondary
                        : const Color(0xffBDC1C8),
                  ),
                ),
                onChanged: (p0) {
                  ownerNationality = p0!;
                  errors['nationality_id'] = null;
                  setState(() {});
                  companyRegisterData.nationalityId = c.countries
                      .where((element) =>
                          element.nameEn == p0 || element.nameAr == p0)
                      .first
                      .id
                      .toString();
                  ;
                },

                prefixIcon: Icon(
                  EvaIcons.globe2Outline,
                  size: 20.0.sp,
                ),
                // borderc: Border.all(color: const Color(0xffE3E3E3)),
                borderRadius: BorderRadius.circular(8),
                // padding:
                //     const EdgeInsetsDirectional.symmetric(horizontal: 10),
              ),
              // UnderlinedCustomTextField(
              //   focusNode: _focusNodes[3],
              //   keyBoardType: TextInputType.text,
              //   controller: _nationallityController,
              //   readOnly: true,
              //   prefixIcon: Icon(
              //     EvaIcons.globe2Outline,
              //     size: 20.0.sp,
              //   ),
              //   hintText: "nationality".tr,
              // ),

              spaceY(10.0.sp),
              UnderlinedCustomTextField(
                focusNode: _focusNodes[4],
                controller: _idNumController,
                keyBoardType: TextInputType.number,
                prefixIcon: Icon(FontAwesomeIcons.idCard, size: 16.0.sp),
                hintText: "ID number".tr,
                autovalidateMode: AutovalidateMode.always,
                onchanged: (s) {
                  errors['id_number'] = null;
                  setState(() {});
                  companyRegisterData.idNumber = s;
                },
                validator: (String? value) {
                  if (errors['id_number'] != null) {
                    String tmp = "";
                    tmp = errors['id_number'].join("\n");

                    return tmp;
                  }
                  return null;
                },
              ),
              spaceY(10.0.sp),
              Row(
                children: [
                  coloredText(
                    text: "Date of birth:",
                  ),
                  spaceX(10),
                  SizedBox(
                    width: 40.0.w,
                    child: Theme(
                      data: ThemeData(
                        colorScheme: ColorScheme.fromSeed(
                          seedColor: AppThemes.colorCustom,
                        ),
                      ),
                      child: Form(
                        onChanged: () => setState(() {
                          errors['date_of_birth'] = null;
                        }),
                        child: TextfieldDatePicker(
                          textAlign: TextAlign.center,
                          focusNode: _focusNodes[5],
                          autovalidateMode: AutovalidateMode.always,
                          validator: (String? value) {
                            if (errors['date_of_birth'] != null) {
                              String tmp = "";
                              tmp = errors['date_of_birth'].join("\n");

                              return tmp;
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText:
                                DateFormat('y/MM/dd').format(DateTime.now()),
                            contentPadding: const EdgeInsets.all(10),
                            iconColor: Colors.red,
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xffBDC1C8),
                                width: 2.0,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: _focusNodes[5].hasFocus
                                    ? Theme.of(context).colorScheme.secondary
                                    : const Color(0xffBDC1C8),
                                width: 2.0,
                              ),
                            ),
                            errorBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red,
                                width: 2.0,
                              ),
                            ),
                          ),
                          cupertinoDatePickerBackgroundColor: Colors.white,
                          cupertinoDatePickerMaximumDate: DateTime.now()
                              .add(const Duration(days: 365 * 40)),
                          cupertinoDatePickerMaximumYear: 2099,
                          cupertinoDatePickerMinimumYear: 1900,
                          cupertinoDatePickerMinimumDate: DateTime.now()
                              .subtract(const Duration(days: 365 * 100)),
                          cupertinoDateInitialDateTime: DateTime.now(),
                          materialDatePickerFirstDate: DateTime.now()
                              .subtract(const Duration(days: 365 * 100)),
                          materialDatePickerInitialDate: DateTime.now(),
                          materialDatePickerLastDate: DateTime.now()
                              .add(const Duration(days: 365 * 40)),
                          preferredDateFormat: DateFormat('y/MM/dd'),
                          textfieldDatePickerController: _dateController,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              spaceY(20.0.sp),
              primaryButton(
                onTap: () {
                  if (_currentStep < stepList().length - 1) {
                    setState(() => _currentStep += 1);
                    pageController.jumpToPage(_currentStep);
                  }
                },
                text: coloredText(
                  text: "Next",
                  color: Colors.white,
                  fontSize: 16.0.sp,
                ),
                height: 50,
                width: 45.0.w,
                radius: 30,
                color: Theme.of(context).colorScheme.primary,
              ),
              spaceY(20.0.sp),
            ]),
          );
        }),
        GetBuilder<GlobalController>(builder: (c) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child:
                ListView(padding: EdgeInsets.zero, primary: false, children: [
              db.DottedBorder(
                dashPattern: const [6, 6, 6, 6],
                padding: const EdgeInsets.all(1),
                radius: const Radius.circular(10),
                color: const Color(0xffDBDBDB),
                borderType: db.BorderType.RRect,
                child: primaryButton(
                    color: const Color(0xffF5F5F5),
                    width: 100.0.w,
                    height: 55,
                    radius: 10,
                    onTap: () async {
                      final result = await FilePicker.platform.pickFiles(
                        allowMultiple: false,
                        type: FileType.image,
                      );
                      if (result != null) {
                        logobuttonText = result.files[0].name
                            .substring(0, min(15, result.files[0].name.length));
                        companyRegisterData.companyLogo = result.files[0];
                        setState(() {});
                      }
                    },
                    text: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          EvaIcons.upload,
                          color: const Color(0xff919191),
                          size: 18.0.sp,
                        ),
                        spaceX(10),
                        coloredText(
                          text: logobuttonText,
                          color: const Color(0xff919191),
                          fontSize: 13.0.sp,
                        ),
                      ],
                    )),
              ),
              spaceY(10.0.sp),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 28.0.w,
                    height: 1,
                    color: Colors.grey,
                  ),
                  coloredText(
                      text: "General info",
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 14.0.sp,
                      fontWeight: FontWeight.w500),
                  Container(
                    width: 28.0.w,
                    height: 1,
                    color: Colors.grey,
                  )
                ],
              ),
              spaceY(10.0.sp),
              UnderlinedCustomTextField(
                focusNode: _focusNodes[6],
                controller: _companyNameEnController,
                keyBoardType: TextInputType.text,
                prefixIcon: Icon(Iconsax.buildings, size: 20.0.sp),
                hintText: "Company Name",
                autovalidateMode: AutovalidateMode.always,
                onchanged: (s) {
                  errors['company_name'] = null;
                  setState(() {});
                  companyRegisterData.companyName = s;
                },
                validator: (String? value) {
                  if (errors['company_name'] != null) {
                    String tmp = "";
                    tmp = errors['company_name'].join("\n");

                    return tmp;
                  }
                  return null;
                },
              ),
              // spaceY(10.0.sp),
              // UnderlinedCustomTextField(
              //   focusNode: _focusNodes[7],
              //   controller: _companyNameArController,
              //   keyBoardType: TextInputType.text,
              //   prefixIcon: Icon(Iconsax.buildings, size: 20.0.sp),
              //   hintText: "Company Name Ar",
              //   autovalidateMode: AutovalidateMode.always,
              //   onchanged: (s) {
              //     errors['company_name'] = null;
              //     setState(() {});
              //     companyRegisterData.companyName = s;
              //   },
              //   validator: (String? value) {
              //     if (errors['company_name'] != null) {
              //       String tmp = "";
              //       tmp = errors['company_name'].join("\n");

              //       return tmp;
              //     }
              //     return null;
              //   },
              // ),
              spaceY(10.0.sp),
              UnderlinedCustomTextField(
                focusNode: _focusNodes[8],
                controller: _companyPhoneNumberController,
                keyBoardType: TextInputType.number,
                autovalidateMode: AutovalidateMode.always,
                onchanged: (s) {
                  errors['company_phone'] = null;
                  setState(() {});
                  companyRegisterData.companyPhone = s;
                },
                validator: (String? value) {
                  if (errors['company_phone'] != null) {
                    String tmp = "";
                    tmp = errors['company_phone'].join("\n");

                    return tmp;
                  }
                  return null;
                },
                prefixIcon: Container(
                  margin: const EdgeInsetsDirectional.only(start: 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        EvaIcons.phoneOutline,
                        size: 20.0.sp,
                      ),
                      CustomDropDownMenuButton(
                        width: 100,
                        hintPadding: 5,
                        hintSize: 13,
                        value: companyphoneCode == "" ? null : companyphoneCode,
                        items: c.countries
                            .map((e) => DropdownMenuItem<String>(
                                  value: e.code!,
                                  child: coloredText(
                                    text: e.code!,
                                    fontSize: 17,
                                  ),
                                ))
                            .toList(),
                        onChanged: (p0) {
                          companyphoneCode = p0!;
                        },
                      ),
                    ],
                  ),
                ),
                hintText: "phone_number".tr,
              ),
              spaceY(10.0.sp),
              UnderlinedCustomTextField(
                focusNode: _focusNodes[9],
                controller: _emailController,
                keyBoardType: TextInputType.emailAddress,
                prefixIcon: Icon(FontAwesomeIcons.envelope, size: 16.0.sp),
                hintText: "email".tr,
                autovalidateMode: AutovalidateMode.always,
                onchanged: (s) {
                  errors['company_email'] = null;
                  setState(() {});
                  companyRegisterData.companyEmail = s;
                },
                validator: (String? value) {
                  if (errors['company_email'] != null) {
                    String tmp = "";
                    tmp = errors['company_email'].join("\n");

                    return tmp;
                  }
                  return null;
                },
              ),
              spaceY(10.0.sp),
              UnderlinedCustomTextField(
                focusNode: _focusNodes[10],
                controller: _urlController,
                keyBoardType: TextInputType.url,
                prefixIcon: Icon(Iconsax.link_21, size: 20.0.sp),
                hintText: "URL (optional)".tr,
                autovalidateMode: AutovalidateMode.always,
                onchanged: (s) {
                  errors['url'] = null;
                  setState(() {});
                  companyRegisterData.url = s;
                },
                validator: (String? value) {
                  if (errors['url'] != null) {
                    String tmp = "";
                    tmp = errors['url'].join("\n");

                    return tmp;
                  }
                  return null;
                },
              ),
              spaceY(10.0.sp),
              Row(
                children: [
                  coloredText(
                    text: "Company Type:",
                  ),
                  spaceX(15),
                  CustomDropDownMenuButton(
                    fillColor: const Color(0xffF5F5F5),
                    padding:
                        const EdgeInsetsDirectional.only(end: 10, start: 10),
                    // hintPadding: 5,
                    width: 42.0.w,
                    height: 38.sp,
                    borderRadius: BorderRadius.circular(10),
                    value: companyType == "" ? null : companyType,
                    items: ["recruitment", "cleaning"]
                        .map(
                          (e) => DropdownMenuItem<String>(
                            value: e,
                            child: coloredText(text: e),
                          ),
                        )
                        .toList(),
                    onChanged: (p0) {
                      companyType = p0!;
                      companyRegisterData.companyType = p0;
                    },
                  ),
                ],
              ),
              spaceY(20.0.sp),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 28.0.w,
                    height: 1,
                    color: Colors.grey,
                  ),
                  coloredText(
                      text: "Address Info",
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 14.0.sp,
                      fontWeight: FontWeight.w500),
                  Container(
                    width: 28.0.w,
                    height: 1,
                    color: Colors.grey,
                  )
                ],
              ),
              spaceY(10.0.sp),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomDropDownMenuButton(
                    hintPadding: 10,
                    hint: "city".tr,
                    border: const UnderlineInputBorder(),
                    width: 40.0.w,
                    value: city == "" ? null : city,
                    items: c.cities
                        .map((e) => DropdownMenuItem<String>(
                              value: e.nameEn,
                              child: coloredText(
                                text: e.nameEn!,
                                fontSize: 17,
                              ),
                            ))
                        .toList(),
                    autovalidateMode: AutovalidateMode.always,
                    validator: (String? value) {
                      if (errors['city_id'] != null) {
                        String tmp = "";
                        tmp = errors['city_id'].join("\n");

                        return tmp;
                      }
                      return null;
                    },
                    onChanged: (p0) {
                      city = p0!;
                      errors["city_id"] = null;
                      setState(() {});
                      companyRegisterData.cityId = c.cities
                          .where((element) =>
                              element.nameEn == p0 || element.nameAr == p0)
                          .first
                          .id
                          .toString();
                    },
                  ),
                  CustomDropDownMenuButton(
                    hint: "region".tr,
                    border: const UnderlineInputBorder(),
                    width: 40.0.w,
                    value: region == "" ? null : region,
                    items: c.regions
                        .map((e) => DropdownMenuItem<String>(
                              value: e.nameEn,
                              child: coloredText(
                                text: e.nameEn!,
                                fontSize: 17,
                              ),
                            ))
                        .toList(),
                    autovalidateMode: AutovalidateMode.always,
                    validator: (String? value) {
                      if (errors['region_id'] != null) {
                        String tmp = "";
                        tmp = errors['region_id'].join("\n");

                        return tmp;
                      }
                      return null;
                    },
                    onChanged: (p0) {
                      region = p0!;
                      errors["region_id"] = null;
                      setState(() {});
                      companyRegisterData.regionId = c.regions
                          .where((element) =>
                              element.nameEn == p0 || element.nameAr == p0)
                          .first
                          .id
                          .toString();
                      ;
                    },
                  ),
                ],
              ),
              spaceY(10.0.sp),
              UnderlinedCustomTextField(
                focusNode: _focusNodes[11],
                controller: _pieceNumberController,
                keyBoardType: TextInputType.number,
                // prefixIcon: const Icon(Icons.email_outlined),
                hintText: "piece_num".tr,
                autovalidateMode: AutovalidateMode.always,
                onchanged: (s) {
                  errors['piece_number'] = null;
                  setState(() {});
                  companyRegisterData.pieceNumber = s;
                },
                validator: (String? value) {
                  if (errors['piece_number'] != null) {
                    String tmp = "";
                    tmp = errors['piece_number'].join("\n");

                    return tmp;
                  }
                  return null;
                },
              ),
              spaceY(10.0.sp),
              UnderlinedCustomTextField(
                focusNode: _focusNodes[12],
                controller: _streetController,
                keyBoardType: TextInputType.text,
                // prefixIcon: const Icon(Icons.email_outlined),
                hintText: "street".tr,
                autovalidateMode: AutovalidateMode.always,
                onchanged: (s) {
                  errors['street'] = null;
                  setState(() {});
                  companyRegisterData.street = s;
                },
                validator: (String? value) {
                  if (errors['street'] != null) {
                    String tmp = "";
                    tmp = errors['street'].join("\n");

                    return tmp;
                  }
                  return null;
                },
              ),
              spaceY(10.0.sp),
              UnderlinedCustomTextField(
                focusNode: _focusNodes[13],
                controller: _buildingController,
                keyBoardType: TextInputType.text,
                // prefixIcon: const Icon(Icons.email_outlined),
                hintText: "building".tr,
                autovalidateMode: AutovalidateMode.always,
                onchanged: (s) {
                  errors['building'] = null;
                  setState(() {});
                  companyRegisterData.building = s;
                },
                validator: (String? value) {
                  if (errors['building'] != null) {
                    String tmp = "";
                    tmp = errors['building'].join("\n");

                    return tmp;
                  }
                  return null;
                },
              ),
              spaceY(10.0.sp),
              UnderlinedCustomTextField(
                focusNode: _focusNodes[14],
                controller: _adnController,
                keyBoardType: TextInputType.number,
                // prefixIcon: const Icon(Icons.email_outlined),
                hintText: "adn".tr, autovalidateMode: AutovalidateMode.always,
                onchanged: (s) {
                  errors['automated_address_number'] = null;
                  setState(() {});
                  companyRegisterData.automatedAddressNumber = s;
                },
                validator: (String? value) {
                  if (errors['automated_address_number'] != null) {
                    String tmp = "";
                    tmp = errors['automated_address_number'].join("\n");

                    return tmp;
                  }
                  return null;
                },
              ),
              spaceY(20.0.sp),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 28.0.w,
                    height: 1,
                    color: Colors.grey,
                  ),
                  coloredText(
                      text: "Work Info",
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 14.0.sp,
                      fontWeight: FontWeight.w500),
                  Container(
                    width: 28.0.w,
                    height: 1,
                    color: Colors.grey,
                  )
                ],
              ),
              spaceY(10.0.sp),
              UnderlinedCustomTextField(
                focusNode: _focusNodes[15],
                controller: _crnController,
                keyBoardType: TextInputType.number,
                // prefixIcon: const Icon(Icons.email_outlined),
                hintText: "Commercial registration number",
                autovalidateMode: AutovalidateMode.always,
                onchanged: (s) {
                  errors['commercial_registration_number'] = null;
                  setState(() {});
                  companyRegisterData.commercialRegistrationNumber = s;
                },
                validator: (String? value) {
                  if (errors['commercial_registration_number'] != null) {
                    String tmp = "";
                    tmp = errors['commercial_registration_number'].join("\n");

                    return tmp;
                  }
                  return null;
                },
              ),
              spaceY(10.0.sp),
              UnderlinedCustomTextField(
                focusNode: _focusNodes[16],
                controller: _taxController,
                keyBoardType: TextInputType.number,
                // prefixIcon: const Icon(Icons.email_outlined),
                hintText: "Tax number",
                autovalidateMode: AutovalidateMode.always,
                onchanged: (s) {
                  errors['tax_number'] = null;
                  setState(() {});
                  companyRegisterData.taxNumber = s;
                },
                validator: (String? value) {
                  if (errors['tax_number'] != null) {
                    String tmp = "";
                    tmp = errors['tax_number'].join("\n");

                    return tmp;
                  }
                  return null;
                },
              ),
              spaceY(10.0.sp),
              UnderlinedCustomTextField(
                focusNode: _focusNodes[17],
                controller: _licenseController,
                keyBoardType: TextInputType.number,
                // prefixIcon: const Icon(Icons.email_outlined),
                hintText: "license number",
                autovalidateMode: AutovalidateMode.always,
                onchanged: (s) {
                  errors['license_number'] = null;
                  setState(() {});
                  companyRegisterData.licenseNumber = s;
                },
                validator: (String? value) {
                  if (errors['license_number'] != null) {
                    String tmp = "";
                    tmp = errors['license_number'].join("\n");

                    return tmp;
                  }
                  return null;
                },
              ),
              spaceY(20.0.sp),
              primaryButton(
                onTap: () {
                  if (_currentStep < stepList().length - 1) {
                    setState(() => _currentStep += 1);
                    pageController.jumpToPage(_currentStep);
                  }
                  logSuccess(_currentStep);
                },
                text: coloredText(
                  text: "Next",
                  color: Colors.white,
                  fontSize: 16.0.sp,
                ),
                height: 50,
                width: 45.0.w,
                radius: 30,
                color: Theme.of(context).colorScheme.primary,
              ),
              spaceY(20.0.sp),
            ]),
          );
        }),
        GetBuilder<GlobalController>(builder: (c) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: ListView(
              padding: EdgeInsets.zero,
              primary: false,
              children: [
                coloredText(
                  text: "Identity confirmation by",
                ),
                Row(
                  children: [
                    MyRadioButton(
                      color: Colors.black,
                      text: "ID",
                      groupValue: idPassRadio,
                      value: 0,
                      onChanged: (p0) {
                        setState(() {
                          companyRegisterData.identityConfirmation = "id";

                          passportButton = "Upload your passport";
                          idPassRadio = 0;
                          companyRegisterData.passportImage = null;
                          setState(() {});
                        });
                      },
                    ),
                    spaceX(20),
                    MyRadioButton(
                      color: Colors.black,
                      text: "Passport",
                      groupValue: idPassRadio,
                      value: 1,
                      onChanged: (p0) {
                        setState(() {
                          companyRegisterData.identityConfirmation = "passport";
                          idPassRadio = 1;
                          companyRegisterData.frontSideIdImage = null;
                          companyRegisterData.backSideIdImage = null;
                          frontIdButton = "Upload front side of ID";
                          backIdButton = "Upload back side of ID";
                          setState(() {});
                        });
                      },
                    )
                  ],
                ),
                spaceY(20),
                idPassRadio == 0
                    ? Container()
                    : primaryButton(
                        onTap: () async {
                          final result = await FilePicker.platform.pickFiles(
                            allowMultiple: false,
                            type: FileType.image,
                          );
                          if (result != null) {
                            passportButton = result.files[0].name.substring(
                                0, min(15, result.files[0].name.length));
                            companyRegisterData.passportImage = result.files[0];
                            setState(() {});
                          }
                        },
                        color: const Color(0xffF5F5F5),
                        width: 100.0.w,
                        height: 55,
                        radius: 10,
                        text: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                spaceX(10),
                                Icon(
                                  LineIcons.passport,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  size: 18.0.sp,
                                ),
                                spaceX(10),
                                coloredText(
                                  text: passportButton,
                                  color: const Color(0xff919191),
                                  fontSize: 13.0.sp,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.arrow_forward,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  size: 20.0.sp,
                                ),
                                spaceX(10),
                              ],
                            ),
                          ],
                        )),
                idPassRadio == 1
                    ? Container()
                    : primaryButton(
                        onTap: () async {
                          final result = await FilePicker.platform.pickFiles(
                            allowMultiple: false,
                            type: FileType.image,
                          );
                          if (result != null) {
                            frontIdButton = result.files[0].name.substring(
                                0, min(15, result.files[0].name.length));
                            companyRegisterData.frontSideIdImage =
                                result.files[0];
                            setState(() {});
                          }
                        },
                        color: const Color(0xffF5F5F5),
                        width: 100.0.w,
                        height: 55,
                        radius: 10,
                        text: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                spaceX(10),
                                Icon(
                                  LineIcons.identificationCard,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  size: 18.0.sp,
                                ),
                                spaceX(10),
                                coloredText(
                                  text: frontIdButton,
                                  color: const Color(0xff919191),
                                  fontSize: 13.0.sp,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.arrow_forward,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  size: 20.0.sp,
                                ),
                                spaceX(10),
                              ],
                            ),
                          ],
                        )),
                idPassRadio == 1 ? Container() : spaceY(10),
                idPassRadio == 1
                    ? Container()
                    : primaryButton(
                        onTap: () async {
                          final result = await FilePicker.platform.pickFiles(
                            allowMultiple: false,
                            type: FileType.image,
                          );
                          if (result != null) {
                            backIdButton = result.files[0].name.substring(
                                0, min(15, result.files[0].name.length));
                            companyRegisterData.backSideIdImage =
                                result.files[0];
                            setState(() {});
                          }
                        },
                        color: const Color(0xffF5F5F5),
                        width: 100.0.w,
                        height: 55,
                        radius: 10,
                        text: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                spaceX(10),
                                Icon(
                                  LineIcons.identificationCard,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  size: 18.0.sp,
                                ),
                                spaceX(10),
                                coloredText(
                                  text: backIdButton,
                                  color: const Color(0xff919191),
                                  fontSize: 13.0.sp,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.arrow_forward,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  size: 20.0.sp,
                                ),
                                spaceX(10),
                              ],
                            ),
                          ],
                        )),
                spaceY(20),
                primaryButton(
                  onTap: () {
                    if (_currentStep < stepList().length - 1) {
                      setState(() => _currentStep += 1);
                      pageController.jumpToPage(_currentStep);
                    }

                    logSuccess(_currentStep);
                    setState(() {});
                  },
                  text: coloredText(
                    text: "Next",
                    color: Colors.white,
                    fontSize: 16.0.sp,
                  ),
                  height: 50,
                  width: 45.0.w,
                  radius: 30,
                  color: Theme.of(context).colorScheme.primary,
                ),
                spaceY(20),
              ],
            ),
          );
        }),
        GetBuilder<GlobalController>(builder: (c) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child:
                ListView(padding: EdgeInsets.zero, primary: false, children: [
              UnderlinedCustomTextField(
                prefixIcon: Icon(
                  EvaIcons.lockOutline,
                  color: _focusNodes[18].hasFocus
                      ? Theme.of(context).colorScheme.secondary
                      : Colors.grey,
                ),
                focusNode: _focusNodes[18],
                controller: _passwordController,
                keyBoardType: TextInputType.visiblePassword,
                suffixIcon: IconButton(
                    icon: Icon(
                      EvaIcons.eyeOutline,
                      color: _focusNodes[18].hasFocus
                          ? Theme.of(context).colorScheme.secondary
                          : Colors.grey,
                      size: 20.0.sp,
                    ),
                    onPressed: toggleObsecure),
                hintText: "password".tr,
                obsecureText: _obsecureflag,
                autovalidateMode: AutovalidateMode.always,
                onchanged: (s) {
                  errors['password'] = null;
                  setState(() {});
                  companyRegisterData.password = s;
                },
                validator: (String? value) {
                  if (errors['password'] != null) {
                    String tmp = "";
                    tmp = errors['password'].join("\n");

                    return tmp;
                  }
                  return null;
                },
              ),
              spaceY(10.0.sp),
              UnderlinedCustomTextField(
                prefixIcon: Icon(
                  EvaIcons.lockOutline,
                  color: _focusNodes[19].hasFocus
                      ? Theme.of(context).colorScheme.secondary
                      : Colors.grey,
                ),
                focusNode: _focusNodes[19],
                controller: _passwordConfirmController,
                keyBoardType: TextInputType.visiblePassword,
                suffixIcon: IconButton(
                    icon: Icon(
                      EvaIcons.eyeOutline,
                      color: _focusNodes[19].hasFocus
                          ? Theme.of(context).colorScheme.secondary
                          : Colors.grey,
                      size: 20.0.sp,
                    ),
                    onPressed: toggleObsecure2),
                hintText: "password_confirm".tr,
                obsecureText: _obsecureflag2,
                autovalidateMode: AutovalidateMode.always,
                onchanged: (s) {
                  errors['password'] = null;
                  setState(() {});
                  companyRegisterData.passwordConfirmation = s;
                },
                validator: (s) {
                  if (s!.isEmpty) {
                    return null;
                  } else if (_passwordController.text != s) {
                    return "don't match password";
                  }
                  return null;
                },
              ),
              spaceY(20.0.sp),
              primaryButton(
                onTap: () async {
                  // Get.offAll(() => const CompanyHomePage());
                  companyRegisterData.dateOfBirth = _dateController.text;
                  var x = await await _authController.companyRegister(
                      companyRegisterData: companyRegisterData);
                  if (x == true) {
                    // ignore: use_build_context_synchronously
                    Utils.customDialog(
                        actions: [
                          primaryButton(
                            onTap: () {
                              Get.back();
                              Get.to(
                                () => OTPPage(
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                  userType: widget.userType,
                                ),
                                transition: Transition.rightToLeft,
                              );
                            },
                            width: 40.0.w,
                            height: 50,
                            radius: 10.w,
                            color: Theme.of(context).colorScheme.primary,
                            text: coloredText(
                              text: "ok".tr,
                              color: Colors.white,
                            ),
                          ),
                        ],
                        context: context,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              spaceY(20),
                              Icon(
                                EvaIcons.checkmarkCircle,
                                color: Theme.of(context).colorScheme.secondary,
                                size: 40.sp,
                              ),
                              spaceY(20),
                              coloredText(
                                  text: "You have been registered",
                                  fontSize: 12.0.sp),
                              coloredText(
                                text: "successfully",
                                fontSize: 14.0.sp,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ],
                          ),
                        ));
                  } else if (x['message'] == "The given data was invalid.") {
                    errors = x['errors'];
                    if (errors['first_name'] != null ||
                        errors['last_name'] != null ||
                        errors['phone'] != null ||
                        errors['nationality_id'] != null ||
                        errors['id_number'] != null ||
                        errors['date_of_birth'] != null) {
                      _currentStep = 0;
                      setState(() {});
                      pageController.jumpToPage(_currentStep);
                    } else if (errors['company_name'] != null ||
                        errors['url'] != null ||
                        errors['company_phone'] != null ||
                        errors['company_type'] != null ||
                        errors['company_email'] != null ||
                        errors['city_id'] != null ||
                        errors['region_id'] != null ||
                        errors['piece_number'] != null ||
                        errors['street'] != null ||
                        errors['building'] != null ||
                        errors['automated_address_number'] != null ||
                        errors['commercial_registration_number'] != null ||
                        errors['tax_number'] != null ||
                        errors['license_number'] != null ||
                        errors['company_logo'] != null) {
                      _currentStep = 1;
                      setState(() {});
                      pageController.jumpToPage(_currentStep);
                      String tmp = "";
                      if (errors['company_logo'] != null &&
                          errors['company_type'] != null) {
                        tmp = errors['company_logo'].join("\n") +
                            "\n" +
                            errors['company_type'].join("\n");
                        Utils.showSnackBar(message: tmp, fontSize: 12.0.sp);
                      } else if (errors['company_logo'] != null) {
                        tmp = errors['company_logo'].join("\n");
                        Utils.showSnackBar(message: tmp, fontSize: 12.0.sp);
                      } else if (errors['company_type'] != null) {
                        tmp = errors['company_type'].join("\n");
                        Utils.showSnackBar(message: tmp, fontSize: 12.0.sp);
                      }
                    } else if (errors['front_side_id_image'] != null ||
                        errors['back_side_id_image'] != null ||
                        errors['passport_image'] != null) {
                      _currentStep = 2;
                      setState(() {});
                      pageController.jumpToPage(_currentStep);
                      String tmp = "";
                      if (errors['passport_image'] != null) {
                        tmp = errors['passport_image'].join("\n");
                        Utils.showSnackBar(message: tmp, fontSize: 12.0.sp);
                      } else if (errors['front_side_id_image'] != null) {
                        tmp = errors['front_side_id_image'].join("\n");
                        Utils.showSnackBar(message: tmp, fontSize: 12.0.sp);
                      } else if (errors['back_side_id_image'] != null) {
                        tmp = errors['back_side_id_image'].join("\n");
                        Utils.showSnackBar(message: tmp, fontSize: 12.0.sp);
                      } else if (errors['front_side_id_image'] != null &&
                          errors['back_side_id_image'] != null) {
                        tmp = errors['front_side_id_image'].join("\n") +
                            "\n" +
                            errors['back_side_id_image'].join("\n");
                        Utils.showSnackBar(message: tmp, fontSize: 12.0.sp);
                      }
                    } else if (errors['password'] != null) {
                      _currentStep = 3;
                      setState(() {});
                      pageController.jumpToPage(_currentStep);
                    }
                  }
                },
                text: coloredText(
                  text: "submit".tr,
                  color: Colors.white,
                  fontSize: 16.0.sp,
                ),
                height: 50,
                width: 45.0.w,
                radius: 30,
                color: Theme.of(context).colorScheme.primary,
              ),
              spaceY(20.0.sp),
            ]),
          );
        }),
      ];
}
