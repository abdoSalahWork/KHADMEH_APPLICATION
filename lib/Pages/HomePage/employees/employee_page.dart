import 'package:custom_rating_bar/custom_rating_bar.dart' as r;
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../Utils/utils.dart';
import '../../../widgets/my_rating_bar.dart';
import 'filling_data_page.dart';
import 'pay_page.dart';

class EmployeePage extends StatefulWidget {
  const EmployeePage({super.key, required this.employeeType});
  final EmployeeType employeeType;
  @override
  State<EmployeePage> createState() => _EmployeePageState();
}

class _EmployeePageState extends State<EmployeePage>
    with SingleTickerProviderStateMixin {
  List<String> tags = [
    "employees",
  ];

  List<String> options = [
    "employees",
    "office_warrently",
    "offers",
  ];
  List<String> tabs = [
    "cleaner",
    "driver",
    "chef",
    "babysitter",
    "nurse",
    "sewing",
    "washing",
  ];
  late TabController tabController;
  int selectedTabIndex = 0;

  @override
  void initState() {
    tabController = TabController(length: 7, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        ClipPath(
          // clipper: OvalBottomBorderClipper(),
          clipper: Clipp(),
          child: Container(
            padding: EdgeInsetsDirectional.only(
                start: 8.0.sp, end: 8.0.sp, top: 25.0.sp, bottom: 8.0.sp),
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: AlignmentDirectional.bottomStart,
              end: AlignmentDirectional.topEnd,
              stops: [0.5, 0.6, 0.7, 0.8, 0.9, 0.95, 1],
              colors: [
                Color(0xff225153),
                Color(0xff24615E),
                Color(0xff257169),
                Color(0xff278274),
                Color(0xff28927E),
                Color(0xff2AA289),
                Color(0xff2BB294),
              ],
            )),
            width: 100.0.w,
            height: 48.0.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 22.0.sp,
                  ),
                ),
                spaceY(1.0.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      child: Container(
                        width: 75.0.sp,
                        height: 75.0.sp,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ],
                          borderRadius: BorderRadius.circular(20.0.w),
                          image: const DecorationImage(
                            image: AssetImage("assets/images/image.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    spaceX(20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              coloredText(
                                  text: 'lorem ipsun',
                                  color: Colors.white,
                                  fontSize: 15.0.sp),
                              spaceX(5),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 3),
                                decoration: BoxDecoration(
                                    color: const Color(0xff020404)
                                        .withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(20)),
                                child: coloredText(
                                    text: "\$560/2y",
                                    color: Colors.white,
                                    fontSize: 9.0.sp),
                              )
                            ],
                          ),
                          spaceY(10),
                          SizedBox(
                            height: 25,
                            child: ListView.separated(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) =>
                                  Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 2, horizontal: 20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  // color: const Color(0xffF8F8F8),
                                  border: Border.all(
                                    color: const Color(0xffE8E8E8),
                                  ),
                                ),
                                child: coloredText(
                                  text: tabs[index].tr,
                                  color: const Color(0xffE8E8E8),
                                  fontSize: 11.0.sp,
                                ),
                              ),
                              itemCount: 5,
                              separatorBuilder:
                                  (BuildContext context, int index) =>
                                      spaceX(5),
                            ),
                          ),
                          spaceY(10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                EvaIcons.pin,
                                color: Theme.of(context).colorScheme.secondary,
                                size: 13.0.sp,
                              ),
                              spaceX(3),
                              coloredText(
                                text: 'Philippines',
                                color: Theme.of(context).colorScheme.secondary,
                                fontSize: 12.0.sp,
                              ),
                            ],
                          ),
                          spaceY(10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                EvaIcons.heart,
                                color: const Color(0xffD4D4D4),
                                size: 13.0.sp,
                              ),
                              spaceX(5),
                              coloredText(
                                text: "Single",
                                fontSize: 12.0.sp,
                                color: const Color(0xffD4D4D4),
                              ),
                            ],
                          ),
                          spaceY(10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.g_translate_rounded,
                                color: const Color(0xffD4D4D4),
                                size: 13.0.sp,
                              ),
                              spaceX(5),
                              coloredText(
                                text: "English, Arabic",
                                fontSize: 12.0.sp,
                                color: const Color(0xffD4D4D4),
                              ),
                            ],
                          ),
                          spaceY(10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                EvaIcons.person,
                                color: const Color(0xffD4D4D4),
                                size: 13.0.sp,
                              ),
                              spaceX(5),
                              coloredText(
                                text: "31 Years",
                                fontSize: 12.0.sp,
                                color: const Color(0xffD4D4D4),
                              ),
                            ],
                          ),
                          spaceY(15),
                          primaryButton(
                            onTap: () {
                              logSuccess(widget.employeeType);
                              if (widget.employeeType ==
                                  EmployeeType.recruitment) {
                                Get.to(
                                    () => PayPage(
                                          employeeType: widget.employeeType,
                                        ),
                                    transition: Transition.downToUp);
                              } else {
                                Get.to(() => const FillingDataPage(),
                                    transition: Transition.downToUp);
                              }
                            },
                            text: coloredText(
                                text: "Book",
                                color: Colors.white,
                                fontSize: 12.0.sp),
                            color: Theme.of(context).colorScheme.secondary,
                            width: 40.0.w,
                            height: 30.0.sp,
                            radius: 20,
                            alignment: AlignmentDirectional.centerStart,
                          ),
                          // Container(
                          //   width: 40.0.w,
                          //   height: 40,
                          //   margin: EdgeInsets.symmetric(horizontal: 1.0.w),
                          //   decoration: BoxDecoration(
                          //       color: Theme.of(context).colorScheme.secondary,
                          //       borderRadius: BorderRadius.circular(20),
                          //       border: Border.all(
                          //         color: Colors.transparent,
                          //       )),
                          //   child: Center(
                          //     child: coloredText(
                          //         text: "Book",
                          //         color: Colors.white,
                          //         fontSize: 12.0.sp),
                          //   ),
                          // ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        // spaceY(1.0.h),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
            children: [
              coloredText(
                text: "rate_view".tr,
                color: Theme.of(context).colorScheme.primary,
              ),
              const Divider(
                color: Color(0xffDBDBDB),
              ),
              spaceY(10),
              Row(
                children: [
                  coloredText(
                    text: "4.5",
                    fontSize: 35.0.sp,
                    color: Theme.of(context).colorScheme.primary,
                    // fontWeight: FontWeight.bold,
                  ),
                  spaceX(30),
                  Expanded(
                    child: Column(
                      children: [
                        const MyRatingBar(label: '5', value: 50),
                        spaceY(3),
                        const MyRatingBar(label: '4', value: 20),
                        spaceY(3),
                        const MyRatingBar(label: '3', value: 70),
                        spaceY(3),
                        const MyRatingBar(label: '2', value: 10),
                        spaceY(3),
                        const MyRatingBar(label: '1', value: 90),
                      ],
                    ),
                  ),
                ],
              ),
              spaceY(20),
              ListView.separated(
                  shrinkWrap: true,
                  primary: false,
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 12.0.w,
                                height: 12.0.w,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image:
                                          AssetImage("assets/images/image.png"),
                                      fit: BoxFit.cover),
                                ),
                              ),
                              spaceX(10),
                              coloredText(
                                text: "Ahmad ALi",
                                color: Colors.black,
                                fontSize: 14.0.sp,
                              )
                            ],
                          ),
                          Align(
                              alignment: AlignmentDirectional.centerStart,
                              child: r.RatingBar.readOnly(
                                isHalfAllowed: true,
                                filledIcon: Icons.star_rounded,
                                halfFilledIcon: Icons.star_half_rounded,
                                emptyIcon: Icons.star_border_rounded,
                                filledColor: Colors.black,
                                halfFilledColor: Colors.black,
                                emptyColor: Colors.black,
                                initialRating: 3.5,
                                maxRating: 5,
                                size: 18.0.sp,
                              )
                              //  RatingBar.builder(
                              //   initialRating: 4.5,
                              //   minRating: 0,
                              //   direction: Axis.horizontal,
                              //   allowHalfRating: true,
                              //   itemCount: 5,
                              //   itemSize: 17.0.sp,unratedColor: Colors.transparent,
                              //   itemPadding:
                              //       EdgeInsets.symmetric(horizontal: 4.0),
                              //   itemBuilder: (context, index) {
                              //     if (index < 4.5) {
                              //       return const Icon(
                              //         Icons.star_rounded,
                              //         color: Colors.black,
                              //       );
                              //     } else {
                              //       return const Icon(
                              //         Icons.star_outline_rounded,
                              //         color: Colors.black,
                              //       );
                              //     }
                              //   },
                              //   onRatingUpdate: (rating) {
                              //     print(rating);
                              //   },
                              // ),

                              ),
                          spaceY(10),
                          coloredText(
                              text:
                                  "Lorem ipsum dolor sit amet consectetur adipiscing elit",
                              color: const Color(0xff919191))
                        ],
                      ),
                  separatorBuilder: (context, index) => spaceY(20),
                  itemCount: 10),
              spaceY(20),
            ],
          ),
        )
      ],
    ));
  }
}
