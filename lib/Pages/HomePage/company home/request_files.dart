import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../Utils/utils.dart';

// ignore: must_be_immutable
class RequestFilesPage extends StatefulWidget {
  const RequestFilesPage({super.key});

  @override
  State<RequestFilesPage> createState() => _RequestFilesPageState();
}

class _RequestFilesPageState extends State<RequestFilesPage> {
  List<ContractFiles> contractFiles = List<ContractFiles>.generate(
      5,
      (index) =>
          ContractFiles("assets/images/contract.png", "File Name", "50 KB"));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        title: coloredText(text: "Show files", fontSize: 15.0.sp),
      ),
      body: ListView(
        primary: false,
        padding: const EdgeInsets.all(20),
        children: [
          primaryButton(
            width: 100.w,
            color: const Color(0xffF5F5F5),
            text: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(EvaIcons.download),
                spaceX(10),
                coloredText(text: "Download files"),
              ],
            ),
          ),
          spaceY(20),
          SizedBox(
            height: 65.h,
            child: GridView.count(
              childAspectRatio: 0.65,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              crossAxisCount: 2,
              children: List.generate(contractFiles.length, (index) {
                return Column(
                  children: [
                    Container(
                      height: 200,
                      width: 300,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(contractFiles[index].file),
                        ),
                      ),
                    ),
                    coloredText(
                      text: contractFiles[index].name,
                      fontSize: 14.sp,
                    ),
                    spaceY(10),
                    coloredText(
                        text: contractFiles[index].size,
                        fontSize: 12.sp,
                        color: const Color(0xff919191))
                  ],
                );
              }),
            ),
          ),
          spaceY(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              primaryButton(
                color: Colors.black,
                width: 43.w,
                height: 50,
                text: coloredText(text: "Approve", color: Colors.white),
              ),
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
                                  crossAxisAlignment: CrossAxisAlignment.center,
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
                        text:
                            coloredText(text: "submit".tr, color: Colors.white),
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
                        fillColor: Color(0xffF5F5F5),
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
                width: 43.w,
                height: 50,
                color: const Color(0xffEEEEEE),
                text: coloredText(
                  text: "Missing files",
                  color: const Color(0xff919191),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class ContractFiles {
  final String file;
  final String name;
  final String size;

  ContractFiles(this.file, this.name, this.size);
}
