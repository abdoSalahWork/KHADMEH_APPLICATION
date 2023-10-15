// ignore_for_file: unused_field

import 'dart:math' as math; // import this
import 'dart:math';
import 'dart:ui';

import 'package:badges/badges.dart' as badges;
import 'package:dotted_border/dotted_border.dart' as db;
import 'package:easy_stepper/easy_stepper.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:iban/iban.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:khedma/Admin/controllers/admin_controller.dart';
import 'package:khedma/Admin/pages/jobs/controller/jobs_controller.dart';
import 'package:khedma/Pages/HomePage/company%20home/company_personal_page.dart';
import 'package:khedma/Pages/HomePage/company%20home/company_services.dart';
import 'package:khedma/Pages/HomePage/controllers/employees_controller.dart';
import 'package:khedma/Pages/Notifications/controller/notofication_controller.dart';
import 'package:khedma/Pages/chat%20page/controller/chat_controller.dart';
import 'package:khedma/Pages/global_controller.dart';
import 'package:khedma/Pages/log-reg%20pages/controller/auth_controller.dart';
import 'package:khedma/Pages/log-reg%20pages/models/company_register_model.dart';
import 'package:khedma/Utils/notification_service.dart';
import 'package:khedma/widgets/company_request.dart';
import 'package:khedma/widgets/no_items_widget.dart';
import 'package:line_icons/line_icons.dart';
import 'package:restart_app/restart_app.dart';
// import 'package:pusher_client/pusher_client.dart';
import 'package:sizer/sizer.dart';
import 'package:textfield_datepicker/textfield_datepicker.dart';

import './add_advertisement_page.dart';
import '../../../Themes/themes.dart';
import '../../../Utils/utils.dart';
import '../../../widgets/dropdown_menu_button.dart';
import '../../../widgets/radio_button.dart';
import '../../../widgets/underline_text_field.dart';
import '../../Notifications/notifications_page.dart';
import '../../chat%20page/messages_page.dart';
import 'add_employee_page.dart';
import 'company_employees.dart';

class CompanyHomePage extends StatefulWidget {
  const CompanyHomePage({super.key});

  @override
  State<CompanyHomePage> createState() => _CompanyHomePageState();
}

class _CompanyHomePageState extends State<CompanyHomePage>
    with SingleTickerProviderStateMixin {
  PageController pageController = PageController(initialPage: 0);

  ChatController _chatController = Get.find();
  var errors = {};
  String ownerNationality = "";
  String bankName = "";
  String companyType = "recruitment";
  String logobuttonText = "upload_company_logo".tr;
  String frontIdButton = "upload_front_side_of_id".tr;
  String backIdButton = "upload_back_side_of_id".tr;
  String passportButton = "upload_your_passport".tr;
  String city = "";
  String region = "";
  int idPassRadio = 0;
  CompanyRegisterData companyCompleteData = CompanyRegisterData();

  bool completedRegisterFlag = false;
  int _currentStep = 0;

  late double h;
  late double h2;
  late double h3;

  tapped(int step) {
    setState(() => _currentStep = step);
  }

  cancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  }

  final formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _bankAccountName = TextEditingController();
  final TextEditingController _iban = TextEditingController();
  final TextEditingController _accountNumber = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _urlController = TextEditingController();

  final TextEditingController _ownerPhoneNumberController =
      TextEditingController();
  final TextEditingController _companyNameEnController =
      TextEditingController();

  final TextEditingController _companyPhoneNumberController =
      TextEditingController();
  final TextEditingController _pieceNumberController = TextEditingController();
  final TextEditingController _streetController = TextEditingController();
  final TextEditingController _buildingController = TextEditingController();
  final TextEditingController _adnController = TextEditingController();
  final TextEditingController _idNumController = TextEditingController();
  final TextEditingController _crnController = TextEditingController();
  final TextEditingController _taxController = TextEditingController();
  final TextEditingController _licenseController = TextEditingController();
  final GlobalController _globalController = Get.find();
  final AuthController _authController = Get.find();
  final List<FocusNode> _focusNodes = List.generate(24, (index) => FocusNode());

  final NotificationService notificationService = Utils.notificationService;
  final JobsController _jobsController = Get.find();
  EmployeesController _employeesController = Get.find();
  String meCompanyType = "recruitment";
  // AddressessController _adressControllerController = Get.find();
  List<String> tabsRecruitment = [
    "employees_requests",
    "reservation_requests",
  ];
  List<String> tabsCleaning = [
    "bookings",
    "history",
  ];
  late TabController tabController;
  int selectedTabIndex = 0;
  final AdminController _adminController = Get.find();

  Future getAllThings() async {
    await _adminController.getSettingAdmin();
    await _globalController.setLocale();
    await _globalController.getComplexion();
    await _globalController.getRelegions();
    await _globalController.getMaritalStatuss();
    await _globalController.getCertificates();
    await _globalController.getlanguages();
    await _globalController.getjobs();
    await _adminController.getContacts();
    await _adminController.getAbouts();
    await _globalController.getCategories();
  }

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    if (_globalController.me.companyInformation != null) {
      meCompanyType = _globalController.me.companyInformation!.companyType!;
    }
    logError(meCompanyType);
    _employeesController.getCompanyEmployees();
    meCompanyType == "recruitment"
        ? _globalController.getRecruitmentCompanyHomePage()
        : _globalController.getCleanCompanyHomePage();
    getAllThings();
    completedRegisterFlag = _globalController.me.companyInformation != null;

    _chatController.getChats();
    notificationService.initializePlatformNotifications();

    _globalController.getjobs();

    h2 = 100.0.h;
    h = 75.0.h;
    h3 = 65.0.h;
    for (var node in _focusNodes) {
      node.addListener(() {
        setState(() {});
      });
    }

    // pusher = PusherClient(
    //   "e9cb090a00d813850650",
    //   PusherOptions(
    //     // if local on android use 10.0.2.2
    //     // host: 'https://khdmah.online',
    //     cluster: "eu",
    //     encrypted: true,
    //     // auth: PusherAuth(
    //     //   'https://khdmah.online/api/pusher/auth',
    //     //   headers: {
    //     //     'Authorization':
    //     //         'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvd2F6emZueS5vbmxpbmVcL2FwaVwvbG9naW4iLCJpYXQiOjE2OTMwNTM4MjYsImV4cCI6MTY5MzA1NzQyNiwibmJmIjoxNjkzMDUzODI2LCJqdGkiOiJoMTJaeEowN2g3NjJRNWRzIiwic3ViIjo0LCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3Iiwicm9sZV90eXBlIjoidXNlciIsImNvbXBsaXRlX2RhdGEiOnRydWV9.qSFSmGHFx9XHjlTtVuILNvtLTxRAutZnnNcv7IzKgpQ',
    //     //   },
    //     // ),
    //   ),
    //   enableLogging: true,
    // );

    // channel = pusher.subscribe("orders3");

    // pusher.onConnectionStateChange((state) {
    //   logWarning(
    //       "previousState: ${state!.previousState}, currentState: ${state.currentState}");
    // });

    // pusher.onConnectionError((error) {
    //   logWarning("error: ${error!.message}");
    // });

    // channel.bind('status-update', (PusherEvent? event) {
    //   logWarning(event!.data!);
    // });

    // // channel.bind('order-filled', (event) {
    // //   logWarning("Order Filled Event" + event!.data.toString());
    // // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: !completedRegisterFlag
          ? null
          : Theme(
              data: ThemeData(
                useMaterial3: false,
              ),
              child: FloatingActionButton(
                onPressed: meCompanyType != "recruitment"
                    ? () {
                        int price = 0;
                        int serviceId = 0;
                        Utils.showDialogBox(
                            context: context,
                            actions: [
                              primaryButton(
                                onTap: () async {
                                  FocusScope.of(context).unfocus();
                                  bool b = await _globalController
                                      .createCompanyService(
                                          id: serviceId, price: price);
                                  if (b)
                                    Utils.doneDialog(
                                        context: context, backTimes: 2);
                                },
                                width: 40.0.w,
                                height: 50,
                                radius: 10.w,
                                color: Colors.black,
                                text: coloredText(
                                  text: "submit".tr,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                            content: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                coloredText(text: "choose_service".tr),
                                spaceY(5.sp),
                                CustomDropDownMenuButtonV2(
                                  hintPadding: 0,
                                  focusNode: FocusNode(),
                                  fillColor: const Color(0xffF8F8F8),
                                  filled: true,
                                  width: 100.w,
                                  items: _globalController.categories
                                      .map(
                                        (e) => DropdownMenuItem<String>(
                                          value: Get.locale ==
                                                  const Locale('en', 'US')
                                              ? e.nameEn!
                                              : e.nameAr!,
                                          child: coloredText(
                                              text: Get.locale ==
                                                      const Locale('en', 'US')
                                                  ? e.nameEn!
                                                  : e.nameAr!,
                                              color: Colors.black),
                                        ),
                                      )
                                      .toList(),
                                  border: null,
                                  onChanged: (p0) {
                                    serviceId = _globalController.categories
                                        .where((element) =>
                                            element.nameAr == p0 ||
                                            element.nameEn == p0)
                                        .first
                                        .id!;
                                  },
                                  borderRadius: 10,
                                ),
                                coloredText(text: "price".tr),
                                spaceY(5.sp),
                                SendMessageTextField(
                                  suffixIcon: Utils.kwdSuffix("KWD"),
                                  borderRadius: 5,
                                  keyBoardType: TextInputType.number,
                                  focusNode: FocusNode(),
                                  onchanged: (s) {
                                    if (s != null && s != "")
                                      price = int.parse(s);
                                  },
                                )
                              ],
                            ));
                      }
                    : () {
                        Get.to(
                          () => const AddEmployeePage(),
                        );
                      },
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      begin: AlignmentDirectional.bottomStart,
                      end: AlignmentDirectional.topEnd,
                      colors: [
                        Theme.of(context).colorScheme.primary,
                        Theme.of(context).colorScheme.secondary
                      ],
                    ),
                  ),
                  width: 60,
                  height: 60,
                  child: const Icon(
                    EvaIcons.plus,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
      body: Stack(
        children: [
          Visibility(
            visible: completedRegisterFlag,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 55,
              ),
              child: GetBuilder<GlobalController>(builder: (c) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        meCompanyType == "cleaning"
                            ? GestureDetector(
                                onTap: () =>
                                    Get.to(() => const CompanyServicesPage()),
                                child: Icon(
                                  EvaIcons.grid,
                                  color: const Color(0xffD1D1D1),
                                  size: 25.0.sp,
                                ),
                              )
                            : GestureDetector(
                                onTap: () =>
                                    Get.to(() => CompanyEmployeesSearchPage()),
                                child: Icon(
                                  EvaIcons.people,
                                  color: const Color(0xffD1D1D1),
                                  size: 25.0.sp,
                                ),
                              ),
                        spaceX(10),
                        GetBuilder<NotificationController>(builder: (c) {
                          return badges.Badge(
                            showBadge: c.newNotifications,
                            position:
                                badges.BadgePosition.topEnd(top: 0, end: 0),
                            child: GestureDetector(
                              onTap: () => Get.to(
                                () => NotificationsPage(),
                              ),
                              child: Icon(
                                EvaIcons.bell,
                                color: const Color(0xffD1D1D1),
                                size: 25.0.sp,
                              ),
                            ),
                          );
                        }),
                        spaceX(10),
                        GetBuilder<ChatController>(builder: (chatController) {
                          return badges.Badge(
                            showBadge: chatController.unreadChatsFlag,
                            position:
                                badges.BadgePosition.topEnd(top: 0, end: 0),
                            child: GestureDetector(
                              child: Icon(
                                EvaIcons.messageCircle,
                                color: const Color(0xffD1D1D1),
                                size: 22.0.sp,
                              ),
                              onTap: () => Get.to(() => const MessagesPage()),
                            ),
                          );
                        }),
                        spaceX(10),
                        GestureDetector(
                          onTap: () => Get.to(
                            () => const CompanyPersonalPage(),
                          ),
                          child: Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              // border: Border.all(
                              //   width: 1,
                              //   color: const Color(0xffD1D1D1),
                              // ),
                              image: DecorationImage(
                                image: NetworkImage(_globalController
                                    .me.companyInformation!.companyLogo!),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: c.getCompanyHomePageFlag
                          ? const Center(child: CircularProgressIndicator())
                          : Column(
                              children: [
                                spaceY(1.5.h),
                                GestureDetector(
                                  onTap: () {
                                    Get.to(() => const AddAdvertismentPage());
                                  },
                                  child: Container(
                                    width: 100.w,
                                    height: 40.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      image: const DecorationImage(
                                          image: AssetImage(
                                              "assets/images/adv_background.png"),
                                          fit: BoxFit.cover),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        coloredText(
                                          text: "add_your".tr,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16.sp,
                                          color: Colors.white,
                                        ),
                                        spaceY(10),
                                        coloredText(
                                          text: "ad".tr,
                                          textstyle: TextStyle(
                                            fontSize: 24.sp,
                                            color: Colors.white,
                                            fontFamily: "Gabriola",
                                            fontStyle: FontStyle.normal,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                meCompanyType != "recruitment"
                                    ? Container()
                                    : spaceY(10),
                                meCompanyType != "recruitment"
                                    ? Container()
                                    : GestureDetector(
                                        onTap: () {
                                          // Utils.showBigTextNotification(
                                          //     title: "title",
                                          //     body: "body",
                                          //     fln: Utils.flutterLocalNotificationsPlugin);
                                        },
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional.centerStart,
                                          child: coloredText(
                                              text: "overview".tr,
                                              fontSize: 16.0.sp),
                                        ),
                                      ),
                                meCompanyType != "recruitment"
                                    ? Container()
                                    : SizedBox(
                                        height: 30.w,
                                        child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (ctx, index) =>
                                              Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.3),
                                                  spreadRadius: 2,
                                                  blurRadius: 3,
                                                  offset: const Offset(0,
                                                      0), // changes position of shadow
                                                ),
                                              ],
                                            ),
                                            width: 45.w,
                                            height: 25.w,
                                            margin: const EdgeInsets.symmetric(
                                              vertical: 10,
                                              horizontal: 10,
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                coloredText(
                                                  text: c.overView[index].number
                                                      .toString(),
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .secondary,
                                                  fontSize: 14.sp,
                                                ),
                                                spaceY(10),
                                                coloredText(
                                                  text:
                                                      c.overView[index].string,
                                                  fontSize: 14.sp,
                                                ),
                                              ],
                                            ),
                                          ),
                                          itemCount: c.overView.length,
                                        ),
                                      ),
                                spaceY(10),
                                // Align(
                                //   alignment: AlignmentDirectional.centerStart,
                                //   child: coloredText(
                                //       text: "requests".tr, fontSize: 15.sp),
                                // ),
                                meCompanyType != "recruitment"
                                    ? TabBar(
                                        dividerColor: Colors.grey,
                                        // indicatorColor: Colors.black,
                                        indicator: UnderlineTabIndicator(
                                            borderSide: BorderSide(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                        )),
                                        indicatorSize: TabBarIndicatorSize.tab,
                                        labelPadding: EdgeInsets.zero,
                                        // isScrollable: true,
                                        controller: tabController,
                                        onTap: (value) {
                                          selectedTabIndex = value;
                                          setState(() {});
                                        },
                                        tabs: List<Widget>.generate(
                                          tabController.length,
                                          (index) => Tab(
                                            child: Container(
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 5),
                                              child: coloredText(
                                                  fontSize: 10.sp,
                                                  text: tabsCleaning[index].tr,
                                                  color:
                                                      selectedTabIndex == index
                                                          ? Colors.black
                                                          : Colors.grey),
                                            ),
                                          ),
                                        ))
                                    : TabBar(
                                        dividerColor: Colors.grey,
                                        // indicatorColor: Colors.black,
                                        indicator: UnderlineTabIndicator(
                                            borderSide: BorderSide(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                        )),
                                        indicatorSize: TabBarIndicatorSize.tab,
                                        labelPadding: EdgeInsets.zero,
                                        // isScrollable: true,
                                        controller: tabController,
                                        onTap: (value) {
                                          selectedTabIndex = value;
                                          setState(() {});
                                        },
                                        tabs: List<Widget>.generate(
                                          tabController.length,
                                          (index) => Tab(
                                            child: Container(
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 5),
                                              child: coloredText(
                                                  fontSize: 10.sp,
                                                  text:
                                                      tabsRecruitment[index].tr,
                                                  color:
                                                      selectedTabIndex == index
                                                          ? Colors.black
                                                          : Colors.grey),
                                            ),
                                          ),
                                        )),
                                // meCompanyType != "recruitment"
                                //     ? spaceY(10.sp)
                                //     : Container(),

                                Expanded(
                                    child: meCompanyType != "recruitment"
                                        ? TabBarView(
                                            controller: tabController,
                                            children: tapCleaningList)
                                        : TabBarView(
                                            controller: tabController,
                                            children: tapRecruitmentList)),
                                // Expanded(
                                //   child:         )
                              ],
                            ),
                    ),
                  ],
                );
              }),
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
                      height: _currentStep == 0
                          ? h
                          : _currentStep == 1
                              ? h2
                              : h3,
                      color: Colors.white,
                      // duration: const Duration(milliseconds: 250),
                      child: Column(
                        children: [
                          spaceY(100),
                          EasyStepper(
                            activeStep: _currentStep,
                            lineLength: 15.0.w,
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
                                children: pageList,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
                    hintText: "first_name".tr,
                    prefixIcon: Icon(
                      EvaIcons.personOutline,
                      size: 20.0.sp,
                    ),
                    autovalidateMode: AutovalidateMode.always,
                    onchanged: (s) {
                      errors['first_name'] = null;
                      setState(() {});
                      companyCompleteData.firstName = s;
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
                    hintText: "last_name".tr,
                    prefixIcon: Icon(
                      EvaIcons.personOutline,
                      size: 20.0.sp,
                    ),
                    autovalidateMode: AutovalidateMode.always,
                    onchanged: (s) {
                      errors['last_name'] = null;
                      setState(() {});
                      companyCompleteData.lastName = s;
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
                  companyCompleteData.phone = s;
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
                  margin: const EdgeInsetsDirectional.only(start: 10, end: 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        EvaIcons.phoneOutline,
                        size: 20.0.sp,
                      ),
                      spaceX(5.sp),
                      coloredText(text: "+965", color: Colors.grey)
                    ],
                  ),
                ),
                hintText: "phone_number".tr,
              ),
              spaceY(10.0.sp),
              CustomDropDownMenuButton(
                hintPadding: 0, focusNode: _focusNodes[3],
                hint: "nationality".tr,
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
                        value: Get.locale == const Locale('en', 'US')
                            ? e.nameEn!
                            : e.nameAr!,
                        child: coloredText(
                            text: Get.locale == const Locale('en', 'US')
                                ? e.nameEn!
                                : e.nameAr!,
                            color: Colors.black),
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
                  companyCompleteData.nationalityId = c.countries
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
              spaceY(10.0.sp),
              UnderlinedCustomTextField(
                focusNode: _focusNodes[4],
                controller: _idNumController,
                keyBoardType: TextInputType.number,
                prefixIcon: Icon(FontAwesomeIcons.idCard, size: 16.0.sp),
                hintText: "id_number".tr,
                autovalidateMode: AutovalidateMode.always,
                onchanged: (s) {
                  errors['id_number'] = null;
                  setState(() {});
                  companyCompleteData.idNumber = s;
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
                    text: "date_of_birth".tr,
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
                      }

                      logSuccess(_currentStep);
                      setState(() {});
                    },
                    child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationY(
                          Get.locale == const Locale('en', 'US') ? 0 : math.pi),
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
                  ),
                ],
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
                    height: 42.sp,
                    radius: 10,
                    onTap: () async {
                      XFile? image = await Utils().selectImageSheet();

                      if (image != null) {
                        setState(() {});

                        logobuttonText =
                            image.name.substring(0, min(15, image.name.length));
                        companyCompleteData.companyLogo = image;
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
                      text: "general_info".tr,
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
                hintText: "company_name".tr,
                autovalidateMode: AutovalidateMode.always,
                onchanged: (s) {
                  errors['company_name'] = null;
                  setState(() {});
                  companyCompleteData.companyName = s;
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
              spaceY(10.0.sp),
              UnderlinedCustomTextField(
                focusNode: _focusNodes[8],
                controller: _companyPhoneNumberController,
                keyBoardType: TextInputType.number,
                autovalidateMode: AutovalidateMode.always,
                onchanged: (s) {
                  errors['company_phone'] = null;
                  setState(() {});
                  companyCompleteData.companyPhone = s;
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
                  margin: const EdgeInsetsDirectional.only(start: 10, end: 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        EvaIcons.phoneOutline,
                        size: 20.0.sp,
                      ),
                      spaceX(5.sp),
                      coloredText(text: "+965", color: Colors.grey)
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
                  companyCompleteData.companyEmail = s;
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
                hintText: "${"url".tr} ( ${"optional".tr}${" )".tr}",
                autovalidateMode: AutovalidateMode.always,
                onchanged: (s) {
                  errors['url'] = null;
                  setState(() {});
                  companyCompleteData.url = s;
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
                    text: '${"company_type".tr} :',
                  ),
                  spaceX(15),
                  CustomDropDownMenuButton(
                    fillColor: const Color(0xffF5F5F5),
                    padding: const EdgeInsetsDirectional.only(end: 5, start: 5),
                    width: 40.0.w,
                    height: 38.sp,
                    contentPadding: 10,
                    borderRadius: BorderRadius.circular(10),
                    value: companyType == "" ? null : companyType,
                    items: ["recruitment", "cleaning"]
                        .map(
                          (e) => DropdownMenuItem<String>(
                            value: e,
                            child: coloredText(text: e.tr),
                          ),
                        )
                        .toList(),
                    onChanged: (p0) {
                      companyType = p0!;
                      companyCompleteData.companyType = p0;
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
                      text: "address_info".tr,
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
                    value: city == "" ? null : city,
                    items: c.cities
                        .map((e) => DropdownMenuItem<String>(
                              value: Get.locale == const Locale('en', 'US')
                                  ? e.nameEn!
                                  : e.nameAr,
                              child: coloredText(
                                text: Get.locale == const Locale('en', 'US')
                                    ? e.nameEn!
                                    : e.nameAr!,
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
                      companyCompleteData.cityId = c.cities
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
                              value: Get.locale == const Locale('en', 'US')
                                  ? e.nameEn!
                                  : e.nameAr,
                              child: coloredText(
                                text: Get.locale == const Locale('en', 'US')
                                    ? e.nameEn!
                                    : e.nameAr!,
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
                      companyCompleteData.regionId = c.regions
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
                  companyCompleteData.pieceNumber = s;
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
                  companyCompleteData.street = s;
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
                  companyCompleteData.building = s;
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
                  companyCompleteData.automatedAddressNumber = s;
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
                      text: "work_info".tr,
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
                hintText: "commercial_reg_number".tr,
                autovalidateMode: AutovalidateMode.always,
                onchanged: (s) {
                  errors['commercial_registration_number'] = null;
                  setState(() {});
                  companyCompleteData.commercialRegistrationNumber = s;
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
                hintText: "tax_number".tr,
                autovalidateMode: AutovalidateMode.always,
                onchanged: (s) {
                  errors['tax_number'] = null;
                  setState(() {});
                  companyCompleteData.taxNumber = s;
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
                hintText: "license_number".tr,
                autovalidateMode: AutovalidateMode.always,
                onchanged: (s) {
                  errors['license_number'] = null;
                  setState(() {});
                  companyCompleteData.licenseNumber = s;
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
                      }

                      logSuccess(_currentStep);
                      setState(() {});
                    },
                    child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationY(
                          Get.locale == const Locale('en', 'US') ? 0 : math.pi),
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
                  ),
                ],
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
                  text: "identity_confirmation_by".tr,
                ),
                Row(
                  children: [
                    MyRadioButton(
                      color: Colors.black,
                      text: "id".tr,
                      groupValue: idPassRadio,
                      value: 0,
                      onChanged: (p0) {
                        setState(() {
                          companyCompleteData.identityConfirmation = "id";

                          passportButton = "Upload_your_passport".tr;
                          idPassRadio = 0;
                          companyCompleteData.passportImage = null;
                          setState(() {});
                        });
                      },
                    ),
                    spaceX(20),
                    MyRadioButton(
                      color: Colors.black,
                      text: "passport".tr,
                      groupValue: idPassRadio,
                      value: 1,
                      onChanged: (p0) {
                        setState(() {
                          companyCompleteData.identityConfirmation = "passport";
                          idPassRadio = 1;
                          companyCompleteData.frontSideIdImage = null;
                          companyCompleteData.backSideIdImage = null;
                          frontIdButton = "upload_front_side_of_id".tr;
                          backIdButton = "upload_back_side_of_id".tr;
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
                          XFile? image = await Utils().selectImageSheet();

                          if (image != null) {
                            setState(() {});

                            passportButton = image.name
                                .substring(0, min(15, image.name.length));
                            companyCompleteData.passportImage = image;
                            setState(() {});
                          }
                        },
                        color: const Color(0xffF5F5F5),
                        width: 100.0.w,
                        height: 42.sp,
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
                          XFile? image = await Utils().selectImageSheet();

                          if (image != null) {
                            setState(() {});

                            frontIdButton = image.name
                                .substring(0, min(15, image.name.length));
                            companyCompleteData.frontSideIdImage = image;
                            setState(() {});
                          }
                        },
                        color: const Color(0xffF5F5F5),
                        width: 100.0.w,
                        height: 42.sp,
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
                          XFile? image = await Utils().selectImageSheet();

                          if (image != null) {
                            setState(() {});

                            backIdButton = image.name
                                .substring(0, min(15, image.name.length));
                            companyCompleteData.backSideIdImage = image;
                            setState(() {});
                          }
                        },
                        color: const Color(0xffF5F5F5),
                        width: 100.0.w,
                        height: 42.sp,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    coloredText(
                        text: "next".tr,
                        fontSize: 16.0.sp,
                        color: Theme.of(context).colorScheme.tertiary),
                    spaceX(10),
                    GestureDetector(
                      onTap: () async {
                        if (_currentStep < stepList().length - 1) {
                          setState(() => _currentStep += 1);
                          pageController.jumpToPage(_currentStep);
                        }

                        setState(() {});
                      },
                      child: Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.rotationY(
                            Get.locale == const Locale('en', 'US')
                                ? 0
                                : math.pi),
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
                    ),
                  ],
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
              CustomDropDownMenuButton(
                hintPadding: 0, focusNode: _focusNodes[20],
                hint: "bank_name".tr,
                autovalidateMode: AutovalidateMode.always,
                validator: (String? value) {
                  if (errors['bank_id'] != null) {
                    String tmp = "";
                    tmp = errors['bank_id'].join("\n");

                    return tmp;
                  }
                  return null;
                },
                width: 100.w,
                value: bankName == "" ? null : bankName,
                items: c.banks
                    .map(
                      (e) => DropdownMenuItem<String>(
                        value: e.bankName,
                        child:
                            coloredText(text: e.bankName!, color: Colors.black),
                      ),
                    )
                    .toList(),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: _focusNodes[20].hasFocus
                        ? Theme.of(context).colorScheme.secondary
                        : const Color(0xffBDC1C8),
                  ),
                ),
                onChanged: (p0) {
                  bankName = p0!;
                  errors['bank_id'] = null;
                  setState(() {});
                  companyCompleteData.bankId = c.banks
                      .where((element) => element.bankName == p0)
                      .first
                      .bankId
                      .toString();
                  ;
                },

                // borderc: Border.all(color: const Color(0xffE3E3E3)),
                borderRadius: BorderRadius.circular(8),
                // padding:
                //     const EdgeInsetsDirectional.symmetric(horizontal: 10),
              ),
              spaceY(10.0.sp),
              UnderlinedCustomTextField(
                focusNode: _focusNodes[21],
                controller: _bankAccountName,
                hintText: "bank_account_name".tr,
                autovalidateMode: AutovalidateMode.always,
                onchanged: (s) {
                  errors['bank_account_name'] = null;
                  setState(() {});
                  companyCompleteData.bankAccountName = s;
                },
                validator: (String? value) {
                  if (errors['bank_account_name'] != null) {
                    String tmp = "";
                    tmp = errors['bank_account_name'].join("\n");

                    return tmp;
                  }
                  return null;
                },
              ),
              spaceY(10.sp),
              UnderlinedCustomTextField(
                keyBoardType: TextInputType.number,
                focusNode: _focusNodes[22],
                controller: _accountNumber,
                hintText: "account_number".tr,
                autovalidateMode: AutovalidateMode.always,
                onchanged: (s) {
                  errors['account_number'] = null;
                  setState(() {});
                  companyCompleteData.accountNumber = s;
                },
                validator: (String? value) {
                  if (errors['account_number'] != null) {
                    String tmp = "";
                    tmp = errors['account_number'].join("\n");

                    return tmp;
                  }
                  return null;
                },
              ),
              spaceY(10.sp),
              UnderlinedCustomTextField(
                focusNode: _focusNodes[23],
                controller: _iban,
                hintText: "iban".tr,
                autovalidateMode: AutovalidateMode.always,
                onchanged: (s) {
                  errors['iban'] = null;
                  setState(() {});
                  companyCompleteData.iban = s;
                },
                validator: (String? value) {
                  if (!isValid(value!)) return "invalid iban";
                  if (errors['iban'] != null) {
                    String tmp = "";
                    tmp = errors['iban'].join("\n");

                    return tmp;
                  }
                  return null;
                },
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
                    onTap: () async {
                      if (_currentStep < stepList().length - 1) {
                        setState(() => _currentStep += 1);
                        pageController.jumpToPage(_currentStep);
                      } else {
                        FocusScope.of(context).unfocus();
                        companyCompleteData.phone =
                            _ownerPhoneNumberController.text;
                        companyCompleteData.companyPhone =
                            _companyPhoneNumberController.text;
                        companyCompleteData.dateOfBirth = _dateController.text;
                        var x = await _authController.companycompleteData(
                            companyCompleteData: companyCompleteData);
                        if (x == true) {
                          // ignore: use_build_context_synchronously
                          Utils.customDialog(
                              actions: [
                                primaryButton(
                                  onTap: () {
                                    Get.back();
                                    completedRegisterFlag = true;
                                    Restart.restartApp();

                                    setState(() {});
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
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                      size: 40.sp,
                                    ),
                                    spaceY(20),
                                    coloredText(
                                        text:
                                            "your_data_have_been_completed".tr,
                                        fontSize: 12.0.sp),
                                    coloredText(
                                      text: "successfully".tr,
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
                          if (errors['first_name'] != null ||
                              errors['last_name'] != null ||
                              errors['phone'] != null ||
                              errors['nationality_id'] != null ||
                              errors['id_number'] != null ||
                              errors['date_of_birth'] != null) {
                            _currentStep = 0;
                            setState(() {});
                            pageController.jumpToPage(_currentStep);
                          } else if (errors['bank_account_name'] != null ||
                              errors['iban'] != null ||
                              errors['bank_id'] != null ||
                              errors['account_number'] != null) {
                            _currentStep = 3;
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
                              errors['commercial_registration_number'] !=
                                  null ||
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
                              Utils.showSnackBar(
                                  message: tmp, fontSize: 12.0.sp);
                            } else if (errors['company_logo'] != null) {
                              tmp = errors['company_logo'].join("\n");
                              Utils.showSnackBar(
                                  message: tmp, fontSize: 12.0.sp);
                            } else if (errors['company_type'] != null) {
                              tmp = errors['company_type'].join("\n");
                              Utils.showSnackBar(
                                  message: tmp, fontSize: 12.0.sp);
                            }
                          } else if (errors['front_side_id_image'] != null &&
                                  errors['back_side_id_image'] != null ||
                              errors['passport_image'] != null) {
                            _currentStep = 2;
                            setState(() {});
                            pageController.jumpToPage(_currentStep);
                            String tmp = "";
                            if (errors['passport_image'] != null) {
                              tmp = errors['passport_image'].join("\n");
                              Utils.showSnackBar(
                                  message: tmp, fontSize: 12.0.sp);
                            } else if (errors['front_side_id_image'] != null &&
                                errors['back_side_id_image'] != null) {
                              tmp = errors['front_side_id_image'].join("\n") +
                                  "\n" +
                                  errors['back_side_id_image'].join("\n");
                              Utils.showSnackBar(
                                  message: tmp, fontSize: 12.0.sp);
                            } else if (errors['back_side_id_image'] != null) {
                              tmp = errors['back_side_id_image'].join("\n");
                              Utils.showSnackBar(
                                  message: tmp, fontSize: 12.0.sp);
                            } else if (errors['front_side_id_image'] != null) {
                              tmp = errors['front_side_id_image'].join("\n");
                              Utils.showSnackBar(
                                  message: tmp, fontSize: 12.0.sp);
                            }
                          }
                        }
                      }
                      setState(() {});
                    },
                    child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationY(
                          Get.locale == const Locale('en', 'US') ? 0 : math.pi),
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
                  ),
                ],
              ),
              spaceY(20.0.sp),
            ]),
          );
        }),
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
          title: _currentStep == 3 ? 'bank_details'.tr : "",
        ),
      ];

  List<Widget> get tapRecruitmentList => [
        GetBuilder<GlobalController>(builder: (c) {
          return c.companyHomePage.requests!.isEmpty
              ? const Center(child: NoItemsWidget())
              : ListView.separated(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  itemBuilder: (ctx, index) => CompanyRequestWidget(
                    image: _globalController.companyHomePage.requests![index]
                        .user!.userInformation!.personalPhoto!,
                    userName: _globalController
                        .companyHomePage.requests![index].user!.fullName!,
                    employeeId: _globalController
                        .companyHomePage.requests![index].employeeId!,
                    docsId:
                        _globalController.companyHomePage.requests![index].id!,
                  ),
                  separatorBuilder: (ctx, index) => spaceY(10.sp),
                  itemCount: _globalController.companyHomePage.requests!.length,
                );
        }),
        GetBuilder<GlobalController>(builder: (c) {
          return c.getReservationRequestFlag
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : c.reservationRequests.isEmpty
                  ? const Center(child: NoItemsWidget())
                  : ListView.separated(
                      itemBuilder: (ctx, index) => ReservationRequestWidget(
                          reservationExtintionModel:
                              c.reservationRequests[index]),
                      separatorBuilder: (ctx, index) => spaceY(10.sp),
                      itemCount: c.reservationRequests.length);
        }),
      ];
  List<Widget> get tapCleaningList => [
        GetBuilder<GlobalController>(builder: (c) {
          return c.cleaningBookings.isEmpty
              ? const Center(child: NoItemsWidget())
              : ListView.separated(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  itemBuilder: (ctx, index) => CleanCompanyBookingWidget(
                      cleaningBooking: c.cleaningBookings[index]),
                  separatorBuilder: (ctx, index) => spaceY(10.sp),
                  itemCount: _globalController.cleaningBookings.length,
                );
        }),
        GetBuilder<GlobalController>(builder: (c) {
          return c.cleaningBookingsHistory.isEmpty
              ? const Center(child: NoItemsWidget())
              : ListView.separated(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  itemBuilder: (ctx, index) => CleanCompanyBookingWidget(
                    cleaningBooking: c.cleaningBookingsHistory[index],
                    approve: true,
                  ),
                  separatorBuilder: (ctx, index) => spaceY(10.sp),
                  itemCount: _globalController.cleaningBookingsHistory.length,
                );
        })
      ];
}

class OverView {
  int number;
  String string;
  OverView(this.number, this.string);
}
