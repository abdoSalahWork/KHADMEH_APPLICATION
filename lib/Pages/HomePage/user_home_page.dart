import 'dart:math';
import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart'; // ignore_for_file: must_be_immutable
import 'package:easy_stepper/easy_stepper.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../Utils/utils.dart';
import '../../widgets/dropdown_menu_button.dart';
import '../../widgets/underline_text_field.dart';
import '../Notifications/notifications_page.dart';
import '../chat%20page/messages_page.dart';
import '../personal%20page/personal_page.dart';
import 'cleaning%20companies/cleaning_companies_search_page.dart';
import 'employees.dart/employees_search_page.dart';
import 'recruitment-companies/recruitment_companies_search_page.dart';

class UserHomePage extends StatefulWidget {
  const UserHomePage({super.key});

  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  PageController pageController = PageController(initialPage: 0);
  List<String> tags = [];

  List<String> options = [
    "cleaner",
    "driver",
    "chef",
    "babysitter",
    "nurse",
    "sewing",
    "washing",
  ];
  bool completedRegisterFlag = false;
  int _currentStep = 0;

  late double h;
  late double h2;

  tapped(int step) {
    setState(() => _currentStep = step);
  }

  cancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  }

  final formKey = GlobalKey<FormState>();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _jobNameController = TextEditingController();
  final TextEditingController _pieceNumberController = TextEditingController();
  final TextEditingController _streetController = TextEditingController();
  final TextEditingController _buildingController = TextEditingController();
  final TextEditingController _adnController = TextEditingController();
  final TextEditingController _idNumController = TextEditingController();

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
    h2 = 470.0.sp;
    h = 330.0.sp;
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
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 55,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(children: [
                      coloredText(
                        text: "hello".tr,
                        fontSize: 16.0.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      spaceX(10),
                      coloredText(
                        text: "Ammourie".tr,
                        fontSize: 16.0.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ]),
                    Row(children: [
                      Badge(
                        smallSize: 10,
                        child: GestureDetector(
                          onTap: () => Get.to(() => const NotificationsPage(),
                              transition: Transition.downToUp),
                          child: Icon(
                            EvaIcons.bell,
                            color: const Color(0xffD1D1D1),
                            size: 25.0.sp,
                          ),
                        ),
                      ),
                      spaceX(10),
                      GestureDetector(
                        child: Icon(
                          EvaIcons.messageCircle,
                          color: const Color(0xffD1D1D1),
                          size: 22.0.sp,
                        ),
                        onTap: () => Get.to(() => const MessagesPage()),
                      ),
                      spaceX(10),
                      GestureDetector(
                        onTap: () => Get.to(
                            () => const PersonalPage(
                                employeeType: EmployeeType.clean),
                            transition: Transition.downToUp),
                        child: Container(
                          width: 45,
                          height: 45,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            // border: Border.all(
                            //   width: 1,
                            //   color: const Color(0xffD1D1D1),
                            // ),
                            image: DecorationImage(
                              image: AssetImage("assets/images/image.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ]),
                  ],
                ),
                spaceY(1.5.h),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    physics: completedRegisterFlag
                        ? null
                        : const NeverScrollableScrollPhysics(),
                    primary: false,
                    children: [
                      CarouselSlider(
                        options: CarouselOptions(
                          height: 150.0,
                          aspectRatio: 16 / 9,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 3),
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,
                          enlargeFactor: 0.2,
                          onPageChanged: (index, reason) {},
                          scrollDirection: Axis.horizontal,
                        ),
                        items: [1, 2, 3, 4, 5].map((i) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                  width: MediaQuery.of(context).size.width,
                                  // margin: const EdgeInsets.symmetric(horizontal: 5.0),
                                  decoration: BoxDecoration(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                    child: Text(
                                      'text $i',
                                      style: const TextStyle(
                                          fontSize: 16.0, color: Colors.white),
                                    ),
                                  ));
                            },
                          );
                        }).toList(),
                      ),
                      spaceY(2.0.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          coloredText(
                            text: "rec_com".tr,
                            fontSize: 13.0.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          GestureDetector(
                            onTap: () => Get.to(
                                () => const RecruitmentCompaniesSearchPage(),
                                transition: Transition.downToUp),
                            child: coloredText(
                              text: "all".tr,
                              fontSize: 13.0.sp,
                              color: Colors.grey,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                      spaceY(1.5.h),
                      SizedBox(
                        height: 18.0.h,
                        child: ListView.separated(
                          physics: completedRegisterFlag
                              ? null
                              : const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              width: 40.0.w,
                              decoration: BoxDecoration(
                                color: const Color(0xffF8F8F8),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image(
                                    width: 60.0.sp,
                                    height: 60.0.sp,
                                    image: AssetImage(
                                        "assets/images/logo${Random().nextInt(2 - 0)}.png"),
                                    fit: BoxFit.contain,
                                  ),
                                  coloredText(
                                    text: "lorem ipsum".length > 12
                                        ? "${"lorem ipsum".substring(0, 12)}.."
                                        : "lorem ipsum",
                                    fontSize: 12.0.sp,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(EvaIcons.star,
                                          color: Colors.yellow),
                                      spaceX(5),
                                      coloredText(
                                        text: "4.5",
                                        fontSize: 13.0.sp,
                                        color: Colors.black,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            );
                          },
                          itemCount: 10,
                          separatorBuilder: (BuildContext context, int index) =>
                              spaceX(10),
                        ),
                      ),
                      spaceY(2.0.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          coloredText(
                            text: "cl_com".tr,
                            fontSize: 13.0.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(() => const CleaningCompaniesSearchPage(),
                                  transition: Transition.downToUp);
                            },
                            child: coloredText(
                              text: "all".tr,
                              fontSize: 13.0.sp,
                              color: Colors.grey,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                      spaceY(1.5.h),
                      SizedBox(
                        height: 18.0.h,
                        child: ListView.separated(
                          physics: completedRegisterFlag
                              ? null
                              : const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              width: 40.0.w,
                              decoration: BoxDecoration(
                                color: const Color(0xffF8F8F8),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image(
                                    width: 60.0.sp,
                                    height: 60.0.sp,
                                    image: AssetImage(
                                        "assets/images/logo${Random().nextInt(2 - 0)}.png"),
                                    fit: BoxFit.contain,
                                  ),
                                  coloredText(
                                    text: "lorem ipsum".length > 12
                                        ? "${"lorem ipsum".substring(0, 12)}.."
                                        : "lorem ipsum",
                                    fontSize: 13.0.sp,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(EvaIcons.star,
                                          color: Colors.yellow),
                                      spaceX(5),
                                      coloredText(
                                        text: "4.5",
                                        fontSize: 13.0.sp,
                                        color: Colors.black,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            );
                          },
                          itemCount: 10,
                          separatorBuilder: (BuildContext context, int index) =>
                              spaceX(10),
                        ),
                      ),
                      spaceY(2.0.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          coloredText(
                            text: "employees".tr,
                            fontSize: 13.0.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          GestureDetector(
                            onTap: () => Get.to(
                                () => const EmployeesSearchPage(),
                                transition: Transition.downToUp),
                            child: coloredText(
                              text: "all".tr,
                              fontSize: 13.0.sp,
                              color: Colors.grey,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                      spaceY(2.0.h),
                      SizedBox(
                        height: 25.0.h,
                        child: ListView.separated(
                          physics: completedRegisterFlag
                              ? null
                              : const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 25.0.w,
                                  height: 25.0.w,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/image.png"),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.only(
                                          start: 2),
                                      child: coloredText(
                                          text: 'lorem ipsun',
                                          fontSize: 13.0.sp),
                                    ),
                                    spaceY(2),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Icon(
                                          EvaIcons.pin,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                          size: 13.0.sp,
                                        ),
                                        spaceX(3),
                                        coloredText(
                                          text: 'Homs',
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                          fontSize: 12.0.sp,
                                        ),
                                      ],
                                    ),
                                    spaceY(2),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Icon(
                                          EvaIcons.star,
                                          color: Colors.yellow,
                                          size: 15.0.sp,
                                        ),
                                        spaceX(5),
                                        coloredText(
                                          text: "4.5",
                                          fontSize: 12.0.sp,
                                          color: Colors.black,
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            );
                          },
                          itemCount: 10,
                          separatorBuilder: (BuildContext context, int index) =>
                              spaceX(20),
                        ),
                      ),
                      spaceY(3.0.h)
                    ],
                  ),
                ),
              ],
            ),
          ),
          Visibility(
            visible: !completedRegisterFlag,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
              child: Container(
                decoration: BoxDecoration(color: Colors.white.withOpacity(0.5)),
                width: 100.0.w,
                height: 100.0.h,
              ),
            ),
          ),
          Visibility(
            visible: !completedRegisterFlag,
            child: Material(
              color: Colors.transparent,
              elevation: 15,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.elliptical(50.0.w, 30),
                bottomRight: Radius.elliptical(50.0.w, 30),
              ),
              child: ClipPath(
                clipper: OvalBottomBorderClipper(),
                child: Stack(
                  children: [
                    Container(
                      width: 100.0.w,
                      height: _currentStep == 1 ? h2 : h,
                      color: Colors.white,
                      // duration: const const Duration(milliseconds: 250),
                      child: Column(
                        children: [
                          spaceY(100),
                          EasyStepper(
                            activeStep: _currentStep,
                            lineLength: 30.0.w,
                            lineSpace: 0,
                            lineType: LineType.normal,
                            defaultLineColor: Colors.grey,

                            finishedLineColor:
                                Theme.of(context).colorScheme.tertiary,
                            activeStepTextColor:
                                Theme.of(context).colorScheme.tertiary,
                            finishedStepTextColor: Colors.transparent,
                            internalPadding: 0,
                            showLoadingAnimation: false,
                            stepRadius: 10,
                            showStepBorder: false,
                            lineThickness: 0.7,
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
                      ),
                    ),
                    // PositionedDirectional(
                    //     bottom: 35,
                    //     end: 50,
                    // child: Row(
                    //   children: [
                    //     coloredText(
                    //         text: "next".tr,
                    //         fontSize: 16.0.sp,
                    //         color: Theme.of(context).colorScheme.tertiary),
                    //     spaceX(10),
                    //     GestureDetector(
                    //       onTap: () {
                    //         if (_currentStep < stepList().length - 1) {
                    //           setState(() => _currentStep += 1);
                    //           pageController.jumpToPage(_currentStep);
                    //         } else {
                    //           completedRegisterFlag = true;
                    //         }

                    //         logSuccess(_currentStep);
                    //         setState(() {});
                    //       },
                    //       child: Container(
                    //         padding: const EdgeInsets.all(15),
                    //         decoration: BoxDecoration(
                    //           shape: BoxShape.circle,
                    //           gradient: LinearGradient(
                    //             begin: AlignmentDirectional.topStart,
                    //             end: AlignmentDirectional.bottomEnd,
                    //             colors: [
                    //               Theme.of(context).colorScheme.primary,
                    //               Theme.of(context).colorScheme.secondary,
                    //             ],
                    //           ),
                    //         ),
                    //         child: const Icon(
                    //           FontAwesomeIcons.anglesRight,
                    //           color: Colors.white,
                    //           size: 22,
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // )),
                    PositionedDirectional(
                      top: 40,
                      start: 30,
                      child: GestureDetector(
                        onTap: () {
                          if (_currentStep == 2) {
                            _currentStep -= 1;
                            setState(() {});
                            pageController.jumpToPage(_currentStep);
                          } else if (_currentStep == 0) {
                            Get.back();
                            setState(() {});
                          } else {
                            _currentStep -= 1;
                            pageController.jumpToPage(_currentStep);
                            setState(() {});
                          }
                          logSuccess(_currentStep);
                        },
                        child: Icon(
                          Icons.arrow_back,
                          color: Theme.of(context).colorScheme.primary,
                          size: 22.0.sp,
                        ),
                      ),
                    ),
                    Positioned.fill(
                        top: 40,
                        child: Align(
                          alignment: AlignmentDirectional.topCenter,
                          child: coloredText(
                            text: "complete_data".tr,
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 14.0.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ))
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> get pageList => [
        Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(padding: EdgeInsets.zero, primary: false, children: [
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
            spaceY(20.0.sp),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                coloredText(
                    text: "next".tr,
                    fontSize: 16.0.sp,
                    color: Theme.of(context).colorScheme.tertiary),
                spaceX(10),
                GestureDetector(
                  onTap: () {
                    if (_currentStep < stepList().length - 1) {
                      setState(() => _currentStep += 1);
                      pageController.jumpToPage(_currentStep);
                    } else {
                      completedRegisterFlag = true;
                    }

                    logSuccess(_currentStep);
                    setState(() {});
                  },
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        begin: AlignmentDirectional.topStart,
                        end: AlignmentDirectional.bottomEnd,
                        colors: [
                          Theme.of(context).colorScheme.primary,
                          Theme.of(context).colorScheme.secondary,
                        ],
                      ),
                    ),
                    child: const Icon(
                      FontAwesomeIcons.anglesRight,
                      color: Colors.white,
                      size: 22,
                    ),
                  ),
                ),
              ],
            ),
            spaceY(20.0.sp),
          ]),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
              primary: false,
              padding: const EdgeInsets.all(0),
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
                spaceY(20.0.sp),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    coloredText(
                        text: "next".tr,
                        fontSize: 16.0.sp,
                        color: Theme.of(context).colorScheme.tertiary),
                    spaceX(10),
                    GestureDetector(
                      onTap: () {
                        if (_currentStep < stepList().length - 1) {
                          setState(() => _currentStep += 1);
                          pageController.jumpToPage(_currentStep);
                        } else {
                          completedRegisterFlag = true;
                        }

                        logSuccess(_currentStep);
                        setState(() {});
                      },
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            begin: AlignmentDirectional.topStart,
                            end: AlignmentDirectional.bottomEnd,
                            colors: [
                              Theme.of(context).colorScheme.primary,
                              Theme.of(context).colorScheme.secondary,
                            ],
                          ),
                        ),
                        child: const Icon(
                          FontAwesomeIcons.anglesRight,
                          color: Colors.white,
                          size: 22,
                        ),
                      ),
                    ),
                  ],
                ),
                spaceY(20.0.sp),
              ]),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(primary: false, padding: EdgeInsets.zero, children: [
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
            spaceY(25.0.sp),
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35),
                  color:
                      Theme.of(context).colorScheme.secondary.withOpacity(0.13),
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
            spaceY(20.0.sp),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                coloredText(
                    text: "next".tr,
                    fontSize: 16.0.sp,
                    color: Theme.of(context).colorScheme.tertiary),
                spaceX(10),
                GestureDetector(
                  onTap: () {
                    if (_currentStep < stepList().length - 1) {
                      setState(() => _currentStep += 1);
                      pageController.jumpToPage(_currentStep);
                    } else {
                      completedRegisterFlag = true;
                    }

                    logSuccess(_currentStep);
                    setState(() {});
                  },
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        begin: AlignmentDirectional.topStart,
                        end: AlignmentDirectional.bottomEnd,
                        colors: [
                          Theme.of(context).colorScheme.primary,
                          Theme.of(context).colorScheme.secondary,
                        ],
                      ),
                    ),
                    child: const Icon(
                      FontAwesomeIcons.anglesRight,
                      color: Colors.white,
                      size: 22,
                    ),
                  ),
                ),
              ],
            ),
            spaceY(20.0.sp),
          ]),
        ),
      ];
  List<EasyStep> stepList() => [
        EasyStep(
          customStep: CircleAvatar(
            radius: 10,
            backgroundColor: _currentStep >= 0
                ? Theme.of(context).colorScheme.tertiary
                : Colors.grey,
            child: const CircleAvatar(
              radius: 3,
              backgroundColor: Colors.white,
            ),
          ),
          title: _currentStep == 0 ? "personal_info".tr : "",
        ),
        EasyStep(
          customStep: CircleAvatar(
            radius: 10,
            backgroundColor: _currentStep >= 1
                ? Theme.of(context).colorScheme.tertiary
                : Colors.grey,
            child: const CircleAvatar(
              radius: 3,
              backgroundColor: Colors.white,
            ),
          ),
          title: _currentStep == 1 ? 'address_info'.tr : "",
        ),
        EasyStep(
          customStep: CircleAvatar(
            radius: 10,
            backgroundColor: _currentStep >= 2
                ? Theme.of(context).colorScheme.tertiary
                : Colors.grey,
            child: const CircleAvatar(
              radius: 3,
              backgroundColor: Colors.white,
            ),
          ),
          title: _currentStep == 2 ? 'id_proof'.tr : "",
        ),
      ];
}
