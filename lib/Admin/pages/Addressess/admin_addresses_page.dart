import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khedma/Admin/pages/Addressess/controller/addressess_controller.dart';
import 'package:khedma/Admin/pages/Addressess/country_create_page.dart';
import 'package:khedma/Admin/pages/categories/admin_categories_page.dart';
import 'package:khedma/Pages/global_controller.dart';
import 'package:khedma/Utils/utils.dart';
import 'package:khedma/models/city.dart';
import 'package:khedma/models/region.dart';
import 'package:sizer/sizer.dart';

class AdminAddressesPage extends StatefulWidget {
  const AdminAddressesPage({super.key});

  @override
  State<AdminAddressesPage> createState() => _AdminAddressesPageState();
}

class _AdminAddressesPageState extends State<AdminAddressesPage>
    with SingleTickerProviderStateMixin {
  // GlobalController _globalController = Get.find();
  // AddressessController _adressControllerController = Get.find();
  List<String> tabs = [
    "countries",
    "cities",
    "regions",
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
                    text: "addresses".tr,
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
                                  fontSize: 11.sp,
                                  text: tabs[index].tr,
                                  color: selectedTabIndex == index
                                      ? Colors.black
                                      : Colors.grey),
                            ),
                          ),
                        )),
                    Expanded(
                        child: TabBarView(
                      controller: tabController,
                      children: [
                        tab2(),
                        tab1(),
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

  Widget tab1() => GetBuilder<GlobalController>(builder: (globalController) {
        return GetBuilder<AddressessController>(
            builder: (addressessController) {
          return Column(
            children: [
              spaceY(20.sp),
              primaryBorderedButton(
                  onTap: () {
                    City city = City();
                    Utils.showDialogBox(
                      context: context,
                      actions: [
                        primaryButton(
                          onTap: () async {
                            Get.back();
                            bool b = await addressessController.createCity(
                                city: city);
                            // ignore: use_build_context_synchronously
                            if (b) Utils.doneDialog(context: context);
                          },
                          color: Colors.black,
                          width: 50.w,
                          height: 40.sp,
                          text: coloredText(
                              text: "create".tr, color: Colors.white),
                        ),
                      ],
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          coloredText(text: "name_ar".tr),
                          spaceY(5.sp),
                          SizedBox(
                            height: 35.sp,
                            child: TextFormField(
                              // maxLines: 1,
                              initialValue: city.nameAr,
                              onChanged: (value) {
                                city.nameAr = value;
                              },
                              decoration: const InputDecoration(
                                // hintText: "write_your_notes".tr,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                filled: true,
                                fillColor: Color(0xffF5F5F5),
                              ),
                            ),
                          ),
                          spaceY(10.sp),
                          coloredText(text: "name_en".tr),
                          spaceY(5.sp),
                          SizedBox(
                            height: 35.sp,
                            child: TextFormField(
                              // maxLines: 1,
                              initialValue: city.nameEn,
                              onChanged: (value) {
                                city.nameEn = value;
                              },
                              decoration: const InputDecoration(
                                // hintText: "write_your_notes".tr,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                filled: true,
                                fillColor: Color(0xffF5F5F5),
                              ),
                            ),
                          ),
                        ],
                      ),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () => Get.back(),
                            child: const Icon(
                              EvaIcons.close,
                            ),
                          )
                        ],
                      ),
                    );
                  },
                  width: 100.w,
                  text: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(EvaIcons.plus, color: Colors.black, size: 20.sp),
                      spaceX(10.sp),
                      coloredText(text: "create_new".tr),
                    ],
                  ),
                  color: Colors.black),
              // spaceY(30.sp),
              Expanded(
                child: globalController.getCitiesFlag
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.separated(
                        primary: false,
                        shrinkWrap: true,
                        // physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => AdminItemCard(
                              name:
                                  "${globalController.cities[index].nameEn!} - ${globalController.cities[index].nameAr!}",
                              margin: const EdgeInsets.only(bottom: 10),
                              trailing: Theme(
                                data: ThemeData(primaryColor: Colors.white),
                                child: PopupMenuButton(
                                  constraints: BoxConstraints(
                                    minWidth: 2.0 * 56.0,
                                    maxWidth: MediaQuery.of(context).size.width,
                                  ),
                                  itemBuilder: (BuildContext cc) => [
                                    PopupMenuItem<int>(
                                      value: 0,
                                      child: Row(
                                        children: [
                                          Icon(EvaIcons.editOutline,
                                              size: 15.sp),
                                          spaceX(5.sp),
                                          coloredText(
                                              text: 'edit'.tr,
                                              fontSize: 12.0.sp),
                                        ],
                                      ),
                                      onTap: () {
                                        City city = City.fromJson(
                                            globalController.cities[index]
                                                .toJson());
                                        Utils.showDialogBox(
                                          context: context,
                                          actions: [
                                            primaryButton(
                                              onTap: () async {
                                                Get.back();
                                                bool b =
                                                    await addressessController
                                                        .updateCity(city: city);
                                                // ignore: use_build_context_synchronously
                                                if (b)
                                                  Utils.doneDialog(
                                                      context: context);
                                              },
                                              color: Colors.black,
                                              width: 50.w,
                                              height: 40.sp,
                                              text: coloredText(
                                                  text: "create".tr,
                                                  color: Colors.white),
                                            ),
                                          ],
                                          content: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              coloredText(text: "name_ar".tr),
                                              spaceY(5.sp),
                                              SizedBox(
                                                height: 35.sp,
                                                child: TextFormField(
                                                  // maxLines: 1,
                                                  initialValue: city.nameAr,
                                                  onChanged: (value) {
                                                    city.nameAr = value;
                                                  },
                                                  decoration:
                                                      const InputDecoration(
                                                    // hintText: "write_your_notes".tr,
                                                    border: OutlineInputBorder(
                                                      borderSide:
                                                          BorderSide.none,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(10),
                                                      ),
                                                    ),
                                                    filled: true,
                                                    fillColor:
                                                        Color(0xffF5F5F5),
                                                  ),
                                                ),
                                              ),
                                              spaceY(10.sp),
                                              coloredText(text: "name_en".tr),
                                              spaceY(5.sp),
                                              SizedBox(
                                                height: 35.sp,
                                                child: TextFormField(
                                                  // maxLines: 1,
                                                  initialValue: city.nameEn,
                                                  onChanged: (value) {
                                                    city.nameEn = value;
                                                  },
                                                  decoration:
                                                      const InputDecoration(
                                                    // hintText: "write_your_notes".tr,
                                                    border: OutlineInputBorder(
                                                      borderSide:
                                                          BorderSide.none,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(10),
                                                      ),
                                                    ),
                                                    filled: true,
                                                    fillColor:
                                                        Color(0xffF5F5F5),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          title: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              GestureDetector(
                                                onTap: () => Get.back(),
                                                child: const Icon(
                                                  EvaIcons.close,
                                                ),
                                              )
                                            ],
                                          ),
                                        );

                                        //  Utils.doneDialog(context: context);
                                      },
                                    ),
                                    PopupMenuItem<int>(
                                      value: 1,
                                      child: Row(
                                        children: [
                                          Icon(EvaIcons.trash2Outline,
                                              size: 15.sp),
                                          spaceX(5.sp),
                                          coloredText(
                                              text: 'delete'.tr,
                                              fontSize: 12.0.sp),
                                        ],
                                      ),
                                      onTap: () async {
                                        bool b = await addressessController
                                            .deleteCity(
                                          city: globalController.cities[index],
                                        );
                                        if (b) {
                                          Utils.doneDialog(context: context);
                                        }
                                      },
                                    ),
                                  ],
                                  child: const Icon(
                                    EvaIcons.moreVertical,
                                  ),
                                ),
                              ),
                            ),
                        separatorBuilder: (context, index) => spaceY(10.sp),
                        itemCount: globalController.cities.length),
              )
            ],
          );
        });
      });

  Widget tab2() => GetBuilder<GlobalController>(builder: (globalController) {
        return GetBuilder<AddressessController>(
            builder: (addressessController) {
          return Column(
            children: [
              spaceY(20.sp),
              primaryBorderedButton(
                  onTap: () {
                    Get.to(() => AdminCreateCountry());
                    // Country country = Country();
                    // Utils.showDialogBox(
                    //   context: context,
                    //   actions: [
                    //     primaryButton(
                    //       onTap: () async {
                    //         Get.back();
                    //         bool b = await addressessController.createCountry(
                    //             country: country);
                    //         // ignore: use_build_context_synchronously
                    //         if (b) Utils.doneDialog(context: context);
                    //       },
                    //       color: Colors.black,
                    //       width: 50.w,
                    //       height: 40.sp,
                    //       text: coloredText(
                    //           text: "create".tr, color: Colors.white),
                    //     ),
                    //   ],
                    //   content: Column(
                    //     mainAxisSize: MainAxisSize.min,
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: [
                    //       coloredText(text: "name_ar".tr),
                    //       spaceY(5.sp),
                    //       SizedBox(
                    //         height: 35.sp,
                    //         child: TextFormField(
                    //           // maxLines: 1,
                    //           initialValue: country.nameAr,
                    //           onChanged: (value) {
                    //             country.nameAr = value;
                    //           },
                    //           decoration: const InputDecoration(
                    //             // hintText: "write_your_notes".tr,
                    //             border: OutlineInputBorder(
                    //               borderSide: BorderSide.none,
                    //               borderRadius: BorderRadius.all(
                    //                 Radius.circular(10),
                    //               ),
                    //             ),
                    //             filled: true,
                    //             fillColor: Color(0xffF5F5F5),
                    //           ),
                    //         ),
                    //       ),
                    //       spaceY(10.sp),
                    //       coloredText(text: "name_en".tr),
                    //       spaceY(5.sp),
                    //       SizedBox(
                    //         height: 35.sp,
                    //         child: TextFormField(
                    //           // maxLines: 1,
                    //           initialValue: country.nameEn,
                    //           onChanged: (value) {
                    //             country.nameEn = value;
                    //           },
                    //           decoration: const InputDecoration(
                    //             // hintText: "write_your_notes".tr,
                    //             border: OutlineInputBorder(
                    //               borderSide: BorderSide.none,
                    //               borderRadius: BorderRadius.all(
                    //                 Radius.circular(10),
                    //               ),
                    //             ),
                    //             filled: true,
                    //             fillColor: Color(0xffF5F5F5),
                    //           ),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    //   title: Row(
                    //     mainAxisAlignment: MainAxisAlignment.end,
                    //     children: [
                    //       GestureDetector(
                    //         onTap: () => Get.back(),
                    //         child: const Icon(
                    //           EvaIcons.close,
                    //         ),
                    //       )
                    //     ],
                    //   ),
                    // );
                  },
                  width: 100.w,
                  text: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(EvaIcons.plus, color: Colors.black, size: 20.sp),
                      spaceX(10.sp),
                      coloredText(text: "create_new".tr),
                    ],
                  ),
                  color: Colors.black),
              // spaceY(30.sp),
              Expanded(
                child: globalController.getCitiesFlag
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.separated(
                        primary: false,
                        shrinkWrap: true,
                        // physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => AdminItemCard(
                              // img: globalController.countries[index].flag,
                              name:
                                  "${globalController.countries[index].nameEn!} - ${globalController.countries[index].nameAr!}",
                              margin: const EdgeInsets.only(bottom: 10),
                              trailing: Theme(
                                data: ThemeData(primaryColor: Colors.white),
                                child: PopupMenuButton(
                                  constraints: BoxConstraints(
                                    minWidth: 2.0 * 56.0,
                                    maxWidth: MediaQuery.of(context).size.width,
                                  ),
                                  itemBuilder: (BuildContext cc) => [
                                    PopupMenuItem<int>(
                                      value: 0,
                                      child: Row(
                                        children: [
                                          Icon(EvaIcons.editOutline,
                                              size: 15.sp),
                                          spaceX(5.sp),
                                          coloredText(
                                              text: 'edit'.tr,
                                              fontSize: 12.0.sp),
                                        ],
                                      ),
                                      onTap: () {
                                        Get.to(() => AdminCreateCountry(
                                              countryToEdit: globalController
                                                  .countries[index],
                                            ));
                                        // Country country = Country.fromJson(
                                        //     globalController.countries[index]
                                        //         .toJson());
                                        // Utils.showDialogBox(
                                        //   context: context,
                                        //   actions: [
                                        //     primaryButton(
                                        //       onTap: () async {
                                        //         Get.back();
                                        //         bool b =
                                        //             await addressessController
                                        //                 .updateCountry(
                                        //                     country: country);
                                        //         // ignore: use_build_context_synchronously
                                        //         if (b)
                                        //           Utils.doneDialog(
                                        //               context: context);
                                        //       },
                                        //       color: Colors.black,
                                        //       width: 50.w,
                                        //       height: 40.sp,
                                        //       text: coloredText(
                                        //           text: "create".tr,
                                        //           color: Colors.white),
                                        //     ),
                                        //   ],
                                        //   content: Column(
                                        //     mainAxisSize: MainAxisSize.min,
                                        //     crossAxisAlignment:
                                        //         CrossAxisAlignment.start,
                                        //     children: [
                                        //       coloredText(text: "name_ar".tr),
                                        //       spaceY(5.sp),
                                        //       SizedBox(
                                        //         height: 35.sp,
                                        //         child: TextFormField(
                                        //           // maxLines: 1,
                                        //           initialValue: country.nameAr,
                                        //           onChanged: (value) {
                                        //             country.nameAr = value;
                                        //           },
                                        //           decoration:
                                        //               const InputDecoration(
                                        //             // hintText: "write_your_notes".tr,
                                        //             border: OutlineInputBorder(
                                        //               borderSide:
                                        //                   BorderSide.none,
                                        //               borderRadius:
                                        //                   BorderRadius.all(
                                        //                 Radius.circular(10),
                                        //               ),
                                        //             ),
                                        //             filled: true,
                                        //             fillColor:
                                        //                 Color(0xffF5F5F5),
                                        //           ),
                                        //         ),
                                        //       ),
                                        //       spaceY(10.sp),
                                        //       coloredText(text: "name_en".tr),
                                        //       spaceY(5.sp),
                                        //       SizedBox(
                                        //         height: 35.sp,
                                        //         child: TextFormField(
                                        //           // maxLines: 1,
                                        //           initialValue: country.nameEn,
                                        //           onChanged: (value) {
                                        //             country.nameEn = value;
                                        //           },
                                        //           decoration:
                                        //               const InputDecoration(
                                        //             // hintText: "write_your_notes".tr,
                                        //             border: OutlineInputBorder(
                                        //               borderSide:
                                        //                   BorderSide.none,
                                        //               borderRadius:
                                        //                   BorderRadius.all(
                                        //                 Radius.circular(10),
                                        //               ),
                                        //             ),
                                        //             filled: true,
                                        //             fillColor:
                                        //                 Color(0xffF5F5F5),
                                        //           ),
                                        //         ),
                                        //       ),
                                        //     ],
                                        //   ),
                                        //   title: Row(
                                        //     mainAxisAlignment:
                                        //         MainAxisAlignment.end,
                                        //     children: [
                                        //       GestureDetector(
                                        //         onTap: () => Get.back(),
                                        //         child: const Icon(
                                        //           EvaIcons.close,
                                        //         ),
                                        //       )
                                        //     ],
                                        //   ),
                                        // );

                                        //  Utils.doneDialog(context: context);
                                      },
                                    ),
                                    PopupMenuItem<int>(
                                      value: 1,
                                      child: Row(
                                        children: [
                                          Icon(EvaIcons.trash2Outline,
                                              size: 15.sp),
                                          spaceX(5.sp),
                                          coloredText(
                                              text: 'delete'.tr,
                                              fontSize: 12.0.sp),
                                        ],
                                      ),
                                      onTap: () async {
                                        bool b = await addressessController
                                            .deleteCountry(
                                          country:
                                              globalController.countries[index],
                                        );
                                        if (b) {
                                          Utils.doneDialog(context: context);
                                        }
                                      },
                                    ),
                                  ],
                                  child: const Icon(
                                    EvaIcons.moreVertical,
                                  ),
                                ),
                              ),
                            ),
                        separatorBuilder: (context, index) => spaceY(10.sp),
                        itemCount: globalController.countries.length),
              )
            ],
          );
        });
      });

  Widget tab3() => GetBuilder<GlobalController>(builder: (globalController) {
        return GetBuilder<AddressessController>(
            builder: (addressessController) {
          return Column(
            children: [
              spaceY(20.sp),
              primaryBorderedButton(
                  onTap: () {
                    Region region = Region();
                    Utils.showDialogBox(
                      context: context,
                      actions: [
                        primaryButton(
                          onTap: () async {
                            Get.back();
                            bool b = await addressessController.createRegion(
                                region: region);
                            // ignore: use_build_context_synchronously
                            if (b) Utils.doneDialog(context: context);
                          },
                          color: Colors.black,
                          width: 50.w,
                          height: 40.sp,
                          text: coloredText(
                              text: "create".tr, color: Colors.white),
                        ),
                      ],
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          coloredText(text: "name_ar".tr),
                          spaceY(5.sp),
                          SizedBox(
                            height: 35.sp,
                            child: TextFormField(
                              // maxLines: 1,
                              initialValue: region.nameAr,
                              onChanged: (value) {
                                region.nameAr = value;
                              },
                              decoration: const InputDecoration(
                                // hintText: "write_your_notes".tr,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                filled: true,
                                fillColor: Color(0xffF5F5F5),
                              ),
                            ),
                          ),
                          spaceY(10.sp),
                          coloredText(text: "name_en".tr),
                          spaceY(5.sp),
                          SizedBox(
                            height: 35.sp,
                            child: TextFormField(
                              // maxLines: 1,
                              initialValue: region.nameEn,
                              onChanged: (value) {
                                region.nameEn = value;
                              },
                              decoration: const InputDecoration(
                                // hintText: "write_your_notes".tr,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                filled: true,
                                fillColor: Color(0xffF5F5F5),
                              ),
                            ),
                          ),
                        ],
                      ),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () => Get.back(),
                            child: const Icon(
                              EvaIcons.close,
                            ),
                          )
                        ],
                      ),
                    );
                  },
                  width: 100.w,
                  text: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(EvaIcons.plus, color: Colors.black, size: 20.sp),
                      spaceX(10.sp),
                      coloredText(text: "create_new".tr),
                    ],
                  ),
                  color: Colors.black),
              // spaceY(30.sp),
              Expanded(
                child: globalController.getCitiesFlag
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.separated(
                        primary: false,
                        shrinkWrap: true,
                        // physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => AdminItemCard(
                              name:
                                  "${globalController.regions[index].nameEn!} - ${globalController.regions[index].nameAr!}",
                              margin: const EdgeInsets.only(bottom: 10),
                              trailing: Theme(
                                data: ThemeData(primaryColor: Colors.white),
                                child: PopupMenuButton(
                                  constraints: BoxConstraints(
                                    minWidth: 2.0 * 56.0,
                                    maxWidth: MediaQuery.of(context).size.width,
                                  ),
                                  itemBuilder: (BuildContext cc) => [
                                    PopupMenuItem<int>(
                                      value: 0,
                                      child: Row(
                                        children: [
                                          Icon(EvaIcons.editOutline,
                                              size: 15.sp),
                                          spaceX(5.sp),
                                          coloredText(
                                              text: 'edit'.tr,
                                              fontSize: 12.0.sp),
                                        ],
                                      ),
                                      onTap: () {
                                        Region region = Region.fromJson(
                                            globalController.regions[index]
                                                .toJson());
                                        Utils.showDialogBox(
                                          context: context,
                                          actions: [
                                            primaryButton(
                                              onTap: () async {
                                                Get.back();
                                                bool b =
                                                    await addressessController
                                                        .updateRegion(
                                                            region: region);
                                                // ignore: use_build_context_synchronously
                                                if (b)
                                                  Utils.doneDialog(
                                                      context: context);
                                              },
                                              color: Colors.black,
                                              width: 50.w,
                                              height: 40.sp,
                                              text: coloredText(
                                                  text: "create".tr,
                                                  color: Colors.white),
                                            ),
                                          ],
                                          content: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              coloredText(text: "name_ar".tr),
                                              spaceY(5.sp),
                                              SizedBox(
                                                height: 35.sp,
                                                child: TextFormField(
                                                  // maxLines: 1,
                                                  initialValue: region.nameAr,
                                                  onChanged: (value) {
                                                    region.nameAr = value;
                                                  },
                                                  decoration:
                                                      const InputDecoration(
                                                    // hintText: "write_your_notes".tr,
                                                    border: OutlineInputBorder(
                                                      borderSide:
                                                          BorderSide.none,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(10),
                                                      ),
                                                    ),
                                                    filled: true,
                                                    fillColor:
                                                        Color(0xffF5F5F5),
                                                  ),
                                                ),
                                              ),
                                              spaceY(10.sp),
                                              coloredText(text: "name_en".tr),
                                              spaceY(5.sp),
                                              SizedBox(
                                                height: 35.sp,
                                                child: TextFormField(
                                                  // maxLines: 1,
                                                  initialValue: region.nameEn,
                                                  onChanged: (value) {
                                                    region.nameEn = value;
                                                  },
                                                  decoration:
                                                      const InputDecoration(
                                                    // hintText: "write_your_notes".tr,
                                                    border: OutlineInputBorder(
                                                      borderSide:
                                                          BorderSide.none,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(10),
                                                      ),
                                                    ),
                                                    filled: true,
                                                    fillColor:
                                                        Color(0xffF5F5F5),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          title: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              GestureDetector(
                                                onTap: () => Get.back(),
                                                child: const Icon(
                                                  EvaIcons.close,
                                                ),
                                              )
                                            ],
                                          ),
                                        );

                                        //  Utils.doneDialog(context: context);
                                      },
                                    ),
                                    PopupMenuItem<int>(
                                      value: 1,
                                      child: Row(
                                        children: [
                                          Icon(EvaIcons.trash2Outline,
                                              size: 15.sp),
                                          spaceX(5.sp),
                                          coloredText(
                                              text: 'delete'.tr,
                                              fontSize: 12.0.sp),
                                        ],
                                      ),
                                      onTap: () async {
                                        bool b = await addressessController
                                            .deleteRegion(
                                          region:
                                              globalController.regions[index],
                                        );
                                        if (b) {
                                          Utils.doneDialog(context: context);
                                        }
                                      },
                                    ),
                                  ],
                                  child: const Icon(
                                    EvaIcons.moreVertical,
                                  ),
                                ),
                              ),
                            ),
                        separatorBuilder: (context, index) => spaceY(10.sp),
                        itemCount: globalController.regions.length),
              )
            ],
          );
        });
      });
}
