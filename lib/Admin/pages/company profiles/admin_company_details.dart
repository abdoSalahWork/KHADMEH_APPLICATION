import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khedma/Pages/HomePage/company%20home/emloyee_details.dart';
import 'package:khedma/Utils/utils.dart';
import 'package:khedma/widgets/zero_app_bar.dart';
import 'package:sizer/sizer.dart';

class AdminCompanyDetailsPage extends StatelessWidget {
  AdminCompanyDetailsPage({super.key});
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
                    Container(
                      width: 30.sp,
                      height: 30.sp,
                      decoration: BoxDecoration(
                          color: const Color(0xff919191).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(5)),
                      child: const Icon(
                        EvaIcons.trash2,
                        color: Color(0xff5D5D5D),
                      ),
                    )
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
                      image: AssetImage("assets/images/image.png"),
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
                            subTitle1: "Mohammed",
                            title2: "last_name".tr,
                            subTitle2: "Ammourie",
                          ),
                          spaceY(12.sp),
                          DetailsItemWidget(
                            title1: "phone_number".tr,
                            subTitle1: "+9639132123141",
                            title2: "nationality".tr,
                            subTitle2: "Lorem",
                          ),
                          spaceY(12.sp),
                          DetailsItemWidget(
                            title1: "id_number".tr,
                            subTitle1: "12312414123131",
                            title2: "date_of_birth".tr,
                            subTitle2: "18/19/1234",
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
                            subTitle1: "lorem",
                            width1: 80.w,
                            // title2: "region".tr,
                            // subTitle2: "lorem",
                          ),
                          spaceY(12.sp),
                          DetailsItemWidget(
                            width1: 80.w,
                            title1: "phone_number".tr,
                            subTitle1: "+12131823",
                          ),
                          spaceY(12.sp),
                          DetailsItemWidget(
                            width1: 80.w,
                            title1: "email".tr,
                            subTitle1: "lorem@asd.asda",
                          ),
                          spaceY(12.sp),
                          DetailsItemWidget(
                            width1: 80.w,
                            title1: "url".tr,
                            subTitle1: "www.google.com",
                          ),
                          spaceY(12.sp),
                          DetailsItemWidget(
                            width1: 80.w,
                            title1: "company_type".tr,
                            subTitle1: "lorem",
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
                            subTitle1: "lorem",
                            title2: "region".tr,
                            subTitle2: "lorem",
                          ),
                          spaceY(12.sp),
                          DetailsItemWidget(
                            width1: 80.w,
                            title1: "piece_num".tr,
                            subTitle1: "lorem",
                          ),
                          spaceY(12.sp),
                          DetailsItemWidget(
                            width1: 80.w,
                            title1: "street".tr,
                            subTitle1: "lorem",
                          ),
                          spaceY(12.sp),
                          DetailsItemWidget(
                            width1: 80.w,
                            title1: "building".tr,
                            subTitle1: "lorem",
                          ),
                          spaceY(12.sp),
                          DetailsItemWidget(
                            width1: 80.w,
                            title1: "adn".tr,
                            subTitle1: "lorem",
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
                            subTitle1: "lorem",
                          ),
                          spaceY(12.sp),
                          DetailsItemWidget(
                            width1: 80.w,
                            title1: "tax_number".tr,
                            subTitle1: "lorem",
                          ),
                          spaceY(12.sp),
                          DetailsItemWidget(
                            width1: 80.w,
                            title1: "license_number".tr,
                            subTitle1: "lorem",
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
                          // DetailsItemWidget(
                          //   width1: 80.w,
                          //   title1: "id_number".tr,
                          //   // subTitle1: "12312312371",
                          // ),
                          // spaceY(12.sp),
                          // DetailsItemWidget(
                          //   width1: 80.w,
                          //   title1: "ref_number".tr,
                          //   subTitle1: "12312312371",
                          // ),
                          // spaceY(12.sp),
                          Align(
                            alignment: AlignmentDirectional.centerStart,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                coloredText(
                                    text: "id_photo_front".tr,
                                    color: Colors.black,
                                    fontSize: 13.sp),
                                spaceY(5.sp),
                                Image(
                                  image:
                                      const AssetImage("assets/images/id.png"),
                                  width: 50.w,
                                ),
                                spaceY(12.sp),
                                coloredText(
                                    text: "id_photo_back".tr,
                                    color: Colors.black,
                                    fontSize: 13.sp),
                                spaceY(5.sp),
                                Image(
                                  image:
                                      const AssetImage("assets/images/id.png"),
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
