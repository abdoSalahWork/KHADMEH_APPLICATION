import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:khedma/Admin/pages/bookings/bookings_filter_page.dart';
import 'package:khedma/Utils/utils.dart';
import 'package:khedma/widgets/search_text_field.dart';
import 'package:sizer/sizer.dart';

class AdminBookingsPage extends StatefulWidget {
  const AdminBookingsPage({super.key});

  @override
  State<AdminBookingsPage> createState() => _AdminBookingsPageState();
}

class _AdminBookingsPageState extends State<AdminBookingsPage>
    with SingleTickerProviderStateMixin {
  List<String> tabs = [
    "cleaning".tr,
    "recruitment".tr,
  ];
  late TabController tabController;
  int selectedTabIndex = 0;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 100.w,
        height: 100.h,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Theme.of(context).colorScheme.primary,
          Theme.of(context).colorScheme.secondary,
        ])),
        child: Column(
          children: [
            Container(
              width: 100.w,
              height: 15.h,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 20.sp,
                    ),
                  ),
                  coloredText(
                    text: "bookings".tr,
                    color: Colors.white,
                    fontSize: 15.sp,
                  ),
                  spaceX(10)
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    )),
                width: 100.w,
                child: Column(
                  children: [
                    spaceY(10.sp),
                    SearchTextField(
                      hintText: "${"search".tr} ...",
                      prefixIcon: const Icon(
                        EvaIcons.search,
                        color: Color(0xffAFAFAF),
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          Get.to(() => const BookingsFilterPage());
                        },
                        child: const Image(
                          width: 15,
                          height: 15,
                          image: AssetImage("assets/images/filter-icon.png"),
                        ),
                      ),
                    ),
                    spaceY(10.sp),
                    TabBar(
                        dividerColor: Colors.grey,
                        // indicatorColor: Colors.black,
                        indicator: UnderlineTabIndicator(
                            borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.primary,
                        )),
                        indicatorSize: TabBarIndicatorSize.tab,

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
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              child: coloredText(
                                  text: tabs[index].tr,
                                  color: selectedTabIndex == index
                                      ? Colors.black
                                      : Colors.grey),
                            ),
                          ),
                        )),
                    spaceY(10.sp),
                    Expanded(
                        child: TabBarView(
                      controller: tabController,
                      children: [
                        tab1(),
                        tab1(),
                      ],
                    )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ListView tab1() => ListView(
        primary: false,
        children: [
          tabHeader(
              text1: "today".tr,
              text2: DateFormat('yyyy-MM-dd').format(DateTime.now())),
          spaceY(5.sp),
          tabBody(),
          spaceY(10.sp),
          tabHeader(
              text1: "yesterday".tr,
              text2: DateFormat('yyyy-MM-dd').format(DateTime.now())),
          spaceY(5.sp),
          tabBody(),
          spaceY(10.sp),
          tabHeader(
              text1: "before".tr,
              text2: DateFormat('yyyy-MM-dd').format(DateTime.now())),
          spaceY(5.sp),
          tabBody(),
          spaceY(10.sp),
        ],
      );

  ListView tabBody() => ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: List<Widget>.generate(
          3,
          (index) => Container(
            width: 100.w,
            height: 13.h,
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: const Color(0xffF8F8F8),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 60.w,
                  child: coloredText(
                      text: "Ahmed Khaled booked Sara Khaled for 2 years",
                      color: const Color(0xff707070),
                      fontSize: 12.sp),
                ),
                coloredText(
                  text: "500 KWD",
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          ),
        ),
      );

  Row tabHeader({
    required String text1,
    required String text2,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        coloredText(text: text1, fontSize: 15.sp, fontWeight: FontWeight.w600),
        coloredText(text: text2),
      ],
    );
  }
}
