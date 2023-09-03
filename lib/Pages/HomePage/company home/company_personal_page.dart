import 'package:custom_rating_bar/custom_rating_bar.dart' as r;
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:khedma/Pages/personal%20page/personal_settings.dart';
import 'package:sizer/sizer.dart';

import '../../../Utils/utils.dart';
import '../../../widgets/my_rating_bar.dart';

class CompanyPersonalPage extends StatefulWidget {
  const CompanyPersonalPage({super.key, required this.employeeType});
  final EmployeeType employeeType;
  @override
  State<CompanyPersonalPage> createState() => _CompanyPersonalPageState();
}

class _CompanyPersonalPageState extends State<CompanyPersonalPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  int selectedTabIndex = 0;

  PageController pageController = PageController(initialPage: 0);
  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);

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
            height: 40.0.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                spaceY(5),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      GestureDetector(
                        onTap: () {
                          Get.to(
                              () => const PersonalSettings(userType: "company"),
                              transition: Transition.downToUp);
                        },
                        child: Icon(
                          FontAwesomeIcons.gear,
                          color: Colors.white,
                          size: 20.0.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                spaceY(2.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      child: Stack(
                        children: [
                          Container(
                            width: 75.0.sp,
                            height: 75.0.sp,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white,
                              ),
                              // shape: BoxShape.circle,
                              borderRadius: BorderRadius.circular(20.0.w),
                              image: const DecorationImage(
                                image: AssetImage("assets/images/image.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          PositionedDirectional(
                              bottom: 0,
                              end: 0,
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.black.withOpacity(0.4)),
                                child: const Icon(
                                  FontAwesomeIcons.camera,
                                  size: 15,
                                  color: Colors.white,
                                ),
                              ))
                        ],
                      ),
                    ),
                    spaceX(20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          coloredText(
                              text: 'Ahmad Khaled',
                              color: Colors.white,
                              fontSize: 15.0.sp),
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
                                EvaIcons.phone,
                                color: Theme.of(context).colorScheme.secondary,
                                size: 15.0.sp,
                              ),
                              spaceX(5),
                              coloredText(
                                text: "+965 5632 4224",
                                fontSize: 13.0.sp,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        // spaceY(1.0.h),
        Expanded(
            child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          children: [
            ListView(
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
                                        image: AssetImage(
                                            "assets/images/image.png"),
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
          ],
        ))
      ],
    ));
  }
}
