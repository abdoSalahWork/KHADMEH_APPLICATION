// ignore_for_file: must_be_immutable

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khedma/Pages/HomePage/models/advertisment_model.dart';
import 'package:khedma/Utils/utils.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class AdvertismentCard extends StatelessWidget {
  AdvertismentCard({
    super.key,
    required this.advertismentModel,
    this.refused = false,
    this.admin = false,
    this.pending = false,
    this.status = false,
    this.refunds = false,
  });
  final AdvertismentModel advertismentModel;
  bool refused;
  bool admin;
  bool pending;
  bool status;
  bool refunds;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 100.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Image(
            image: AssetImage("assets/images/adv_background.png"),
          ),
        ),
        spaceY(10.sp),
        adText(
            blackText: "duration".tr,
            greyText: "${advertismentModel.durationByDay} ${"day".tr}"),
        spaceY(10.sp),
        adText(
            blackText: "end_date".tr, greyText: "${advertismentModel.endDate}"),
        spaceY(10.sp),
        adText(
            blackText: "promotion_url".tr,
            greyText: advertismentModel.promotionType == 1
                ? "company_page".tr
                : advertismentModel.externalLink!),
        spaceY(10.sp),
        adText(blackText: "price".tr, greyText: "50\$"),
        !admin && refused ? spaceY(10.sp) : Container(),
        !admin && refused
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    EvaIcons.infoOutline,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  coloredText(
                    text: "${"comment".tr}:  ",
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  Expanded(
                    child: coloredText(
                        text:
                            "Lorem ipsum dolor sit amet consectetur adipiscing elit",
                        fontSize: 11.sp),
                  )
                ],
              )
            : Container(),
        !admin && refused ? spaceY(10.sp) : Container(),
        !admin && refused
            ? Row(
                children: [
                  primaryButton(
                    width: 35.w,
                    height: 30.sp,
                    radius: 20.sp,
                    color: Theme.of(context)
                        .colorScheme
                        .secondary
                        .withOpacity(0.1),
                    text: coloredText(
                        text: "edit".tr,
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                  spaceX(10.sp),
                  primaryButton(
                    width: 35.w,
                    height: 30.sp,
                    radius: 20.sp,
                    color: const Color(0xff919191).withOpacity(0.1),
                    text: coloredText(
                        text: "refund".tr, color: const Color(0xff919191)),
                  )
                ],
              )
            : Container(),
        admin && pending ? spaceY(10.sp) : Container(),
        admin && pending
            ? Row(
                children: [
                  primaryButton(
                    width: 35.w,
                    height: 30.sp,
                    radius: 20.sp,
                    color: Theme.of(context)
                        .colorScheme
                        .secondary
                        .withOpacity(0.1),
                    text: coloredText(
                        text: "accept".tr,
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                  spaceX(10.sp),
                  primaryButton(
                    onTap: () {
                      Utils.showDialogBox(
                        context: context,
                        actions: [
                          primaryButton(
                            onTap: () {
                              Get.back();
                              Utils.customDialog(
                                  actions: [
                                    primaryButton(
                                      onTap: () {
                                        Get.back();
                                      },
                                      width: 40.0.w,
                                      height: 50,
                                      radius: 10.w,
                                      color: Colors.black,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
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
                                            text: "your_note_have_been_sent".tr,
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
                            },
                            color: Colors.black,
                            width: 45.w,
                            height: 50,
                            text: coloredText(
                                text: "submit".tr, color: Colors.white),
                          ),
                        ],
                        content: TextFormField(
                          maxLines: 5,
                          decoration: InputDecoration(
                            hintText: "write_your_notes".tr,
                            border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            filled: true,
                            fillColor: const Color(0xffF5F5F5),
                          ),
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
                    width: 35.w,
                    height: 30.sp,
                    radius: 20.sp,
                    color: const Color(0xffC13535).withOpacity(0.1),
                    text: coloredText(
                        text: "refuse".tr, color: const Color(0xffC13535)),
                  )
                ],
              )
            : Container(),
        admin && refunds ? spaceY(10.sp) : Container(),
        admin && refunds
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    EvaIcons.infoOutline,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  coloredText(
                    text: "${"comment".tr}:  ",
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  Expanded(
                    child: coloredText(
                        text: "Lorem ipsum dolor sit amet cour adipiscing elit",
                        fontSize: 11.sp),
                  )
                ],
              )
            : Container(),
        admin && refunds ? spaceY(10.sp) : Container(),
        admin && refunds
            ? Row(
                children: [
                  primaryButton(
                    width: 35.w,
                    height: 30.sp,
                    radius: 20.sp,
                    color: Theme.of(context)
                        .colorScheme
                        .secondary
                        .withOpacity(0.1),
                    text: coloredText(
                        text: "accept".tr,
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                  spaceX(10.sp),
                  primaryButton(
                    onTap: () {
                      Utils.showDialogBox(
                        context: context,
                        actions: [
                          primaryButton(
                            onTap: () {
                              Get.back();
                              Utils.customDialog(
                                  actions: [
                                    primaryButton(
                                      onTap: () {
                                        Get.back();
                                      },
                                      width: 40.0.w,
                                      height: 50,
                                      radius: 10.w,
                                      color: Colors.black,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
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
                                            text: "your_note_have_been_sent".tr,
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
                            },
                            color: Colors.black,
                            width: 45.w,
                            height: 50,
                            text: coloredText(
                                text: "submit".tr, color: Colors.white),
                          ),
                        ],
                        content: TextFormField(
                          maxLines: 5,
                          decoration: InputDecoration(
                            hintText: "write_your_notes".tr,
                            border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            filled: true,
                            fillColor: const Color(0xffF5F5F5),
                          ),
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
                    width: 35.w,
                    height: 30.sp,
                    radius: 20.sp,
                    color: const Color(0xffC13535).withOpacity(0.1),
                    text: coloredText(
                        text: "refuse".tr, color: const Color(0xffC13535)),
                  )
                ],
              )
            : Container(),
        admin && status ? spaceY(10.sp) : Container(),
        admin && status
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  coloredText(
                    text: "${"status".tr}:  ",
                  ),
                  coloredText(
                    text: "accepted".tr,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ],
              )
            : Container(),
      ],
    );
  }

  Row adText({
    required String blackText,
    required String greyText,
  }) {
    return Row(
      children: [
        coloredText(text: "$blackText:"),
        spaceX(10.sp),
        GestureDetector(
          onTap: () async {
            if (greyText.startsWith("http")) {
              final Uri _url = Uri.parse(greyText);

              if (!await launchUrl(
                _url,
              )) {
                throw Exception('Could not launch $_url');
              }
            }
          },
          child: coloredText(
              textDirection:
                  greyText.startsWith("http") ? TextDirection.ltr : null,
              text: greyText.length > 18
                  ? "${greyText.substring(0, 18)}..."
                  : greyText,
              color: Colors.grey),
        ),
      ],
    );
  }
}
