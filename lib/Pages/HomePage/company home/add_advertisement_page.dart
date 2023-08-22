import 'dart:math';

import 'package:dotted_border/dotted_border.dart' as db;
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:khedma/widgets/dropdown_menu_button.dart';
import 'package:khedma/widgets/radio_button.dart';
import 'package:sizer/sizer.dart';

import '../../../Utils/utils.dart';

// ignore: must_be_immutable
class AddAdvertismentPage extends StatefulWidget {
  const AddAdvertismentPage({super.key});

  @override
  State<AddAdvertismentPage> createState() => _AddAdvertismentPageState();
}

class _AddAdvertismentPageState extends State<AddAdvertismentPage> {
  int durationRadio = 0;
  int promotionRadio = 0;
  int durationCounter = 0;
  String? selectedValue;
  String uploadButtontext = "Upload Photo";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        title: coloredText(text: "Add Advertisment", fontSize: 15.0.sp),
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
                    uploadButtontext = result.files[0].name
                        .substring(0, min(15, result.files[0].name.length));
                    // userRegisterData.idPhotoNationality = result.files[0];
                    setState(() {});
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
                  text: "Image width:350, Image height:150",
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 12.sp,
                ),
              ],
            ),
            spaceY(20),
            coloredText(text: "Duration", fontSize: 15.sp),
            Row(
              children: [
                MyRadioButton(
                  color: Colors.black,
                  text: "Days",
                  groupValue: durationRadio,
                  value: 0,
                  onChanged: (p0) {
                    setState(() {
                      durationRadio = 0;

                      setState(() {});
                    });
                  },
                ),
                spaceX(20),
                MyRadioButton(
                  color: Colors.black,
                  text: "Hours",
                  groupValue: durationRadio,
                  value: 1,
                  onChanged: (p0) {
                    setState(() {
                      durationRadio = 1;

                      setState(() {});
                    });
                  },
                )
              ],
            ),
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
                      text: durationCounter.toString(),
                      color: const Color(0xff919191),
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            durationCounter++;
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
            coloredText(text: "Promotion URL", fontSize: 15.sp),
            Column(
              children: [
                MyRadioButton(
                  color: Colors.black,
                  text: "Company page",
                  groupValue: promotionRadio,
                  value: 0,
                  onChanged: (p0) {
                    setState(() {
                      promotionRadio = 0;

                      setState(() {});
                    });
                  },
                ),
                spaceY(5),
                MyRadioButton(
                  color: Colors.black,
                  text: "External link",
                  groupValue: promotionRadio,
                  value: 1,
                  onChanged: (p0) {
                    setState(() {
                      promotionRadio = 1;

                      setState(() {});
                    });
                  },
                )
              ],
            ),
            spaceY(20),
            coloredText(text: "Promotion place", fontSize: 15.sp),
            CustomDropDownMenuButton(
              height: 38.sp,
              items: ["item", "item2"]
                  .map(
                    (e) => DropdownMenuItem<String>(
                      value: e,
                      child: coloredText(text: e, color: Colors.black),
                    ),
                  )
                  .toList(),
              onChanged: (p0) {},
              fillColor: const Color(0xffF3F2F2),
              borderc: Border.all(color: const Color(0xffF3F2F2)),
              borderRadius: BorderRadius.circular(8),
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 10),
            ),
            spaceY(20),
            Row(
              children: [
                coloredText(text: "Payment summary:", fontSize: 15.sp),
                spaceX(50),
                primaryButton(
                  color:
                      Theme.of(context).colorScheme.secondary.withOpacity(0.1),
                  width: 20.0.w,
                  height: 45,
                  radius: 8,
                  text: coloredText(
                      text: "30\$",
                      fontSize: 13.0.sp,
                      color: Theme.of(context).colorScheme.secondary),
                ),
              ],
            ),
            spaceY(40),
            primaryButton(
                onTap: () {},
                width: 50.0.w,
                gradient: LinearGradient(colors: [
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.secondary,
                ]),
                text: coloredText(
                  text: "apply",
                  color: Colors.white,
                )),
            spaceY(20),
          ],
        ),
      ),
    );
  }
}
