import 'dart:math';
import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart'; // ignore_for_file: must_be_immutable
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

import '../../Themes/themes.dart';
import '../../Utils/utils.dart';
import '../../widgets/dropdown_menu_button.dart';
import '../../widgets/radio_button.dart';
import '../../widgets/underline_text_field.dart';
import '../Notifications/notifications_page.dart';
import '../chat%20page/messages_page.dart';
import '../personal%20page/personal_page.dart';
import 'cleaning%20companies/cleaning_companies_search_page.dart';
import 'employees.dart/employees_search_page.dart';
import 'recruitment-companies/recruitment_companies_search_page.dart';

class CompanyHomePage extends StatefulWidget {
  const CompanyHomePage({super.key});

  @override
  State<CompanyHomePage> createState() => _CompanyHomePageState();
}

class _CompanyHomePageState extends State<CompanyHomePage> {
  PageController pageController = PageController(initialPage: 0);
  int idPassRradio = 0;

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
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _companyNameEnController =
      TextEditingController();
  final TextEditingController _companyNameArController =
      TextEditingController();
  final TextEditingController _companyPhoneNumberController =
      TextEditingController();
  final TextEditingController _nationallityController = TextEditingController();
  final TextEditingController _pieceNumberController = TextEditingController();
  final TextEditingController _streetController = TextEditingController();
  final TextEditingController _buildingController = TextEditingController();
  final TextEditingController _adnController = TextEditingController();
  final TextEditingController _idNumController = TextEditingController();
  final TextEditingController _crnController = TextEditingController();
  final TextEditingController _taxController = TextEditingController();
  final TextEditingController _licenseController = TextEditingController();

  final List<FocusNode> _focusNodes = List.generate(20, (index) => FocusNode());
  @override
  void initState() {
    h2 = 100.0.h;
    h = 75.0.h;
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
                      )
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
                clipper: _currentStep == 1 ? null : OvalBottomBorderClipper(),
                child: Stack(
                  children: [
                    Container(
                      width: 100.0.w,
                      height: _currentStep == 1 ? h2 : h,
                      color: Colors.white,
                      // duration: const Duration(milliseconds: 250),
                      child: Column(
                        children: [
                          spaceY(100),
                          EasyStepper(
                            activeStep: _currentStep,
                            lineLength: 20.0.w,
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
                      cupertinoDatePickerMinimumYear: 1990,
                      cupertinoDatePickerMinimumDate: DateTime.now(),
                      cupertinoDateInitialDateTime: DateTime.now(),
                      materialDatePickerFirstDate: DateTime.now(),
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
          child: ListView(padding: EdgeInsets.zero, primary: false, children: [
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
                    groupValue: idPassRradio,
                    value: 0,
                    onChanged: (p0) {
                      setState(() {
                        idPassRradio = 0;
                      });
                    },
                  ),
                  spaceX(20),
                  MyRadioButton(
                    color: Colors.black,
                    text: "Passport",
                    groupValue: idPassRradio,
                    value: 1,
                    onChanged: (p0) {
                      setState(() {
                        idPassRradio = 1;
                      });
                    },
                  )
                ],
              ),
              spaceY(20),
              idPassRradio == 0
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
              idPassRradio == 1
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
              idPassRradio == 1 ? Container() : spaceY(10),
              idPassRradio == 1
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
            ],
          ),
        ),
      ];
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
      ];
}
