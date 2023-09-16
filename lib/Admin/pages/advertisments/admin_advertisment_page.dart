import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khedma/Admin/pages/advertisments/advertisments_filter_page.dart';
import 'package:khedma/Pages/HomePage/models/advertisment_model.dart';
import 'package:khedma/Utils/utils.dart';
import 'package:khedma/widgets/ad_card.dart';
import 'package:khedma/widgets/search_text_field.dart';
import 'package:sizer/sizer.dart';

class AdminAdvertismentsPage extends StatefulWidget {
  const AdminAdvertismentsPage({super.key});

  @override
  State<AdminAdvertismentsPage> createState() => _AdminAdvertismentsPageState();
}

class _AdminAdvertismentsPageState extends State<AdminAdvertismentsPage>
    with SingleTickerProviderStateMixin {
  List<String> tabs = [
    "requests".tr,
    "refunds".tr,
    "history".tr,
  ];
  late TabController tabController;
  int selectedTabIndex = 0;
  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);

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
                          Get.to(() => const AdvertismentsFilterPage());
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
                        tab2(),
                        tab3(),
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

  final AdvertismentModel _tmp = AdvertismentModel(
    adminApprove: 0,
    companyId: 1,
    confirm: 0,
    endDate: "10-10-2020",
    startDate: "10-10-2020",
    id: 1,
    createdAt: "10-10-2020",
    image: "",
    externalLink: "https://www.google.com",
    updatedAt: "10-10-2020",
    durationByDay: 10,
    promotionType: 2,
  );
  ListView tab1() => ListView(
        primary: false,
        children: [
          AdvertismentCard(
            advertismentModel: _tmp,
            admin: true,
            pending: true,
          ),
          spaceY(20.sp),
          AdvertismentCard(
            advertismentModel: _tmp,
            admin: true,
            pending: true,
          ),
          spaceY(20.sp),
          AdvertismentCard(
            advertismentModel: _tmp,
            admin: true,
            pending: true,
          ),
          spaceY(20.sp),
        ],
      );
  ListView tab2() => ListView(
        primary: false,
        children: [
          AdvertismentCard(
            advertismentModel: _tmp,
            admin: true,
            refunds: true,
          ),
          spaceY(20.sp),
          AdvertismentCard(
            advertismentModel: _tmp,
            admin: true,
            refunds: true,
          ),
          spaceY(20.sp),
          AdvertismentCard(
            advertismentModel: _tmp,
            admin: true,
            refunds: true,
          ),
          spaceY(20.sp),
        ],
      );
  ListView tab3() => ListView(
        primary: false,
        children: [
          AdvertismentCard(
            advertismentModel: _tmp,
            admin: true,
            status: true,
          ),
          spaceY(20.sp),
          AdvertismentCard(
            advertismentModel: _tmp,
            admin: true,
            status: true,
          ),
          spaceY(20.sp),
          AdvertismentCard(
            advertismentModel: _tmp,
            admin: true,
            status: true,
          ),
          spaceY(20.sp),
        ],
      );
}
