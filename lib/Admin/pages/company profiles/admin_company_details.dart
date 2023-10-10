import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khedma/Admin/controllers/admin_controller.dart';
import 'package:khedma/Pages/HomePage/company%20home/emloyee_details.dart';
import 'package:khedma/Pages/global_controller.dart';
import 'package:khedma/Utils/utils.dart';
import 'package:khedma/models/me.dart';
import 'package:khedma/widgets/zero_app_bar.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class AdminCompanyDetailsPage extends StatefulWidget {
  AdminCompanyDetailsPage({super.key, required this.companyProfile});
  final Me companyProfile;
  @override
  State<AdminCompanyDetailsPage> createState() =>
      _AdminCompanyDetailsPageState();
}

class _AdminCompanyDetailsPageState extends State<AdminCompanyDetailsPage> {
  final ExpandableController _expandableController =
      ExpandableController(initialExpanded: true);

  final ExpandableController _expandable2Controller =
      ExpandableController(initialExpanded: false);

  final ExpandableController _expandable3Controller =
      ExpandableController(initialExpanded: false);

  final ExpandableController _expandable4Controller =
      ExpandableController(initialExpanded: false);

  final ExpandableController _expandable5Controller =
      ExpandableController(initialExpanded: false);

  final AdminController _adminController = Get.find();
  final GlobalController _globalController = Get.find();
  int blocked = 0;
  @override
  void initState() {
    blocked = widget.companyProfile.block!;
    logSuccess(widget.companyProfile.toJson());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ZeroAppBar(
        color: Colors.white,
      ),
      body: ExpandableNotifier(
        child: ExpandableTheme(
          data: const ExpandableThemeData(
            iconColor: Colors.black,
            useInkWell: false,
          ),
          child: ListView(
            primary: false,
            padding: EdgeInsets.zero,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Icon(
                        Icons.arrow_back,
                        size: 25.sp,
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        bool b = await _adminController.blockProfile(
                          id: widget.companyProfile.id!,
                          block: blocked == 0 ? 1 : 0,
                          userIndicator: 'company',
                        );
                        if (b) {
                          if (blocked == 0) {
                            blocked = 1;
                          } else {
                            blocked = 0;
                          }
                          setState(() {});
                        }
                      },
                      child: Container(
                        width: 30.sp,
                        height: 30.sp,
                        decoration: BoxDecoration(
                            color: blocked == 1
                                ? Colors.red.withOpacity(0.1)
                                : Colors.green.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(5)),
                        child: Icon(
                          EvaIcons.slash,
                          color: blocked == 1 ? Colors.red : Colors.green,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              spaceY(10.sp),
              Container(
                width: 100.0.sp,
                height: 100.0.sp,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(widget
                          .companyProfile.companyInformation!.companyLogo),
                      fit: BoxFit.contain),
                ),
              ),
              spaceY(20.sp),
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
                      headerAlignment: ExpandablePanelHeaderAlignment.center,
                      tapBodyToCollapse: true,
                    ),
                    header: Padding(
                      padding: const EdgeInsets.all(10),
                      child: coloredText(
                        text: "owner_info".tr,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
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
                        children: [
                          DetailsItemWidget(
                            title1: "first_name".tr,
                            subTitle1: widget
                                .companyProfile.companyInformation!.firstName,
                            title2: "last_name".tr,
                            subTitle2: widget
                                .companyProfile.companyInformation!.lastName,
                          ),
                          spaceY(12.sp),
                          DetailsItemWidget(
                            title1: "phone_number".tr,
                            subTitle1:
                                widget.companyProfile.companyInformation!.phone,
                            title2: "nationality".tr,
                            subTitle2: _globalController.countries
                                .where((element) =>
                                    element.id ==
                                    widget.companyProfile.companyInformation!
                                        .nationalityId)
                                .map((e) =>
                                    Get.locale == const Locale("en", "US")
                                        ? e.nameEn!
                                        : e.nameAr!)
                                .first,
                          ),
                          spaceY(12.sp),
                          DetailsItemWidget(
                            title1: "id_number".tr,
                            subTitle1: widget
                                .companyProfile.companyInformation!.idNumber,
                            title2: "date_of_birth".tr,
                            subTitle2: widget
                                .companyProfile.companyInformation!.dateOfBirth,
                          ),
                          spaceY(12.sp),
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
                      headerAlignment: ExpandablePanelHeaderAlignment.center,
                      tapBodyToCollapse: true,
                    ),
                    header: Padding(
                      padding: const EdgeInsets.all(10),
                      child: coloredText(
                        text: "company_info".tr,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
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
                        children: [
                          DetailsItemWidget(
                            title1: "company_name".tr,
                            subTitle1: widget
                                .companyProfile.companyInformation!.companyName,
                            width1: 80.w,
                            // title2: "region".tr,
                            // subTitle2: "lorem",
                          ),
                          spaceY(12.sp),
                          DetailsItemWidget(
                            width1: 80.w,
                            title1: "phone_number".tr,
                            subTitle1: widget.companyProfile.companyInformation!
                                .companyPhone,
                          ),
                          spaceY(12.sp),
                          DetailsItemWidget(
                            width1: 80.w,
                            title1: "email".tr,
                            subTitle1: widget.companyProfile.email,
                          ),
                          widget.companyProfile.companyInformation!.url != null
                              ? spaceY(12.sp)
                              : Container(),
                          widget.companyProfile.companyInformation!.url != null
                              ? GestureDetector(
                                  onTap: () async {
                                    final Uri _url = Uri.parse(widget
                                        .companyProfile
                                        .companyInformation!
                                        .url!);

                                    if (!await launchUrl(_url,
                                        mode: LaunchMode.externalApplication)) {
                                      throw Exception('Could not launch $_url');
                                    }
                                  },
                                  child: DetailsItemWidget(
                                    width1: 80.w,
                                    title1: "url".tr,
                                    subTitle1: widget
                                        .companyProfile.companyInformation!.url,
                                  ),
                                )
                              : Container(),
                          spaceY(12.sp),
                          DetailsItemWidget(
                            width1: 80.w,
                            title1: "company_type".tr,
                            subTitle1: widget
                                .companyProfile.companyInformation!.companyType,
                          ),
                          spaceY(12.sp),
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
                      headerAlignment: ExpandablePanelHeaderAlignment.center,
                      tapBodyToCollapse: true,
                    ),
                    header: Padding(
                      padding: const EdgeInsets.all(10),
                      child: coloredText(
                        text: "address_info".tr,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
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
                        children: [
                          DetailsItemWidget(
                            title1: "city".tr,
                            subTitle1: _globalController.cities
                                .where((element) =>
                                    element.id ==
                                    widget.companyProfile.companyInformation!
                                        .cityId)
                                .map((e) =>
                                    Get.locale == const Locale("en", "US")
                                        ? e.nameEn!
                                        : e.nameAr!)
                                .first,
                            title2: "region".tr,
                            subTitle2: _globalController.regions
                                .where((element) =>
                                    element.id ==
                                    widget.companyProfile.companyInformation!
                                        .regionId)
                                .map((e) =>
                                    Get.locale == const Locale("en", "US")
                                        ? e.nameEn!
                                        : e.nameAr!)
                                .first,
                          ),
                          spaceY(12.sp),
                          DetailsItemWidget(
                            width1: 80.w,
                            title1: "piece_num".tr,
                            subTitle1: widget
                                .companyProfile.companyInformation!.pieceNumber,
                          ),
                          spaceY(12.sp),
                          DetailsItemWidget(
                            width1: 80.w,
                            title1: "street".tr,
                            subTitle1: widget
                                .companyProfile.companyInformation!.pieceNumber,
                          ),
                          spaceY(12.sp),
                          DetailsItemWidget(
                            width1: 80.w,
                            title1: "building".tr,
                            subTitle1: widget
                                .companyProfile.companyInformation!.building,
                          ),
                          spaceY(12.sp),
                          DetailsItemWidget(
                            width1: 80.w,
                            title1: "adn".tr,
                            subTitle1: widget.companyProfile.companyInformation!
                                .automatedAddressNumber,
                          ),
                          spaceY(12.sp),
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
                      headerAlignment: ExpandablePanelHeaderAlignment.center,
                      tapBodyToCollapse: true,
                    ),
                    header: Padding(
                      padding: const EdgeInsets.all(10),
                      child: coloredText(
                        text: "commercial_info".tr,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
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
                        children: [
                          DetailsItemWidget(
                            width1: 80.w,
                            title1: "commercial_reg_number".tr,
                            subTitle1: widget.companyProfile.companyInformation!
                                .commercialRegistrationNumber,
                          ),
                          spaceY(12.sp),
                          DetailsItemWidget(
                            width1: 80.w,
                            title1: "tax_number".tr,
                            subTitle1: widget
                                .companyProfile.companyInformation!.taxNumber,
                          ),
                          spaceY(12.sp),
                          DetailsItemWidget(
                            width1: 80.w,
                            title1: "license_number".tr,
                            subTitle1: widget.companyProfile.companyInformation!
                                .licenseNumber,
                          ),
                          spaceY(12.sp),
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
                    controller: _expandable5Controller,
                    theme: const ExpandableThemeData(
                      headerAlignment: ExpandablePanelHeaderAlignment.center,
                      tapBodyToCollapse: true,
                    ),
                    header: Padding(
                      padding: const EdgeInsets.all(10),
                      child: coloredText(
                        text: "docs".tr,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
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
                        children: [
                          widget.companyProfile.companyInformation!
                                      .passportImage !=
                                  null
                              ? Align(
                                  alignment: AlignmentDirectional.centerStart,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      coloredText(
                                          text: "passport".tr,
                                          color: Colors.black,
                                          fontSize: 13.sp),
                                      spaceY(5.sp),
                                      Image(
                                        image: AssetImage(widget
                                            .companyProfile
                                            .companyInformation!
                                            .passportImage!),
                                        width: 50.w,
                                      ),
                                    ],
                                  ),
                                )
                              : Align(
                                  alignment: AlignmentDirectional.centerStart,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      coloredText(
                                          text: "id_photo_front".tr,
                                          color: Colors.black,
                                          fontSize: 13.sp),
                                      spaceY(5.sp),
                                      Image(
                                        image: NetworkImage(widget
                                            .companyProfile
                                            .companyInformation!
                                            .frontSideIdImage!),
                                        width: 50.w,
                                      ),
                                      spaceY(12.sp),
                                      coloredText(
                                          text: "id_photo_back".tr,
                                          color: Colors.black,
                                          fontSize: 13.sp),
                                      spaceY(5.sp),
                                      Image(
                                        image: NetworkImage(widget
                                            .companyProfile
                                            .companyInformation!
                                            .backSideIdImage!),
                                        width: 50.w,
                                      ),
                                    ],
                                  ),
                                ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              spaceY(10.sp),
            ],
          ),
        ),
      ),
    );
  }
}
