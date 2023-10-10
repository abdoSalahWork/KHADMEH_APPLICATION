// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'dart:math';

import 'package:dotted_border/dotted_border.dart' as db;
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:khedma/Admin/controllers/admin_controller.dart';
import 'package:khedma/Pages/HomePage/controllers/advertisment_controller.dart';
import 'package:khedma/Pages/HomePage/models/advertisment_model.dart';
import 'package:khedma/Themes/themes.dart';
import 'package:khedma/widgets/radio_button.dart';
import 'package:khedma/widgets/underline_text_field.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../Utils/utils.dart';

// ignore: must_be_immutable
class AddAdvertismentPage extends StatefulWidget {
  const AddAdvertismentPage({super.key, this.advertismentToEdit});
  final AdvertismentModel? advertismentToEdit;
  @override
  State<AddAdvertismentPage> createState() => _AddAdvertismentPageState();
}

class _AddAdvertismentPageState extends State<AddAdvertismentPage> {
  AdvertismentController _advertismentController = Get.find();
  AdvertismentModel advertismentToCreate = AdvertismentModel();
  AdminController _adminController = Get.find();

  int durationRadio = 0;
  int promotionRadio = 1;
  int durationCounter = 0;
  String? selectedValue;
  String uploadButtontext = "${"upload".tr} ${"photo".tr}";
  final TextEditingController _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        title: coloredText(text: "add_advertisment".tr, fontSize: 15.0.sp),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          primary: false,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            db.DottedBorder(
              dashPattern: const [6, 6, 6, 6],
              padding: const EdgeInsets.all(1),
              radius: const Radius.circular(10),
              color: const Color(0xffAEAEAE),
              borderType: db.BorderType.RRect,
              child: primaryButton(
                radius: 10,
                onTap: () async {
                  final result = await FilePicker.platform.pickFiles(
                    allowMultiple: false,
                    type: FileType.image,
                  );
                  if (result != null) {
                    File f = File(result.files[0].path!);
                    var decodedImage =
                        await decodeImageFromList(f.readAsBytesSync());
                    double aspectRatio =
                        (decodedImage.width / decodedImage.height)
                            .toPrecision(1);
                    if (aspectRatio == 1.8) {
                      uploadButtontext = result.files[0].name
                          .substring(0, min(15, result.files[0].name.length));
                      advertismentToCreate.image = result.files[0];
                      setState(() {});
                    } else {
                      Utils.customDialog(
                          actions: [
                            primaryButton(
                              onTap: () => Get.back(),
                              text: coloredText(
                                text: "close".tr,
                                color: Colors.white,
                              ),
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ],
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: coloredText(
                                text: "image_ratio".tr,
                                textAlign: TextAlign.center,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          ),
                          context: context);
                    }
                  }
                },
                width: 100.0.w,
                height: 15.h,
                color: const Color(0xffAEAEAE).withOpacity(0.1),
                text: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      EvaIcons.upload,
                      color: Colors.black,
                    ),
                    spaceX(10),
                    coloredText(
                      text: uploadButtontext,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ),
            spaceY(10),
            Row(
              children: [
                Icon(
                  EvaIcons.infoOutline,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                spaceX(10),
                coloredText(
                  text: "image_ratio".tr,
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 12.sp,
                ),
              ],
            ),
            spaceY(20),
            coloredText(text: "duration".tr, fontSize: 15.sp),
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                width: 60.w,
                height: 38.sp,
                decoration: BoxDecoration(
                  color: const Color(0xffF3F2F2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    coloredText(
                      text: "$durationCounter ${"day".tr}",
                      color: const Color(0xff919191),
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            durationCounter++;
                            advertismentToCreate.durationByDay =
                                durationCounter;
                            setState(() {});
                          },
                          child: const Icon(
                            EvaIcons.plusCircleOutline,
                            color: Color(0xff919191),
                          ),
                        ),
                        spaceX(10),
                        GestureDetector(
                          onTap: () {
                            if (durationCounter > 0) {
                              durationCounter--;
                              advertismentToCreate.durationByDay =
                                  durationCounter;
                            }
                            setState(() {});
                          },
                          child: const Icon(
                            EvaIcons.minusCircleOutline,
                            color: Color(0xff919191),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            spaceY(20),
            coloredText(text: "promotion_url".tr, fontSize: 15.sp),
            Column(
              children: [
                MyRadioButton(
                  color: Colors.black,
                  text: "company_page".tr,
                  groupValue: promotionRadio,
                  value: 1,
                  onChanged: (p0) {
                    setState(() {
                      promotionRadio = 1;
                      advertismentToCreate.promotionType = promotionRadio;
                      advertismentToCreate.externalLink = null;

                      setState(() {});
                    });
                  },
                ),
                spaceY(5),
                MyRadioButton(
                  color: Colors.black,
                  text: "external_link".tr,
                  groupValue: promotionRadio,
                  value: 2,
                  onChanged: (p0) {
                    setState(() {
                      promotionRadio = 2;
                      advertismentToCreate.promotionType = promotionRadio;

                      setState(() {});
                    });
                  },
                )
              ],
            ),
            spaceY(20),
            promotionRadio == 1
                ? Container()
                : SendMessageTextField(
                    borderRadius: 10,
                    fillColor: const Color(0xffF3F2F2),
                    autovalidateMode: AutovalidateMode.always,
                    onchanged: (s) {
                      advertismentToCreate.externalLink = s;
                    },
                    validator: (s) {
                      var urlPattern =
                          r"(https?|http)://([-A-Z0-9.]+)(/[-A-Z0-9+&@#/%=~_|!:,.;]*)?(\?[A-Z0-9+&@#/%=~_|!:‌​,.;]*)?";
                      bool validURL =
                          RegExp(urlPattern, caseSensitive: false).hasMatch(s!);

                      if (!validURL && s.isNotEmpty) {
                        return "must be a valid link";
                      }
                      return null;
                    },
                    focusNode: FocusNode(),
                  ),
            promotionRadio == 1 ? Container() : spaceY(20),
            coloredText(text: "start_date".tr, fontSize: 15.sp),
            // CustomDropDownMenuButton(
            //   height: 38.sp,
            //   items: ["item", "item2"]
            //       .map(
            //         (e) => DropdownMenuItem<String>(
            //           value: e,
            //           child: coloredText(text: e, color: Colors.black),
            //         ),
            //       )
            //       .toList(),
            //   onChanged: (p0) {},
            //   fillColor: const Color(0xffF3F2F2),
            //   borderc: Border.all(color: const Color(0xffF3F2F2)),
            //   borderRadius: BorderRadius.circular(8),
            //   padding: const EdgeInsetsDirectional.symmetric(horizontal: 10),
            // ),
            SendMessageTextField(
              onTap: () async {
                DateTime? x = await showDatePicker(
                  builder: (context, child) => Theme(
                    data: ThemeData(
                      colorScheme: ColorScheme.fromSeed(
                        seedColor: AppThemes.colorCustom,
                      ),
                    ),
                    child: child!,
                  ),
                  context: context,
                  initialDate: DateTime.now().add(
                    const Duration(days: 2),
                  ),
                  firstDate: DateTime.now().add(
                    const Duration(days: 2),
                  ),
                  lastDate: DateTime.now().add(
                    const Duration(days: 365 * 15),
                  ),
                );
                if (x != null) {
                  _dateController.text = DateFormat('y/MM/dd').format(x);
                }
              },
              focusNode: FocusNode(),
              hintText: 'YYYY/MM/DD',
              fillColor: const Color(0xffF8F8F8),
              borderRadius: 10,
              controller: _dateController,
              readOnly: true,
            ),

            spaceY(20),
            Row(
              children: [
                coloredText(
                    text: "${"advertisment_price".tr} :", fontSize: 15.sp),
                spaceX(50),
                primaryButton(
                  color:
                      Theme.of(context).colorScheme.secondary.withOpacity(0.1),
                  width: 20.0.w,
                  height: 45,
                  radius: 8,
                  text: coloredText(
                      text:
                          "${int.parse(_adminController.settingAdmin.advertisementPrice!) * durationCounter} KWD",
                      fontSize: 13.0.sp,
                      color: Theme.of(context).colorScheme.secondary),
                ),
              ],
            ),
            spaceY(40),
            primaryButton(
                onTap: () async {
                  advertismentToCreate.startDate = _dateController.text;
                  advertismentToCreate.promotionType = promotionRadio;
                  advertismentToCreate.amount = (int.parse(_adminController
                              .settingAdmin.advertisementPrice!) *
                          durationCounter)
                      .toString();

                  String? b = await _advertismentController.createAdvertisment(
                      advertisment: advertismentToCreate);
                  if (b != null) {
                    Utils.customDialog(
                        actions: [
                          primaryButton(
                            onTap: () async {
                              Get.back();
                              Uri url = Uri.parse(b);
                              await launchUrl(url,
                                  mode: LaunchMode.externalApplication);

                              await Future.delayed(Duration(milliseconds: 100));
                              while (WidgetsBinding.instance.lifecycleState !=
                                  AppLifecycleState.resumed) {
                                await Future.delayed(
                                    Duration(milliseconds: 100));
                              }
                              Get.back();
                            },
                            width: 40.0.w,
                            height: 50,
                            radius: 10.w,
                            color: Theme.of(context).colorScheme.primary,
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
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              spaceY(20),
                              Icon(
                                EvaIcons.checkmarkCircle,
                                color: Theme.of(context).colorScheme.secondary,
                                size: 40.sp,
                              ),
                              spaceY(20),
                              coloredText(
                                  text: "your_advertisment_has_added".tr,
                                  fontSize: 12.0.sp),
                              coloredText(
                                text: "successfully".tr,
                                fontSize: 14.0.sp,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ],
                          ),
                        ));
                  }
                },
                width: 50.0.w,
                gradient: LinearGradient(colors: [
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.secondary,
                ]),
                text: coloredText(
                  text: "add".tr,
                  color: Colors.white,
                )),
            spaceY(20),
          ],
        ),
      ),
    );
  }
}
