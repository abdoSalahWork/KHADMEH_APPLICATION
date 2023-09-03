import 'dart:math';

import 'package:email_validator/email_validator.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:khedma/Pages/global_controller.dart';
import 'package:khedma/Pages/log-reg%20pages/controller/auth_controller.dart';
import 'package:khedma/Pages/log-reg%20pages/models/user_register_model.dart';
import 'package:khedma/Pages/log-reg%20pages/otp_page.dart';
import 'package:sizer/sizer.dart';

import '../../../Utils/utils.dart';
import '../../../widgets/dropdown_menu_button.dart';
import '../../../widgets/my_stepper.dart';
import '../../../widgets/underline_text_field.dart';

class UserRegisterPage extends StatefulWidget {
  const UserRegisterPage({
    super.key,
  });

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

  UserRegisterData userRegisterData = UserRegisterData();
  final formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  // final TextEditingController _nationallityController = TextEditingController();
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

  String button1Text = "upload_id".tr;
  String button2Text = "upload_personal_photo".tr;
  bool _obsecureflag = true;
  bool _obsecureflag2 = true;
  String region = "";
  String nationality = "";
  String city = "";
  String phoneCode = "";
  var errors = {};
  final AuthController _authController = Get.find();
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
                          onTap: () async {
                            if (_currentStep < stepList(0, 0).length - 1) {
                              setState(() => _currentStep += 1);
                            } else {
                              FocusScope.of(context).unfocus();
                              // userRegisterData.phone ??= "";
                              userRegisterData.phone =
                                  phoneCode + _phoneNumberController.text;
                              var x = await _authController.userRegister(
                                  userRegisterData: userRegisterData);
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
                                              password:
                                                  _passwordController.text,
                                            ),
                                            transition: Transition.rightToLeft,
                                          );
                                        },
                                        width: 40.0.w,
                                        height: 50,
                                        radius: 10.w,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          spaceY(20),
                                          Icon(
                                            EvaIcons.checkmarkCircle,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondary,
                                            size: 40.sp,
                                          ),
                                          spaceY(20),
                                          coloredText(
                                              text: "You have been registered",
                                              fontSize: 12.0.sp),
                                          coloredText(
                                            text: "successfully",
                                            fontSize: 14.0.sp,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondary,
                                          ),
                                        ],
                                      ),
                                    ));
                              } else if (x['message'] ==
                                  "The given data was invalid.") {
                                errors = x['errors'];
                                if (errors['full_name'] != null ||
                                    errors['phone'] != null ||
                                    errors['email'] != null ||
                                    errors['jon_name'] != null ||
                                    errors['nationality_id'] != null) {
                                  setState(() => _currentStep = 0);
                                } else if (errors['city_id'] != null ||
                                    errors['region_id'] != null ||
                                    errors['piece_number'] != null ||
                                    errors['street'] != null ||
                                    errors['building'] != null ||
                                    errors['automated_address_number'] !=
                                        null) {
                                  setState(() => _currentStep = 1);
                                } else if (errors['id_number_nationality'] !=
                                        null ||
                                    errors['refrence_number'] != null ||
                                    errors['id_photo_nationality'] != null ||
                                    errors['personal_photo'] != null) {
                                  setState(() => _currentStep = 2);
                                  String tmp = "";
                                  if (errors['id_photo_nationality'] != null &&
                                      errors['personal_photo'] != null) {
                                    tmp = errors['id_photo_nationality']
                                            .join("\n") +
                                        "\n" +
                                        errors['personal_photo'].join("\n");
                                    Utils.showSnackBar(
                                        message: tmp, fontSize: 12.0.sp);
                                  } else if (errors['id_photo_nationality'] !=
                                      null) {
                                    tmp = errors['id_photo_nationality']
                                        .join("\n");
                                    Utils.showSnackBar(
                                        message: tmp, fontSize: 12.0.sp);
                                  } else if (errors['personal_photo'] != null) {
                                    tmp = errors['personal_photo'].join("\n");
                                    Utils.showSnackBar(
                                        message: tmp, fontSize: 12.0.sp);
                                  }
                                } else {
                                  setState(() => _currentStep = 3);
                                }

                                // setState(() {});
                              }
                            }
                          },
                          text: coloredText(
                            text: _currentStep == 3 ? "submit".tr : "next".tr,
                            color: Colors.white,
                            fontSize: 16.0.sp,
                          ),
                          color: Theme.of(context).primaryColor,
                        );
                      }),
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
                        autovalidateMode: AutovalidateMode.always,
                        controller: _nameController,
                        keyBoardType: TextInputType.text,
                        onchanged: (s) {
                          errors['full_name'] = null;
                          setState(() {});
                          userRegisterData.fullName = s;
                        },
                        prefixIcon: Icon(
                          FontAwesomeIcons.user,
                          size: 16.0.sp,
                        ),
                        hintText: "name".tr,
                        validator: (String? value) {
                          if (errors['full_name'] != null) {
                            String tmp = "";
                            tmp = errors['full_name'].join("\n");

                            return tmp;
                          }
                          return null;
                        }),
                    spaceY(10.0.sp),
                    UnderlinedCustomTextField(
                        focusNode: _focusNodes[1],
                        controller: _emailController,
                        keyBoardType: TextInputType.emailAddress,
                        onchanged: (s) {
                          errors['email'] = null;
                          setState(() {});

                          userRegisterData.email = s;
                        },
                        prefixIcon: Icon(
                          FontAwesomeIcons.envelope,
                          size: 16.0.sp,
                        ),
                        hintText: "email".tr,
                        autovalidateMode: AutovalidateMode.always,
                        validator: (String? value) {
                          if (errors['email'] != null) {
                            String tmp = "";
                            tmp = errors['email'].join("\n");

                            return tmp;
                          } else if (EmailValidator.validate(value!) ||
                              value.isEmpty) {
                            return null;
                          } else {
                            return "please_enter_a_valid_email".tr;
                          }
                        }),
                    spaceY(10.0.sp),
                    UnderlinedCustomTextField(
                      focusNode: _focusNodes[2],
                      controller: _phoneNumberController,
                      keyBoardType: TextInputType.number,
                      autovalidateMode: AutovalidateMode.always,
                      onchanged: (s) {
                        errors['phone'] = null;
                        setState(() {});
                        userRegisterData.phone = s!;
                      },
                      validator: (String? value) {
                        if (errors['phone'] != null) {
                          String tmp = "";
                          tmp = errors['phone'].join("\n");

                          return tmp;
                        } else if (value!.length < 7 && value.isNotEmpty) {
                          return "phone must be 7 numbers at least";
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
                            GetBuilder<GlobalController>(builder: (c) {
                              return CustomDropDownMenuButton(
                                width: 100,
                                hintPadding: 5,
                                hintSize: 13,
                                value: phoneCode == "" ? null : phoneCode,
                                items: c.countries
                                    .map((e) => DropdownMenuItem<String>(
                                          value: e.code!,
                                          child: coloredText(
                                            text: e.code!,
                                            fontSize: 17,
                                          ),
                                        ))
                                    .toList(),
                                onChanged: (s) {
                                  phoneCode = s!;
                                },
                              );
                            }),
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
                    GetBuilder<GlobalController>(builder: (c) {
                      return CustomDropDownMenuButton(
                        hintPadding: 0, focusNode: _focusNodes[3],
                        value: nationality == "" ? null : nationality,
                        hint: "Nationality (optional)",
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
                        items: c.countries
                            .map(
                              (e) => DropdownMenuItem<String>(
                                value: e.nameEn,
                                child: coloredText(
                                    text: e.nameEn!, color: Colors.black),
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
                          nationality = p0!;
                          errors['nationality_id'] = null;
                          setState(() {});
                          userRegisterData.nationalityId = c.countries
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
                      );
                    }),
                    spaceY(10.0.sp),
                    // UnderlinedCustomTextField(
                    //   focusNode: _focusNodes[3],
                    //   keyBoardType: TextInputType.text,

                    //   controller: _nationallityController,
                    //   readOnly: true,
                    //   prefixIcon: Icon(
                    //     EvaIcons.globe2Outline,
                    //     size: 20.0.sp,
                    //   ),
                    //   hintText: "${"nationality".tr} (${"optional".tr})",
                    //   // validator: (String? value) =>
                    //   //     EmailValidator.validate(value!)
                    //   //         ? null
                    //   //         : "please_enter_a_valid_email".tr,
                    // ),

                    UnderlinedCustomTextField(
                      focusNode: _focusNodes[4],
                      controller: _jobNameController,
                      keyBoardType: TextInputType.text,
                      autovalidateMode: AutovalidateMode.always,

                      prefixIcon: Icon(
                        EvaIcons.briefcaseOutline,
                        size: 20.0.sp,
                      ),
                      onchanged: (s) {
                        errors['job_name'] = null;
                        setState(() {});
                        userRegisterData.jobName = s;
                      },
                      validator: (String? value) {
                        if (errors['job_name'] != null) {
                          String tmp = "";
                          tmp = errors['job_name'].join("\n");

                          return tmp;
                        }
                        return null;
                      },
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
                    GetBuilder<GlobalController>(builder: (c) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //todo:langs needs to be fixed
                          CustomDropDownMenuButton(
                            hint: "city".tr,
                            value: city == "" ? null : city,
                            hintPadding: 0,
                            border: const UnderlineInputBorder(),
                            width: 40.0.w,
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
                              userRegisterData.cityId = c.cities
                                  .where((element) =>
                                      element.nameEn == p0 ||
                                      element.nameAr == p0)
                                  .first
                                  .id
                                  .toString();
                            },
                          ),
                          //todo:langs need to be fixed
                          CustomDropDownMenuButton(
                            hint: "region".tr,
                            border: const UnderlineInputBorder(),
                            width: 40.0.w,
                            hintPadding: 0,
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
                              userRegisterData.regionId = c.regions
                                  .where((element) =>
                                      element.nameEn == p0 ||
                                      element.nameAr == p0)
                                  .first
                                  .id
                                  .toString();
                              ;
                            },
                          ),
                        ],
                      );
                    }),
                    spaceY(10.0.sp),
                    UnderlinedCustomTextField(
                      focusNode: _focusNodes[5],
                      controller: _pieceNumberController,
                      keyBoardType: TextInputType.number,
                      // prefixIcon: const Icon(Icons.email_outlined),
                      autovalidateMode: AutovalidateMode.always,
                      validator: (String? value) {
                        if (errors['piece_number'] != null) {
                          String tmp = "";
                          tmp = errors['piece_number'].join("\n");

                          return tmp;
                        }
                        return null;
                      },
                      onchanged: (s) {
                        errors["piece_number"] = null;
                        setState(() {});
                        userRegisterData.pieceNumber = s;
                      },
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
                      autovalidateMode: AutovalidateMode.always,
                      validator: (String? value) {
                        if (errors['street'] != null) {
                          String tmp = "";
                          tmp = errors['street'].join("\n");

                          return tmp;
                        }
                        return null;
                      },
                      onchanged: (s) {
                        errors["street"] = null;
                        setState(() {});
                        userRegisterData.street = s;
                      },
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
                      autovalidateMode: AutovalidateMode.always,
                      validator: (String? value) {
                        if (errors['building'] != null) {
                          String tmp = "";
                          tmp = errors['building'].join("\n");

                          return tmp;
                        }
                        return null;
                      },
                      onchanged: (s) {
                        errors["building"] = null;
                        setState(() {});
                        userRegisterData.building = s;
                      },
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
                      autovalidateMode: AutovalidateMode.always,
                      validator: (String? value) {
                        if (errors['automated_address_number'] != null) {
                          String tmp = "";
                          tmp = errors['automated_address_number'].join("\n");

                          return tmp;
                        }
                        return null;
                      },
                      onchanged: (s) {
                        errors["automated_address_number"] = null;
                        setState(() {});
                        userRegisterData.automatedAddressNumber = s;
                      },
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
                      autovalidateMode: AutovalidateMode.always,
                      validator: (String? value) {
                        if (errors['id_number_nationality'] != null) {
                          String tmp = "";
                          tmp = errors['id_number_nationality'].join("\n");

                          return tmp;
                        }
                        return null;
                      },
                      onchanged: (s) {
                        errors["id_number_nationality"] = null;
                        setState(() {});
                        userRegisterData.idNumberNationality = s;
                      },
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
                      autovalidateMode: AutovalidateMode.always,
                      validator: (String? value) {
                        if (errors['refrence_number'] != null) {
                          String tmp = "";
                          tmp = errors['refrence_number'].join("\n");

                          return tmp;
                        }
                        return null;
                      },
                      onchanged: (s) {
                        errors["refrence_number"] = null;
                        setState(() {});
                        userRegisterData.referenceNumber = s;
                      },
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
                      child: GestureDetector(
                        onTap: () async {
                          final result = await FilePicker.platform.pickFiles(
                            allowMultiple: false,
                            type: FileType.image,
                          );
                          if (result != null) {
                            button1Text = result.files[0].name.substring(
                                0, min(15, result.files[0].name.length));
                            userRegisterData.idPhotoNationality =
                                result.files[0];
                            setState(() {});
                          }
                        },
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
                                  text: button1Text,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  fontSize: 13.0.sp)
                            ],
                          ),
                        ),
                      ),
                    ),
                    spaceY(15.0.sp),
                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: GestureDetector(
                        onTap: () async {
                          final result = await FilePicker.platform.pickFiles(
                            allowMultiple: false,
                            type: FileType.image,
                          );
                          if (result != null) {
                            button2Text = result.files[0].name.substring(
                                0, min(25, result.files[0].name.length));
                            userRegisterData.personalPhoto = result.files[0];
                            setState(() {});
                          }
                        },
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
                                  text: button2Text,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  fontSize: 13.0.sp)
                            ],
                          ),
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
                      onchanged: (p0) {
                        userRegisterData.password = p0;
                      },
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
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: Utils.validatePassword,
                    ),
                    spaceY(10.0.sp),
                    UnderlinedCustomTextField(
                      focusNode: _focusNodes[12],
                      onchanged: (p0) {
                        userRegisterData.passwordConfirmation = p0;
                      },
                      prefixIcon: Icon(
                        EvaIcons.lockOutline,
                        color: _focusNodes[12].hasFocus
                            ? Theme.of(context).colorScheme.secondary
                            : Colors.grey,
                      ),
                      controller: _passwordConfirmController,
                      keyBoardType: TextInputType.visiblePassword,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (s) {
                        if (_passwordController.text != s) {
                          return "don't match password";
                        }
                        return null;
                      },
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
