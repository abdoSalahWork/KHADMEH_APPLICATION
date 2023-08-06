import 'package:dotted_border/dotted_border.dart' as db;
import 'package:easy_stepper/easy_stepper.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:line_icons/line_icons.dart';
import 'package:sizer/sizer.dart';
import 'package:textfield_datepicker/textfield_datepicker.dart';

import '../../../Themes/themes.dart';
import '../../../Utils/utils.dart';
import '../../../widgets/dropdown_menu_button.dart';
import '../../../widgets/radio_button.dart';
import '../../../widgets/underline_text_field.dart';
import '../../HomePage/company_home_page.dart';

class CompanyRegisterPage extends StatefulWidget {
  const CompanyRegisterPage({super.key});

  @override
  State<CompanyRegisterPage> createState() => _CompanyRegisterPageState();
}

class _CompanyRegisterPageState extends State<CompanyRegisterPage> {
  int _currentStep = 0;
  tapped(int step) {
    setState(() => _currentStep = step);
  }

  cancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  }

  PageController pageController = PageController(initialPage: 0);
  int idPassRadio = 0;
  final formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _urlController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _companyNameEnController =
      TextEditingController();
  final TextEditingController _companyNameArController =
      TextEditingController();
  final TextEditingController _ownerPhoneNumberController =
      TextEditingController();
  final TextEditingController _companyPhoneNumberController =
      TextEditingController();
  final TextEditingController _nationallityController = TextEditingController();
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
  bool _obsecureflag = false;
  bool _obsecureflag2 = false;
  void toggleObsecure() {
    _obsecureflag = !_obsecureflag;
    setState(() {});
  }

  void toggleObsecure2() {
    _obsecureflag2 = !_obsecureflag2;
    setState(() {});
  }

  final List<FocusNode> _focusNodes = List.generate(20, (index) => FocusNode());
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
                    child: Form(
                      child: PageView(
                        controller: pageController,
                        physics: const NeverScrollableScrollPhysics(),
                        children: pageList,
                      ),
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

  // List<MyStep> stepList(double h, double w) => [
  //       MyStep(
  //           label: myLabel(0, "personal_info".tr),
  //           content: SizedBox(
  //             height: h < 600 ? 43.0.h : 50.0.h,
  //             child: ListView(
  //                 padding: const EdgeInsets.symmetric(horizontal: 20),
  //                 primary: false,
  //                 physics: const NeverScrollableScrollPhysics(),
  //                 children: [
  //                   UnderlinedCustomTextField(
  //                       focusNode: _focusNodes[0],
  //                       autovalidateMode: AutovalidateMode.onUserInteraction,
  //                       controller: _nameController,
  //                       keyBoardType: TextInputType.text,
  //                       prefixIcon: Icon(
  //                         FontAwesomeIcons.user,
  //                         size: 16.0.sp,
  //                       ),
  //                       hintText: "name".tr,
  //                       validator: (String? value) {
  //                         if (value!.isEmpty) {
  //                           return "required".tr;
  //                         }
  //                         return null;
  //                       }),
  //                   spaceY(10.0.sp),
  //                   UnderlinedCustomTextField(
  //                     focusNode: _focusNodes[1],
  //                     controller: _emailController,
  //                     keyBoardType: TextInputType.emailAddress,
  //                     prefixIcon: Icon(
  //                       FontAwesomeIcons.envelope,
  //                       size: 16.0.sp,
  //                     ),
  //                     hintText: "email".tr,
  //                     validator: (String? value) =>
  //                         EmailValidator.validate(value!)
  //                             ? null
  //                             : "please_enter_a_valid_email".tr,
  //                   ),
  //                   spaceY(10.0.sp),
  //                   UnderlinedCustomTextField(
  //                     focusNode: _focusNodes[2],
  //                     controller: _ownerPhoneNumberController,
  //                     keyBoardType: TextInputType.number,
  //                     prefixIcon: Container(
  //                       margin: EdgeInsetsDirectional.only(start: 10),
  //                       child: Row(
  //                         mainAxisSize: MainAxisSize.min,
  //                         children: [
  //                           Icon(
  //                             EvaIcons.phoneOutline,
  //                             size: 20.0.sp,
  //                           ),
  //                           CustomDropDownMenuButton(
  //                             width: 100,
  //                             hintPadding: 13,
  //                             items: [
  //                               "+963",
  //                               "+954",
  //                               "+94",
  //                             ]
  //                                 .map((e) => DropdownMenuItem<String>(
  //                                       value: e,
  //                                       child: coloredText(
  //                                         text: e,
  //                                         fontSize: 17,
  //                                       ),
  //                                     ))
  //                                 .toList(),
  //                             onChanged: (p0) {},
  //                           ),
  //                         ],
  //                       ),
  //                     ),
  //                     hintText: "phone_number".tr,
  //                     // validator: (String? value) =>
  //                     //     EmailValidator.validate(value!)
  //                     //         ? null
  //                     //         : "please_enter_a_valid_email".tr,
  //                   ),
  //                   spaceY(10.0.sp),
  //                   UnderlinedCustomTextField(
  //                     focusNode: _focusNodes[3],
  //                     keyBoardType: TextInputType.text,

  //                     controller: _nationallityController,
  //                     readOnly: true,
  //                     prefixIcon: Icon(
  //                       EvaIcons.globe2Outline,
  //                       size: 20.0.sp,
  //                     ),
  //                     hintText: "${"nationality".tr} (${"optional".tr})",
  //                     // validator: (String? value) =>
  //                     //     EmailValidator.validate(value!)
  //                     //         ? null
  //                     //         : "please_enter_a_valid_email".tr,
  //                   ),
  //                   spaceY(10.0.sp),
  //                   UnderlinedCustomTextField(
  //                     focusNode: _focusNodes[4],
  //                     controller: _jobNameController,
  //                     keyBoardType: TextInputType.text,
  //                     prefixIcon: Icon(
  //                       EvaIcons.briefcaseOutline,
  //                       size: 20.0.sp,
  //                     ),
  //                     hintText: "job".tr,
  //                     // validator: (String? value) =>
  //                     //     EmailValidator.validate(value!)
  //                     //         ? null
  //                     //         : "please_enter_a_valid_email".tr,
  //                   ),
  //                 ]),
  //           ),
  //           isActive: _currentStep >= 0,
  //           state: _currentStep >= 0
  //               ? MyStepState.complete
  //               : MyStepState.disabled),
  //       MyStep(
  //           label: myLabel(1, "address_info".tr),
  //           content: SizedBox(
  //             height: h < 600 ? 43.0.h : 50.0.h,
  //             child: ListView(
  //                 padding: const EdgeInsets.symmetric(horizontal: 20),
  //                 primary: false,
  //                 children: [
  //                   Row(
  //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                     children: [
  //                       CustomDropDownMenuButton(
  //                         hint: "city".tr,
  //                         border: const UnderlineInputBorder(),
  //                         width: 40.0.w,
  //                         items: [
  //                           "syria",
  //                           "iraq",
  //                           "Egybt",
  //                         ]
  //                             .map((e) => DropdownMenuItem<String>(
  //                                   value: e,
  //                                   child: coloredText(
  //                                     text: e,
  //                                     fontSize: 17,
  //                                   ),
  //                                 ))
  //                             .toList(),
  //                         onChanged: (p0) {},
  //                       ),
  //                       CustomDropDownMenuButton(
  //                         hint: "region".tr,
  //                         border: const UnderlineInputBorder(),
  //                         width: 40.0.w,
  //                         items: [
  //                           "syria",
  //                           "iraq",
  //                           "Egybt",
  //                         ]
  //                             .map((e) => DropdownMenuItem<String>(
  //                                   value: e,
  //                                   child: coloredText(
  //                                     text: e,
  //                                     fontSize: 17,
  //                                   ),
  //                                 ))
  //                             .toList(),
  //                         onChanged: (p0) {},
  //                       ),
  //                     ],
  //                   ),
  //                   spaceY(10.0.sp),
  //                   UnderlinedCustomTextField(
  //                     focusNode: _focusNodes[5],
  //                     controller: _pieceNumberController,
  //                     keyBoardType: TextInputType.number,
  //                     // prefixIcon: const Icon(Icons.email_outlined),
  //                     hintText: "piece_num".tr,
  //                     // validator: (String? value) =>
  //                     //     EmailValidator.validate(value!)
  //                     //         ? null
  //                     //         : "please_enter_a_valid_email".tr,
  //                   ),
  //                   spaceY(10.0.sp),
  //                   UnderlinedCustomTextField(
  //                     focusNode: _focusNodes[6],
  //                     controller: _streetController,
  //                     keyBoardType: TextInputType.text,
  //                     // prefixIcon: const Icon(Icons.email_outlined),
  //                     hintText: "street".tr,
  //                     // validator: (String? value) =>
  //                     //     EmailValidator.validate(value!)
  //                     //         ? null
  //                     //         : "please_enter_a_valid_email".tr,
  //                   ),
  //                   spaceY(10.0.sp),
  //                   UnderlinedCustomTextField(
  //                     focusNode: _focusNodes[7],
  //                     controller: _buildingController,
  //                     keyBoardType: TextInputType.text,
  //                     // prefixIcon: const Icon(Icons.email_outlined),
  //                     hintText: "building".tr,
  //                     // validator: (String? value) =>
  //                     //     EmailValidator.validate(value!)
  //                     //         ? null
  //                     //         : "please_enter_a_valid_email".tr,
  //                   ),
  //                   spaceY(10.0.sp),
  //                   UnderlinedCustomTextField(
  //                     focusNode: _focusNodes[8],
  //                     controller: _adnController,
  //                     keyBoardType: TextInputType.number,
  //                     // prefixIcon: const Icon(Icons.email_outlined),
  //                     hintText: "adn".tr,
  //                     // validator: (String? value) =>
  //                     //     EmailValidator.validate(value!)
  //                     //         ? null
  //                     //         : "please_enter_a_valid_email".tr,
  //                   ),
  //                 ]),
  //           ),
  //           isActive: _currentStep >= 1,
  //           state: _currentStep >= 1
  //               ? MyStepState.complete
  //               : MyStepState.disabled),
  //       MyStep(
  //           label: myLabel(2, "id_proof".tr),
  //           content: SizedBox(
  //             height: h < 600 ? 43.0.h : 50.0.h,
  //             child: ListView(
  //                 padding: const EdgeInsets.symmetric(horizontal: 20),
  //                 primary: false,
  //                 children: [
  //                   UnderlinedCustomTextField(
  //                     focusNode: _focusNodes[9],
  //                     controller: _idNumController,
  //                     keyBoardType: TextInputType.number,
  //                     // prefixIcon: const Icon(Icons.email_outlined),
  //                     hintText: "id_number".tr,
  //                     // validator: (String? value) =>
  //                     //     EmailValidator.validate(value!)
  //                     //         ? null
  //                     //         : "please_enter_a_valid_email".tr,
  //                   ),
  //                   spaceY(10.0.sp),
  //                   UnderlinedCustomTextField(
  //                     focusNode: _focusNodes[10],
  //                     controller: _refNumController,
  //                     keyBoardType: TextInputType.number,
  //                     // prefixIcon: const Icon(Icons.email_outlined),
  //                     hintText: "ref_number".tr,
  //                     // validator: (String? value) =>
  //                     //     EmailValidator.validate(value!)
  //                     //         ? null
  //                     //         : "please_enter_a_valid_email".tr,
  //                   ),
  //                   spaceY(25.0.sp),
  //                   Align(
  //                     alignment: AlignmentDirectional.centerStart,
  //                     child: Container(
  //                       padding: const EdgeInsets.symmetric(
  //                           horizontal: 20, vertical: 10),
  //                       decoration: BoxDecoration(
  //                         borderRadius: BorderRadius.circular(35),
  //                         color: Theme.of(context)
  //                             .colorScheme
  //                             .secondary
  //                             .withOpacity(0.13),
  //                       ),
  //                       child: Row(
  //                         mainAxisSize: MainAxisSize.min,
  //                         children: [
  //                           Icon(
  //                             FontAwesomeIcons.upload,
  //                             color: Theme.of(context).colorScheme.secondary,
  //                             size: 13.0.sp,
  //                           ),
  //                           spaceX(10.0.sp),
  //                           coloredText(
  //                               text: "upload_id".tr,
  //                               color: Theme.of(context).colorScheme.secondary,
  //                               fontSize: 13.0.sp)
  //                         ],
  //                       ),
  //                     ),
  //                   ),
  //                   spaceY(15.0.sp),
  //                   Align(
  //                     alignment: AlignmentDirectional.centerStart,
  //                     child: Container(
  //                       padding: const EdgeInsets.symmetric(
  //                           horizontal: 20, vertical: 10),
  //                       decoration: BoxDecoration(
  //                         borderRadius: BorderRadius.circular(35),
  //                         color: Theme.of(context)
  //                             .colorScheme
  //                             .secondary
  //                             .withOpacity(0.1),
  //                       ),
  //                       child: Row(
  //                         mainAxisSize: MainAxisSize.min,
  //                         children: [
  //                           Icon(
  //                             FontAwesomeIcons.upload,
  //                             color: Theme.of(context).colorScheme.secondary,
  //                             size: 13.0.sp,
  //                           ),
  //                           spaceX(10.0.sp),
  //                           coloredText(
  //                               text: "upload_personal_photo".tr,
  //                               color: Theme.of(context).colorScheme.secondary,
  //                               fontSize: 13.0.sp)
  //                         ],
  //                       ),
  //                     ),
  //                   )
  //                 ]),
  //           ),
  //           isActive: _currentStep >= 2,
  //           state: _currentStep >= 2
  //               ? MyStepState.complete
  //               : MyStepState.disabled),
  //       MyStep(
  //           label: myLabel(3, "security".tr),
  //           content: SizedBox(
  //             height: h < 600 ? 43.0.h : 50.0.h,
  //             child: ListView(
  //                 padding: const EdgeInsets.symmetric(horizontal: 20),
  //                 primary: false,
  //                 children: [
  //                   UnderlinedCustomTextField(
  //                     focusNode: _focusNodes[11],
  //                     controller: _passwordController,
  //                     keyBoardType: TextInputType.visiblePassword,
  //                     suffixIcon: IconButton(
  //                         icon: Icon(
  //                           EvaIcons.eyeOutline,
  //                           color: _focusNodes[11].hasFocus
  //                               ? Theme.of(context).colorScheme.secondary
  //                               : Colors.grey,
  //                           size: 20.0.sp,
  //                         ),
  //                         onPressed: toggleObsecure),
  //                     hintText: "password".tr,
  //                     obsecureText: _obsecureflag,
  //                   ),
  //                   spaceY(10.0.sp),
  //                   UnderlinedCustomTextField(
  //                     focusNode: _focusNodes[12],
  //                     controller: _passwordConfirmController,
  //                     keyBoardType: TextInputType.visiblePassword,
  //                     suffixIcon: IconButton(
  //                         icon: Icon(
  //                           EvaIcons.eyeOutline,
  //                           color: _focusNodes[12].hasFocus
  //                               ? Theme.of(context).colorScheme.secondary
  //                               : Colors.grey,
  //                           size: 20.0.sp,
  //                         ),
  //                         onPressed: toggleObsecure2),
  //                     hintText: "password_confirm".tr,
  //                     obsecureText: _obsecureflag2,
  //                   ),
  //                 ]),
  //           ),
  //           isActive: _currentStep >= 3,
  //           state: _currentStep >= 3
  //               ? MyStepState.complete
  //               : MyStepState.disabled),
  //     ];

  // Widget myLabel(int currenetStep, String text) => currenetStep == _currentStep
  //     ? SizedBox(
  //         width: 100,
  //         child: Text(
  //           text,
  //           textAlign: TextAlign.center,
  //           style: TextStyle(
  //               fontSize: text.split(" ").length >= 3 ? 8.sp : 11.0.sp,
  //               fontWeight: FontWeight.bold),
  //           softWrap: true,
  //         ),
  //       )
  //     : Text('');

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
        Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(padding: EdgeInsets.zero, primary: false, children: [
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
                )
              ],
            ),
            spaceY(10.0.sp),
            UnderlinedCustomTextField(
              focusNode: _focusNodes[2],
              controller: _ownerPhoneNumberController,
              keyBoardType: TextInputType.number,
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
              hintText: "phone_number".tr,
            ),
            spaceY(10.0.sp),
            UnderlinedCustomTextField(
              focusNode: _focusNodes[3],
              keyBoardType: TextInputType.text,
              controller: _nationallityController,
              readOnly: true,
              prefixIcon: Icon(
                EvaIcons.globe2Outline,
                size: 20.0.sp,
              ),
              hintText: "nationality".tr,
            ),
            spaceY(10.0.sp),
            UnderlinedCustomTextField(
              focusNode: _focusNodes[4],
              controller: _idNumController,
              keyBoardType: TextInputType.text,
              prefixIcon: Icon(FontAwesomeIcons.idCard, size: 16.0.sp),
              hintText: "ID number".tr,
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
                    child: TextfieldDatePicker(
                      textAlign: TextAlign.center,
                      focusNode: _focusNodes[5],
                      decoration: InputDecoration(
                        hintText: DateFormat('dd-MMMM-' 'yyyy')
                            .format(DateTime.now()),
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
                      cupertinoDatePickerMaximumDate:
                          DateTime.now().add(const Duration(days: 365 * 40)),
                      cupertinoDatePickerMaximumYear: 2099,
                      cupertinoDatePickerMinimumYear: 1900,
                      cupertinoDatePickerMinimumDate: DateTime.now()
                          .subtract(const Duration(days: 365 * 100)),
                      cupertinoDateInitialDateTime: DateTime.now(),
                      materialDatePickerFirstDate: DateTime.now()
                          .subtract(const Duration(days: 365 * 100)),
                      materialDatePickerInitialDate: DateTime.now(),
                      materialDatePickerLastDate:
                          DateTime.now().add(const Duration(days: 365 * 40)),
                      preferredDateFormat: DateFormat('dd-MMMM-' 'yyyy'),
                      textfieldDatePickerController: _dateController,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
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
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(padding: EdgeInsets.zero, primary: false, children: [
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
                        text: "Upload company logo",
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
              hintText: "Company Name En",
            ),
            spaceY(10.0.sp),
            UnderlinedCustomTextField(
              focusNode: _focusNodes[7],
              controller: _companyNameArController,
              keyBoardType: TextInputType.text,
              prefixIcon: Icon(Iconsax.buildings, size: 20.0.sp),
              hintText: "Company Name Ar",
            ),
            spaceY(10.0.sp),
            UnderlinedCustomTextField(
              focusNode: _focusNodes[8],
              controller: _companyPhoneNumberController,
              keyBoardType: TextInputType.number,
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
              hintText: "phone_number".tr,
            ),
            spaceY(10.0.sp),
            UnderlinedCustomTextField(
              focusNode: _focusNodes[9],
              controller: _emailController,
              keyBoardType: TextInputType.emailAddress,
              prefixIcon: Icon(FontAwesomeIcons.envelope, size: 16.0.sp),
              hintText: "email".tr,
            ),
            spaceY(10.0.sp),
            UnderlinedCustomTextField(
              focusNode: _focusNodes[10],
              controller: _urlController,
              keyBoardType: TextInputType.url,
              prefixIcon: Icon(Iconsax.link_21, size: 20.0.sp),
              hintText: "URL (optional)".tr,
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
                  padding: const EdgeInsetsDirectional.only(end: 5, start: 5),
                  width: 40.0.w,
                  height: 50,
                  borderRadius: BorderRadius.circular(10),
                  items: ["recruitment", "clean"]
                      .map(
                        (e) => DropdownMenuItem<String>(
                          value: e,
                          child: coloredText(text: e),
                        ),
                      )
                      .toList(),
                  onChanged: (p0) {},
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
                  hint: "city".tr,
                  border: const UnderlineInputBorder(),
                  width: 40.0.w,
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
            spaceY(10.0.sp),
            UnderlinedCustomTextField(
              focusNode: _focusNodes[11],
              controller: _pieceNumberController,
              keyBoardType: TextInputType.number,
              // prefixIcon: const Icon(Icons.email_outlined),
              hintText: "piece_num".tr,
            ),
            spaceY(10.0.sp),
            UnderlinedCustomTextField(
              focusNode: _focusNodes[12],
              controller: _streetController,
              keyBoardType: TextInputType.text,
              // prefixIcon: const Icon(Icons.email_outlined),
              hintText: "street".tr,
            ),
            spaceY(10.0.sp),
            UnderlinedCustomTextField(
              focusNode: _focusNodes[13],
              controller: _buildingController,
              keyBoardType: TextInputType.text,
              // prefixIcon: const Icon(Icons.email_outlined),
              hintText: "building".tr,
            ),
            spaceY(10.0.sp),
            UnderlinedCustomTextField(
              focusNode: _focusNodes[14],
              controller: _adnController,
              keyBoardType: TextInputType.number,
              // prefixIcon: const Icon(Icons.email_outlined),
              hintText: "adn".tr,
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
            ),
            spaceY(10.0.sp),
            UnderlinedCustomTextField(
              focusNode: _focusNodes[16],
              controller: _taxController,
              keyBoardType: TextInputType.number,
              // prefixIcon: const Icon(Icons.email_outlined),
              hintText: "Tax number",
            ),
            spaceY(10.0.sp),
            UnderlinedCustomTextField(
              focusNode: _focusNodes[17],
              controller: _licenseController,
              keyBoardType: TextInputType.number,
              // prefixIcon: const Icon(Icons.email_outlined),
              hintText: "license number",
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
        ),
        Padding(
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
                        idPassRadio = 0;
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
                        idPassRadio = 1;
                      });
                    },
                  )
                ],
              ),
              spaceY(20),
              idPassRadio == 0
                  ? Container()
                  : primaryButton(
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
                                color: Theme.of(context).colorScheme.secondary,
                                size: 18.0.sp,
                              ),
                              spaceX(10),
                              coloredText(
                                text: "Upload your passport",
                                color: const Color(0xff919191),
                                fontSize: 13.0.sp,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.arrow_forward,
                                color: Theme.of(context).colorScheme.secondary,
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
                                color: Theme.of(context).colorScheme.secondary,
                                size: 18.0.sp,
                              ),
                              spaceX(10),
                              coloredText(
                                text: "Upload front side of ID",
                                color: const Color(0xff919191),
                                fontSize: 13.0.sp,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.arrow_forward,
                                color: Theme.of(context).colorScheme.secondary,
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
                                color: Theme.of(context).colorScheme.secondary,
                                size: 18.0.sp,
                              ),
                              spaceX(10),
                              coloredText(
                                text: "Upload back side of ID",
                                color: const Color(0xff919191),
                                fontSize: 13.0.sp,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.arrow_forward,
                                color: Theme.of(context).colorScheme.secondary,
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
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(padding: EdgeInsets.zero, primary: false, children: [
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
            ),
            spaceY(20.0.sp),
            primaryButton(
              onTap: () {
                Get.offAll(() => const CompanyHomePage());
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
        ),

        // Padding(
        //   padding: const EdgeInsets.all(20),
        //   child: ListView(
        //       primary: false,
        //       padding: const EdgeInsets.all(0),
        //       children: [
        //         Row(
        //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //           children: [
        //             CustomDropDownMenuButton(
        //               hint: "city".tr,
        //               border: const UnderlineInputBorder(),
        //               width: 40.0.w,
        //               items: [
        //                 "syria",
        //                 "iraq",
        //                 "Egybt",
        //               ]
        //                   .map((e) => DropdownMenuItem<String>(
        //                         value: e,
        //                         child: coloredText(
        //                           text: e,
        //                           fontSize: 17,
        //                         ),
        //                       ))
        //                   .toList(),
        //               onChanged: (p0) {},
        //             ),
        //             CustomDropDownMenuButton(
        //               hint: "region".tr,
        //               border: const UnderlineInputBorder(),
        //               width: 40.0.w,
        //               items: [
        //                 "syria",
        //                 "iraq",
        //                 "Egybt",
        //               ]
        //                   .map((e) => DropdownMenuItem<String>(
        //                         value: e,
        //                         child: coloredText(
        //                           text: e,
        //                           fontSize: 17,
        //                         ),
        //                       ))
        //                   .toList(),
        //               onChanged: (p0) {},
        //             ),
        //           ],
        //         ),
        //         spaceY(10.0.sp),
        //         UnderlinedCustomTextField(
        //           focusNode: _focusNodes[5],
        //           controller: _pieceNumberController,
        //           keyBoardType: TextInputType.number,
        //           // prefixIcon: const Icon(Icons.email_outlined),
        //           hintText: "piece_num".tr,
        //           // validator: (String? value) =>
        //           //     EmailValidator.validate(value!)
        //           //         ? null
        //           //         : "please_enter_a_valid_email".tr,
        //         ),
        //         spaceY(10.0.sp),
        //         UnderlinedCustomTextField(
        //           focusNode: _focusNodes[6],
        //           controller: _streetController,
        //           keyBoardType: TextInputType.text,
        //           // prefixIcon: const Icon(Icons.email_outlined),
        //           hintText: "street".tr,
        //           // validator: (String? value) =>
        //           //     EmailValidator.validate(value!)
        //           //         ? null
        //           //         : "please_enter_a_valid_email".tr,
        //         ),
        //         spaceY(10.0.sp),
        //         UnderlinedCustomTextField(
        //           focusNode: _focusNodes[7],
        //           controller: _buildingController,
        //           keyBoardType: TextInputType.text,
        //           // prefixIcon: const Icon(Icons.email_outlined),
        //           hintText: "building".tr,
        //           // validator: (String? value) =>
        //           //     EmailValidator.validate(value!)
        //           //         ? null
        //           //         : "please_enter_a_valid_email".tr,
        //         ),
        //         spaceY(10.0.sp),
        //         UnderlinedCustomTextField(
        //           focusNode: _focusNodes[8],
        //           controller: _adnController,
        //           keyBoardType: TextInputType.number,
        //           // prefixIcon: const Icon(Icons.email_outlined),
        //           hintText: "adn".tr,
        //           // validator: (String? value) =>
        //           //     EmailValidator.validate(value!)
        //           //         ? null
        //           //         : "please_enter_a_valid_email".tr,
        //         ),
        //         spaceY(20.0.sp),
        //         Row(
        //           mainAxisAlignment: MainAxisAlignment.end,
        //           children: [
        //             coloredText(
        //                 text: "next".tr,
        //                 fontSize: 16.0.sp,
        //                 color: Theme.of(context).colorScheme.tertiary),
        //             spaceX(10),
        //             GestureDetector(
        //               onTap: () {
        //                 if (_currentStep < stepList().length - 1) {
        //                   setState(() => _currentStep += 1);
        //                   pageController.jumpToPage(_currentStep);
        //                 }

        //                 logSuccess(_currentStep);
        //                 setState(() {});
        //               },
        //               child: Container(
        //                 padding: const EdgeInsets.all(15),
        //                 decoration: BoxDecoration(
        //                   shape: BoxShape.circle,
        //                   gradient: LinearGradient(
        //                     begin: AlignmentDirectional.topStart,
        //                     end: AlignmentDirectional.bottomEnd,
        //                     colors: [
        //                       Theme.of(context).colorScheme.primary,
        //                       Theme.of(context).colorScheme.secondary,
        //                     ],
        //                   ),
        //                 ),
        //                 child: const Icon(
        //                   FontAwesomeIcons.anglesRight,
        //                   color: Colors.white,
        //                   size: 22,
        //                 ),
        //               ),
        //             ),
        //           ],
        //         ),
        //         spaceY(20.0.sp),
        //       ]),
        // ),
        // Padding(
        //   padding: const EdgeInsets.all(20),
        //   child: ListView(primary: false, padding: EdgeInsets.zero, children: [
        //     UnderlinedCustomTextField(
        //       focusNode: _focusNodes[9],
        //       controller: _idNumController,
        //       keyBoardType: TextInputType.number,
        //       // prefixIcon: const Icon(Icons.email_outlined),
        //       hintText: "id_number".tr,
        //       // validator: (String? value) =>
        //       //     EmailValidator.validate(value!)
        //       //         ? null
        //       //         : "please_enter_a_valid_email".tr,
        //     ),
        //     spaceY(25.0.sp),
        //     Align(
        //       alignment: AlignmentDirectional.centerStart,
        //       child: Container(
        //         padding:
        //             const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        //         decoration: BoxDecoration(
        //           borderRadius: BorderRadius.circular(35),
        //           color:
        //               Theme.of(context).colorScheme.secondary.withOpacity(0.13),
        //         ),
        //         child: Row(
        //           mainAxisSize: MainAxisSize.min,
        //           children: [
        //             Icon(
        //               FontAwesomeIcons.upload,
        //               color: Theme.of(context).colorScheme.secondary,
        //               size: 13.0.sp,
        //             ),
        //             spaceX(10.0.sp),
        //             coloredText(
        //                 text: "upload_id".tr,
        //                 color: Theme.of(context).colorScheme.secondary,
        //                 fontSize: 13.0.sp)
        //           ],
        //         ),
        //       ),
        //     ),
        //     spaceY(20.0.sp),
        //     Row(
        //       mainAxisAlignment: MainAxisAlignment.end,
        //       children: [
        //         coloredText(
        //             text: "next".tr,
        //             fontSize: 16.0.sp,
        //             color: Theme.of(context).colorScheme.tertiary),
        //         spaceX(10),
        //         GestureDetector(
        //           onTap: () {
        //             if (_currentStep < stepList().length - 1) {
        //               setState(() => _currentStep += 1);
        //               pageController.jumpToPage(_currentStep);
        //             }
        //             logSuccess(_currentStep);
        //             setState(() {});
        //           },
        //           child: Container(
        //             padding: const EdgeInsets.all(15),
        //             decoration: BoxDecoration(
        //               shape: BoxShape.circle,
        //               gradient: LinearGradient(
        //                 begin: AlignmentDirectional.topStart,
        //                 end: AlignmentDirectional.bottomEnd,
        //                 colors: [
        //                   Theme.of(context).colorScheme.primary,
        //                   Theme.of(context).colorScheme.secondary,
        //                 ],
        //               ),
        //             ),
        //             child: const Icon(
        //               FontAwesomeIcons.anglesRight,
        //               color: Colors.white,
        //               size: 22,
        //             ),
        //           ),
        //         ),
        //       ],
        //     ),
        //     spaceY(20.0.sp),
        //   ]),
        // ),
      ];
}
