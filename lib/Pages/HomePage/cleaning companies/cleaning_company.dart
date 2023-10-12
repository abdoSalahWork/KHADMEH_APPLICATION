import 'package:badges/badges.dart' as badges;
import 'package:chips_choice/chips_choice.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khedma/Pages/HomePage/cleaning%20companies/cart_page.dart';
import 'package:khedma/Pages/HomePage/controllers/companies_controller.dart';
import 'package:khedma/Pages/HomePage/models/company_model.dart';
import 'package:khedma/Pages/chat%20page/chat_page.dart';
import 'package:khedma/Pages/chat%20page/controller/chat_controller.dart';
import 'package:khedma/Pages/chat%20page/model/my_message.dart';
import 'package:khedma/Pages/global_controller.dart';
import 'package:khedma/widgets/cleaning_company_service_widget.dart';
import 'package:khedma/widgets/no_items_widget.dart';
import 'package:sizer/sizer.dart';

import '../../../Utils/utils.dart';

class CleaningCompany extends StatefulWidget {
  const CleaningCompany({super.key, required this.cleaningCompany});
  final CompanyModel cleaningCompany;
  @override
  State<CleaningCompany> createState() => _CleaningCompanyState();
}

class _CleaningCompanyState extends State<CleaningCompany> {
  PageController _pageController = PageController(initialPage: 0);
  final CompaniesController _cleaningCompanyController = Get.find();
  final GlobalController _globalController = Get.find();
  ChatController _chatController = Get.find();

  List<String> tags = [
    "services".tr,
  ];

  List<String> options = [
    "services".tr,
    // "rate_view".tr,
  ];

  @override
  void initState() {
    _cleaningCompanyController.geCompanyPrice(
        companyId: widget.cleaningCompany.id!);
    logSuccess("companyId:" + widget.cleaningCompany.id!.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: !tags.contains("services".tr)
            ? null
            : _globalController.guest
                ? Container()
                : Theme(
                    data: ThemeData(
                      useMaterial3: false,
                    ),
                    child: FloatingActionButton(
                      onPressed: () {
                        Get.to(() => CartPage(
                              companyId: widget.cleaningCompany.id!,
                            ));
                      },
                      child: GetBuilder<CompaniesController>(builder: (c) {
                        return badges.Badge(
                          showBadge: c.servicesBooked.isNotEmpty,
                          badgeContent: coloredText(
                              text: c.servicesBooked.length.toString(),
                              color: Colors.white),
                          position: badges.BadgePosition.topEnd(
                              top: -5.sp, end: -5.sp),
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
                              EvaIcons.shoppingCartOutline,
                              color: Colors.white,
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
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
                        _globalController.guest
                            ? Container()
                            : GestureDetector(
                                child: Icon(
                                  EvaIcons.messageCircle,
                                  color: Colors.white,
                                  size: 22.0.sp,
                                ),
                                onTap: () async {
                                  MyChat? chat =
                                      await _chatController.storeChat(
                                          id: widget.cleaningCompany.id!);
                                  if (chat != null) {
                                    Get.to(
                                      () => ChatPage(
                                        chatId: chat.id!,
                                        receiverId: _globalController.me.id ==
                                                chat.participants![0].userId
                                            ? chat.participants![1].chatId!
                                            : chat.participants![0].chatId!,
                                        recieverName: _globalController.me.id ==
                                                chat.participants![0].userId
                                            ? chat.participants![1].user!
                                                .fullName!
                                            : chat.participants![0].user!
                                                .fullName!,
                                        recieverImage: _globalController
                                                    .me.userType ==
                                                "company"
                                            ? _globalController.me.id ==
                                                    chat.participants![0].userId
                                                ? chat
                                                    .participants![1]
                                                    .user!
                                                    .userInformation!
                                                    .personalPhoto!
                                                : chat
                                                    .participants![0]
                                                    .user!
                                                    .userInformation!
                                                    .personalPhoto!
                                            : _globalController.me.id ==
                                                    chat.participants![0].userId
                                                ? chat
                                                    .participants![1]
                                                    .user!
                                                    .companyInformation!
                                                    .companyLogo!
                                                : chat
                                                    .participants![0]
                                                    .user!
                                                    .companyInformation!
                                                    .companyLogo!,
                                      ),
                                    );
                                  }
                                  // Get.to(() => const MessagesPage());
                                },
                              ),
                      ],
                    ),
                    spaceY(1.0.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          // onTap: () => Get.to(() => const CleaningCompany(),
                          //     ),
                          child: Container(
                            width: 75.0.sp,
                            height: 75.0.sp,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: NetworkImage(widget.cleaningCompany
                                      .companyInformation!.companyLogo),
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
                                  text: widget.cleaningCompany.fullName!,
                                  color: Colors.white,
                                  fontSize: 16.0.sp),
                              spaceY(6),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    EvaIcons.pin,
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    size: 15.0.sp,
                                  ),
                                  spaceX(3),
                                  coloredText(
                                    text: _globalController.cities
                                        .where((element) =>
                                            widget.cleaningCompany
                                                .companyInformation!.cityId ==
                                            element.id)
                                        .map((e) => Get.locale ==
                                                const Locale('en', 'US')
                                            ? e.nameEn!
                                            : e.nameAr!)
                                        .first,
                                    color:
                                        Theme.of(context).colorScheme.secondary,
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
                                    text: widget.cleaningCompany
                                        .companyInformation!.companyPhone!,
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
                                    text: widget
                                        .cleaningCompany.reviewCompanyCount!
                                        .toString(),
                                    fontSize: 13.0.sp,
                                    color: Colors.white,
                                  ),
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
                                    _pageController.jumpToPage(
                                        options.indexOf(item.label));

                                    setState(() {});
                                  },
                                  child: Container(
                                    // width: 45.0.w,
                                    height: 40,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 2.0.w),
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 6.w),
                                    decoration: BoxDecoration(
                                        color: !tags.contains(item.label)
                                            ? const Color(0xffE8E8E8)
                                                .withOpacity(0)
                                            : Theme.of(context)
                                                .colorScheme
                                                .secondary,
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
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // spaceY(1.0.h),
            Expanded(
                child: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: pageList,
            ))
          ],
        ));
  }

  List<Widget> get pageList => [
        GetBuilder<CompaniesController>(builder: (c) {
          return widget.cleaningCompany.cleaningServices!.isEmpty
              ? const Center(child: NoItemsWidget())
              : ListView.separated(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  itemBuilder: (context, index) => CleaningServiceWidget(
                    added: _cleaningCompanyController.servicesBooked
                        .where((element) =>
                            element.serviceId ==
                            widget.cleaningCompany.cleaningServices![index].id!)
                        .isNotEmpty,
                    index: index,
                    price:
                        widget.cleaningCompany.cleaningServices![index].price!,
                    name: _globalController.categories
                        .where((element) =>
                            element.id ==
                            widget.cleaningCompany.cleaningServices![index]
                                .serviceId)
                        .map(
                          (e) => Get.locale == const Locale('en', 'US')
                              ? e.nameEn!
                              : e.nameAr!,
                        )
                        .first,
                    image: _globalController.categories
                        .where((element) =>
                            element.id ==
                            widget.cleaningCompany.cleaningServices![index]
                                .serviceId)
                        .first
                        .image,
                    serviceId:
                        widget.cleaningCompany.cleaningServices![index].id!,
                  ),
                  separatorBuilder: (context, index) => spaceY(20.sp),
                  itemCount: widget.cleaningCompany.cleaningServices!.length,
                );
        }),
        // ListView(
        //   padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
        //   children: [
        //     coloredText(
        //       text: "rate_view".tr,
        //       color: Theme.of(context).colorScheme.primary,
        //     ),
        //     const Divider(
        //       color: Color(0xffDBDBDB),
        //     ),
        //     spaceY(10),
        //     Row(
        //       children: [
        //         coloredText(
        //           text: "4.5",
        //           fontSize: 35.0.sp,
        //           color: Theme.of(context).colorScheme.primary,
        //           // fontWeight: FontWeight.bold,
        //         ),
        //         spaceX(30),
        //         Expanded(
        //           child: Column(
        //             children: [
        //               const MyRatingBar(label: '5', value: 50),
        //               spaceY(3),
        //               const MyRatingBar(label: '4', value: 20),
        //               spaceY(3),
        //               const MyRatingBar(label: '3', value: 70),
        //               spaceY(3),
        //               const MyRatingBar(label: '2', value: 10),
        //               spaceY(3),
        //               const MyRatingBar(label: '1', value: 90),
        //             ],
        //           ),
        //         ),
        //       ],
        //     ),
        //     spaceY(20),
        //     ListView.separated(
        //         shrinkWrap: true,
        //         primary: false,
        //         padding: EdgeInsets.zero,
        //         physics: const NeverScrollableScrollPhysics(),
        //         itemBuilder: (context, index) => Column(
        //               children: [
        //                 Row(
        //                   children: [
        //                     Container(
        //                       width: 12.0.w,
        //                       height: 12.0.w,
        //                       decoration: const BoxDecoration(
        //                         shape: BoxShape.circle,
        //                         image: DecorationImage(
        //                             image:
        //                                 AssetImage("assets/images/image.png"),
        //                             fit: BoxFit.cover),
        //                       ),
        //                     ),
        //                     spaceX(10),
        //                     coloredText(
        //                       text: "Ahmad ALi",
        //                       color: Colors.black,
        //                       fontSize: 14.0.sp,
        //                     )
        //                   ],
        //                 ),
        //                 Align(
        //                     alignment: AlignmentDirectional.centerStart,
        //                     child: r.RatingBar.readOnly(
        //                       isHalfAllowed: true,
        //                       filledIcon: Icons.star_rounded,
        //                       halfFilledIcon: Icons.star_half_rounded,
        //                       emptyIcon: Icons.star_border_rounded,
        //                       filledColor: Colors.black,
        //                       halfFilledColor: Colors.black,
        //                       emptyColor: Colors.black,
        //                       initialRating: 3.5,
        //                       maxRating: 5,
        //                       size: 18.0.sp,
        //                     )
        //                     //  RatingBar.builder(
        //                     //   initialRating: 4.5,
        //                     //   minRating: 0,
        //                     //   direction: Axis.horizontal,
        //                     //   allowHalfRating: true,
        //                     //   itemCount: 5,
        //                     //   itemSize: 17.0.sp,unratedColor: Colors.transparent,
        //                     //   itemPadding:
        //                     //       EdgeInsets.symmetric(horizontal: 4.0),
        //                     //   itemBuilder: (context, index) {
        //                     //     if (index < 4.5) {
        //                     //       return const Icon(
        //                     //         Icons.star_rounded,
        //                     //         color: Colors.black,
        //                     //       );
        //                     //     } else {
        //                     //       return const Icon(
        //                     //         Icons.star_outline_rounded,
        //                     //         color: Colors.black,
        //                     //       );
        //                     //     }
        //                     //   },
        //                     //   onRatingUpdate: (rating) {
        //                     //     print(rating);
        //                     //   },
        //                     // ),

        //                     ),
        //                 spaceY(10),
        //                 coloredText(
        //                     text:
        //                         "Lorem ipsum dolor sit amet consectetur adipiscing elit",
        //                     color: const Color(0xff919191))
        //               ],
        //             ),
        //         separatorBuilder: (context, index) => spaceY(20),
        //         itemCount: 10),
        //     spaceY(20),
        //   ],
        // ),
      ];
}
