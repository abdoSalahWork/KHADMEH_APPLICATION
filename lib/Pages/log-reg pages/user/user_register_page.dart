import 'package:email_validator/email_validator.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../Utils/utils.dart';
import '../../../widgets/dropdown_menu_button.dart';
import '../../../widgets/my_stepper.dart';
import '../../../widgets/underline_text_field.dart';
import '../../log-reg%20pages/otp_page.dart';

class UserRegisterPage extends StatefulWidget {
  const UserRegisterPage({super.key});

  @override
  State<UserRegisterPage> createState() => _UserRegisterPageState();
}

class _UserRegisterPageState extends State<UserRegisterPage> {
  int _currentStep = 0;
  tapped(int step) {
    setState(() => _currentStep = step);
  }

  cancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  }

  final formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _nationallityController = TextEditingController();
  final TextEditingController _jobNameController = TextEditingController();
  final TextEditingController _pieceNumberController = TextEditingController();
  final TextEditingController _streetController = TextEditingController();
  final TextEditingController _buildingController = TextEditingController();
  final TextEditingController _adnController = TextEditingController();
  final TextEditingController _idNumController = TextEditingController();
  final TextEditingController _refNumController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmController =
      TextEditingController();
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

  final List<FocusNode> _focusNodes = [
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
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
              Expanded(
                child: Container(
                  width: 100.0.w,
                  margin: const EdgeInsetsDirectional.only(bottom: 10),
                  child: Form(
                    key: formKey,
                    child: MyStepper(
                        type: MyStepperType.horizontal,
                        onStepContinue: () {
                          _currentStep < stepList(0, 0).length - 1
                              ? setState(() => _currentStep += 1)
                              : null;
                        },
                        elevation: 0,
                        onStepCancel: cancel,
                        onStepTapped: tapped,
                        currentStep: _currentStep,
                        steps: stepList(100.0.h, 100.0.w),
                        // physics: const NeverScrollableScrollPhysics(),
                        controlsBuilder: (context, details) {
                          return primaryButton(
                            height: 50,
                            width: 45.0.w,
                            radius: 30,
                            onTap: () {
                              _currentStep < stepList(0, 0).length - 1
                                  ? setState(() => _currentStep += 1)
                                  : Get.to(
                                      () => const OTPPage(),
                                      transition: Transition.rightToLeft,
                                    );
                            },
                            text: coloredText(
                              text: "next".tr,
                              color: Colors.white,
                              fontSize: 16.0.sp,
                            ),
                            color: Theme.of(context).primaryColor,
                          );
                        }),
                  ),
                ),
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

  List<MyStep> stepList(double h, double w) => [
        MyStep(
            label: myLabel(0, "personal_info".tr),
            content: SizedBox(
              height: h < 600 ? 43.0.h : 50.0.h,
              child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  primary: false,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    UnderlinedCustomTextField(
                        focusNode: _focusNodes[0],
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: _nameController,
                        keyBoardType: TextInputType.text,
                        prefixIcon: Icon(
                          FontAwesomeIcons.user,
                          size: 16.0.sp,
                        ),
                        hintText: "name".tr,
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return "required".tr;
                          }
                          return null;
                        }),
                    spaceY(10.0.sp),
                    UnderlinedCustomTextField(
                      focusNode: _focusNodes[1],
                      controller: _emailController,
                      keyBoardType: TextInputType.emailAddress,
                      prefixIcon: Icon(
                        FontAwesomeIcons.envelope,
                        size: 16.0.sp,
                      ),
                      hintText: "email".tr,
                      validator: (String? value) =>
                          EmailValidator.validate(value!)
                              ? null
                              : "please_enter_a_valid_email".tr,
                    ),
                    spaceY(10.0.sp),
                    UnderlinedCustomTextField(
                      focusNode: _focusNodes[2],
                      controller: _phoneNumberController,
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
                      // validator: (String? value) =>
                      //     EmailValidator.validate(value!)
                      //         ? null
                      //         : "please_enter_a_valid_email".tr,
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
                      hintText: "${"nationality".tr} (${"optional".tr})",
                      // validator: (String? value) =>
                      //     EmailValidator.validate(value!)
                      //         ? null
                      //         : "please_enter_a_valid_email".tr,
                    ),
                    spaceY(10.0.sp),
                    UnderlinedCustomTextField(
                      focusNode: _focusNodes[4],
                      controller: _jobNameController,
                      keyBoardType: TextInputType.text,
                      prefixIcon: Icon(
                        EvaIcons.briefcaseOutline,
                        size: 20.0.sp,
                      ),
                      hintText: "job".tr,
                      // validator: (String? value) =>
                      //     EmailValidator.validate(value!)
                      //         ? null
                      //         : "please_enter_a_valid_email".tr,
                    ),
                  ]),
            ),
            isActive: _currentStep >= 0,
            state: _currentStep >= 0
                ? MyStepState.complete
                : MyStepState.disabled),
        MyStep(
            label: myLabel(1, "address_info".tr),
            content: SizedBox(
              height: h < 600 ? 43.0.h : 50.0.h,
              child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  primary: false,
                  children: [
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
                      focusNode: _focusNodes[5],
                      controller: _pieceNumberController,
                      keyBoardType: TextInputType.number,
                      // prefixIcon: const Icon(Icons.email_outlined),
                      hintText: "piece_num".tr,
                      // validator: (String? value) =>
                      //     EmailValidator.validate(value!)
                      //         ? null
                      //         : "please_enter_a_valid_email".tr,
                    ),
                    spaceY(10.0.sp),
                    UnderlinedCustomTextField(
                      focusNode: _focusNodes[6],
                      controller: _streetController,
                      keyBoardType: TextInputType.text,
                      // prefixIcon: const Icon(Icons.email_outlined),
                      hintText: "street".tr,
                      // validator: (String? value) =>
                      //     EmailValidator.validate(value!)
                      //         ? null
                      //         : "please_enter_a_valid_email".tr,
                    ),
                    spaceY(10.0.sp),
                    UnderlinedCustomTextField(
                      focusNode: _focusNodes[7],
                      controller: _buildingController,
                      keyBoardType: TextInputType.text,
                      // prefixIcon: const Icon(Icons.email_outlined),
                      hintText: "building".tr,
                      // validator: (String? value) =>
                      //     EmailValidator.validate(value!)
                      //         ? null
                      //         : "please_enter_a_valid_email".tr,
                    ),
                    spaceY(10.0.sp),
                    UnderlinedCustomTextField(
                      focusNode: _focusNodes[8],
                      controller: _adnController,
                      keyBoardType: TextInputType.number,
                      // prefixIcon: const Icon(Icons.email_outlined),
                      hintText: "adn".tr,
                      // validator: (String? value) =>
                      //     EmailValidator.validate(value!)
                      //         ? null
                      //         : "please_enter_a_valid_email".tr,
                    ),
                  ]),
            ),
            isActive: _currentStep >= 1,
            state: _currentStep >= 1
                ? MyStepState.complete
                : MyStepState.disabled),
        MyStep(
            label: myLabel(2, "id_proof".tr),
            content: SizedBox(
              height: h < 600 ? 43.0.h : 50.0.h,
              child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  primary: false,
                  children: [
                    UnderlinedCustomTextField(
                      focusNode: _focusNodes[9],
                      controller: _idNumController,
                      keyBoardType: TextInputType.number,
                      // prefixIcon: const Icon(Icons.email_outlined),
                      hintText: "id_number".tr,
                      // validator: (String? value) =>
                      //     EmailValidator.validate(value!)
                      //         ? null
                      //         : "please_enter_a_valid_email".tr,
                    ),
                    spaceY(10.0.sp),
                    UnderlinedCustomTextField(
                      focusNode: _focusNodes[10],
                      controller: _refNumController,
                      keyBoardType: TextInputType.number,
                      // prefixIcon: const Icon(Icons.email_outlined),
                      hintText: "ref_number".tr,
                      // validator: (String? value) =>
                      //     EmailValidator.validate(value!)
                      //         ? null
                      //         : "please_enter_a_valid_email".tr,
                    ),
                    spaceY(25.0.sp),
                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
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
                                text: "upload_id".tr,
                                color: Theme.of(context).colorScheme.secondary,
                                fontSize: 13.0.sp)
                          ],
                        ),
                      ),
                    ),
                    spaceY(15.0.sp),
                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35),
                          color: Theme.of(context)
                              .colorScheme
                              .secondary
                              .withOpacity(0.1),
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
                                text: "upload_personal_photo".tr,
                                color: Theme.of(context).colorScheme.secondary,
                                fontSize: 13.0.sp)
                          ],
                        ),
                      ),
                    )
                  ]),
            ),
            isActive: _currentStep >= 2,
            state: _currentStep >= 2
                ? MyStepState.complete
                : MyStepState.disabled),
        MyStep(
            label: myLabel(3, "security".tr),
            content: SizedBox(
              height: h < 600 ? 43.0.h : 50.0.h,
              child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  primary: false,
                  children: [
                    UnderlinedCustomTextField(
                      focusNode: _focusNodes[11],
                      prefixIcon: Icon(
                        EvaIcons.lockOutline,
                        color: _focusNodes[11].hasFocus
                            ? Theme.of(context).colorScheme.secondary
                            : Colors.grey,
                      ),
                      controller: _passwordController,
                      keyBoardType: TextInputType.visiblePassword,
                      suffixIcon: IconButton(
                          icon: Icon(
                            EvaIcons.eyeOutline,
                            color: _focusNodes[11].hasFocus
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
                      focusNode: _focusNodes[12],
                      prefixIcon: Icon(
                        EvaIcons.lockOutline,
                        color: _focusNodes[12].hasFocus
                            ? Theme.of(context).colorScheme.secondary
                            : Colors.grey,
                      ),
                      controller: _passwordConfirmController,
                      keyBoardType: TextInputType.visiblePassword,
                      suffixIcon: IconButton(
                          icon: Icon(
                            EvaIcons.eyeOutline,
                            color: _focusNodes[12].hasFocus
                                ? Theme.of(context).colorScheme.secondary
                                : Colors.grey,
                            size: 20.0.sp,
                          ),
                          onPressed: toggleObsecure2),
                      hintText: "password_confirm".tr,
                      obsecureText: _obsecureflag2,
                    ),
                  ]),
            ),
            isActive: _currentStep >= 3,
            state: _currentStep >= 3
                ? MyStepState.complete
                : MyStepState.disabled),
      ];

  Widget myLabel(int currenetStep, String text) => currenetStep == _currentStep
      ? SizedBox(
          width: 100,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: text.split(" ").length >= 3 ? 8.sp : 11.0.sp,
                fontWeight: FontWeight.bold),
            softWrap: true,
          ),
        )
      : const Text('');
}
