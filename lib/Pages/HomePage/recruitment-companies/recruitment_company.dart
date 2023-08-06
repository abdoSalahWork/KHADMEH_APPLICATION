import 'package:chips_choice/chips_choice.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../Utils/utils.dart';
import '../../../widgets/profile_card.dart';
import '../../chat%20page/messages_page.dart';

class RecruitmentCompany extends StatefulWidget {
  const RecruitmentCompany({super.key});

  @override
  State<RecruitmentCompany> createState() => _RecruitmentCompanyState();
}

class _RecruitmentCompanyState extends State<RecruitmentCompany>
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
  bool offerFlag = false;
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
            height: 43.0.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
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
                      child: Icon(
                        EvaIcons.messageCircle,
                        color: Colors.white,
                        size: 22.0.sp,
                      ),
                      onTap: () => Get.to(() => const MessagesPage()),
                    ),
                  ],
                ),
                spaceY(1.0.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      // onTap: () => Get.to(() => const RecruitmentCompany(),
                      //     transition: Transition.rightToLeftWithFade),
                      child: Container(
                        width: 75.0.sp,
                        height: 75.0.sp,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage("assets/images/image.png"),
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
                    spaceX(20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          coloredText(
                              text: 'lorem ipsun',
                              color: Colors.white,
                              fontSize: 16.0.sp),
                          spaceY(6),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                EvaIcons.pin,
                                color: Theme.of(context).colorScheme.secondary,
                                size: 15.0.sp,
                              ),
                              spaceX(3),
                              coloredText(
                                text: 'Philippines',
                                color: Theme.of(context).colorScheme.secondary,
                                fontSize: 14.0.sp,
                              ),
                            ],
                          ),
                          spaceY(6),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                EvaIcons.phone,
                                color: const Color(0xffD4D4D4),
                                size: 15.0.sp,
                              ),
                              spaceX(5),
                              coloredText(
                                text: "+965 5632 4224",
                                fontSize: 13.0.sp,
                                color: const Color(0xffD4D4D4),
                              ),
                            ],
                          ),
                          spaceY(6),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                EvaIcons.star,
                                color: Colors.yellow,
                                size: 15.0.sp,
                              ),
                              spaceX(5),
                              coloredText(
                                text: "4.5",
                                fontSize: 13.0.sp,
                                color: Colors.white,
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
                spaceY(3.0.h),
                ChipsChoice<String>.multiple(
                  padding: EdgeInsets.zero,
                  value: tags,
                  onChanged: (val) {},
                  choiceItems: C2Choice.listFrom<String, String>(
                    source: options,
                    value: (i, v) => v,
                    label: (i, v) => v,
                  ),
                  // choiceStyle: C2ChipStyle.outlined(),
                  choiceCheckmark: true,

                  choiceBuilder: (item, i) => GestureDetector(
                    onTap: () {
                      if (!tags.contains(item.label)) {
                        tags = [];
                        tags.add(item.label);
                      }
                      if (item.label == "offers") {
                        offerFlag = true;
                      } else {
                        offerFlag = false;
                      }
                      setState(() {});
                    },
                    child: Container(
                      width: 40.0.w,
                      height: 40,
                      margin: EdgeInsets.symmetric(horizontal: 1.0.w),
                      decoration: BoxDecoration(
                          color: !tags.contains(item.label)
                              ? const Color(0xffE8E8E8).withOpacity(0)
                              : Theme.of(context).colorScheme.secondary,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: !tags.contains(item.label)
                                ? const Color(0xffF1F1F1)
                                : Colors.transparent,
                          )),
                      child: Center(
                        child: coloredText(
                            text: item.label.tr,
                            color: !tags.contains(item.label)
                                ? const Color(0xffF1F1F1)
                                : Colors.white,
                            fontSize: 12.0.sp),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        // spaceY(1.0.h),
        Expanded(
          child: Column(
            children: [
              TabBar(
                  dividerColor: Colors.transparent,
                  indicatorColor: Colors.black,
                  isScrollable: true,
                  controller: tabController,
                  onTap: (value) {
                    selectedTabIndex = value;
                    setState(() {});
                  },
                  tabs: List<Widget>.generate(
                    tabController.length,
                    (index) => Tab(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        child: coloredText(
                            text: tabs[index].tr,
                            color: selectedTabIndex == index
                                ? Colors.black
                                : Colors.grey),
                      ),
                    ),
                  )),
              Expanded(
                child: TabBarView(controller: tabController, children: [
                  ListView.separated(
                    padding: const EdgeInsets.all(20),
                    itemBuilder: (context, index) => ProfileCard(
                        trailing: const Icon(
                          EvaIcons.heart,
                          color: Color(0xffBFBFBF),
                        ),
                        isOffer: offerFlag,
                        employeeType: EmployeeType.recruitment),
                    separatorBuilder: (context, index) => spaceY(10),
                    itemCount: 10,
                  ),
                  ListView.separated(
                    padding: const EdgeInsets.all(20),
                    itemBuilder: (context, index) => ProfileCard(
                        trailing: const Icon(
                          EvaIcons.heart,
                          color: Color(0xffBFBFBF),
                        ),
                        isOffer: offerFlag,
                        employeeType: EmployeeType.recruitment),
                    separatorBuilder: (context, index) => spaceY(10),
                    itemCount: 10,
                  ),
                  ListView.separated(
                    padding: const EdgeInsets.all(20),
                    itemBuilder: (context, index) => ProfileCard(
                        trailing: const Icon(
                          EvaIcons.heart,
                          color: Color(0xffBFBFBF),
                        ),
                        isOffer: offerFlag,
                        employeeType: EmployeeType.recruitment),
                    separatorBuilder: (context, index) => spaceY(10),
                    itemCount: 10,
                  ),
                  ListView.separated(
                    padding: const EdgeInsets.all(20),
                    itemBuilder: (context, index) => ProfileCard(
                        trailing: const Icon(
                          EvaIcons.heart,
                          color: Color(0xffBFBFBF),
                        ),
                        isOffer: offerFlag,
                        employeeType: EmployeeType.recruitment),
                    separatorBuilder: (context, index) => spaceY(10),
                    itemCount: 10,
                  ),
                  ListView.separated(
                    padding: const EdgeInsets.all(20),
                    itemBuilder: (context, index) => ProfileCard(
                        trailing: const Icon(
                          EvaIcons.heart,
                          color: Color(0xffBFBFBF),
                        ),
                        isOffer: offerFlag,
                        employeeType: EmployeeType.recruitment),
                    separatorBuilder: (context, index) => spaceY(10),
                    itemCount: 10,
                  ),
                  ListView.separated(
                    padding: const EdgeInsets.all(20),
                    itemBuilder: (context, index) => ProfileCard(
                        trailing: const Icon(
                          EvaIcons.heart,
                          color: Color(0xffBFBFBF),
                        ),
                        isOffer: offerFlag,
                        employeeType: EmployeeType.recruitment),
                    separatorBuilder: (context, index) => spaceY(10),
                    itemCount: 10,
                  ),
                  ListView.separated(
                    padding: const EdgeInsets.all(20),
                    itemBuilder: (context, index) => ProfileCard(
                        trailing: const Icon(
                          EvaIcons.heart,
                          color: Color(0xffBFBFBF),
                        ),
                        isOffer: offerFlag,
                        employeeType: EmployeeType.recruitment),
                    separatorBuilder: (context, index) => spaceY(10),
                    itemCount: 10,
                  ),
                ]),
              )
            ],
          ),
        )
      ],
    ));
  }
}

class Clipp extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double firstFactor = 0;
    double secondFactor = size.height - 35;
    double thirdFactor = 0;
    double fourthFactor = size.height - 35;
    path.moveTo(firstFactor, 0);
    path.quadraticBezierTo(thirdFactor, firstFactor, 0, firstFactor);
    path.lineTo(0, fourthFactor);
    path.quadraticBezierTo(
      size.width / 3,
      size.height,
      size.width,
      secondFactor,
    );
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
