// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:android_path_provider/android_path_provider.dart';
import 'package:dio/dio.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:khedma/Admin/pages/jobs/models/job_model.dart';
import 'package:khedma/Pages/HomePage/company%20home/models/employee_model.dart';
import 'package:khedma/Pages/HomePage/controllers/employees_controller.dart';
import 'package:khedma/Pages/global_controller.dart';
import 'package:khedma/Pages/invooice/invoice_page.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../Utils/utils.dart';

// ignore: must_be_immutable
class EmployeePage extends StatefulWidget {
  EmployeePage({
    super.key,
    required this.employeeModel,
  });
  EmployeeModel employeeModel;
  @override
  State<EmployeePage> createState() => _EmployeePageState();
}

class _EmployeePageState extends State<EmployeePage> {
  List<JobModel?> jobs = [];
  GlobalController _globalController = Get.find();
  EmployeesController _employeesController = Get.find();
  String invoiceId = "12314";
  bool contractFlag = false;
  @override
  void initState() {
    jobs = widget.employeeModel.jobs!;

    if (widget.employeeModel.status != null &&
        widget.employeeModel.status!.status == "pending") contractFlag = true;
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
            height: contractFlag ? 52.0.h : 48.0.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                spaceY(1.0.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 75.0.sp,
                        height: 75.0.sp,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ],
                          borderRadius: BorderRadius.circular(20.0.w),
                          image: DecorationImage(
                            image: NetworkImage(widget.employeeModel.image!),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    spaceX(20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              coloredText(
                                  text: Get.locale == const Locale('en', 'US')
                                      ? widget.employeeModel.nameEn!
                                      : widget.employeeModel.nameAr!,
                                  color: Colors.white,
                                  fontSize: 15.0.sp),
                              spaceX(5),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 3),
                                decoration: BoxDecoration(
                                    color: const Color(0xff020404)
                                        .withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(20)),
                                child: coloredText(
                                    text: widget.employeeModel.isOffer != 1
                                        ? "${int.parse(widget.employeeModel.contractAmount!) / int.parse(widget.employeeModel.contractDuration!)} KWD/y"
                                        : "${widget.employeeModel.amountAfterDiscount! / int.parse(widget.employeeModel.contractDuration!)} KWD/y",
                                    color: Colors.white,
                                    fontSize: 9.0.sp),
                              )
                            ],
                          ),
                          spaceY(10),
                          SizedBox(
                            height: 25,
                            child: ListView.separated(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) =>
                                  Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 2, horizontal: 20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  // color: const Color(0xffF8F8F8),
                                  border: Border.all(
                                    color: const Color(0xffE8E8E8),
                                  ),
                                ),
                                child: coloredText(
                                  text: Get.locale == const Locale('en', 'US')
                                      ? jobs[index]!.nameEn!
                                      : jobs[index]!.nameAr!,
                                  color: const Color(0xffE8E8E8),
                                  fontSize: 11.0.sp,
                                ),
                              ),
                              itemCount: jobs.length,
                              separatorBuilder:
                                  (BuildContext context, int index) =>
                                      spaceX(5),
                            ),
                          ),
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
                                text: Get.locale == const Locale('en', 'US')
                                    ? _globalController.countries
                                        .where((element) =>
                                            element.id ==
                                            widget.employeeModel.nationalityId!)
                                        .first
                                        .nameEn!
                                    : _globalController.countries
                                        .where((element) =>
                                            element.id ==
                                            widget.employeeModel.nationalityId!)
                                        .first
                                        .nameAr!,
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
                                EvaIcons.heart,
                                color: const Color(0xffD4D4D4),
                                size: 13.0.sp,
                              ),
                              spaceX(5),
                              coloredText(
                                text: Get.locale == const Locale('en', 'US')
                                    ? _globalController.maritalStatusList
                                        .where((element) =>
                                            element.id ==
                                            widget.employeeModel.maritalStatus!)
                                        .first
                                        .nameEn!
                                    : _globalController.maritalStatusList
                                        .where((element) =>
                                            element.id ==
                                            widget.employeeModel.maritalStatus!)
                                        .first
                                        .nameAr!,
                                fontSize: 12.0.sp,
                                color: const Color(0xffD4D4D4),
                              ),
                            ],
                          ),
                          spaceY(10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.g_translate_rounded,
                                color: const Color(0xffD4D4D4),
                                size: 13.0.sp,
                              ),
                              spaceX(5),
                              coloredText(
                                text: widget.employeeModel.languages!
                                    .map((e) =>
                                        Get.locale == const Locale('en', 'US')
                                            ? e.nameEn!
                                            : e.nameAr!)
                                    .toList()
                                    .join(", "),
                                fontSize: 12.0.sp,
                                color: const Color(0xffD4D4D4),
                              ),
                            ],
                          ),
                          spaceY(10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                EvaIcons.person,
                                color: const Color(0xffD4D4D4),
                                size: 13.0.sp,
                              ),
                              spaceX(5),
                              coloredText(
                                text:
                                    "${Utils.age(DateTime.now(), DateTime.parse(widget.employeeModel.dateOfBirth!))} Years",
                                fontSize: 12.0.sp,
                                color: const Color(0xffD4D4D4),
                              ),
                            ],
                          ),
                          spaceY(15),
                          widget.employeeModel.status != null &&
                                  widget.employeeModel.status!.status ==
                                      "booked"
                              ? _globalController.guest
                                  ? Container()
                                  : primaryButton(
                                      onTap: widget.employeeModel.document ==
                                                  null ||
                                              widget.employeeModel.document!
                                                      .approve ==
                                                  null ||
                                              widget.employeeModel.document!
                                                      .approve ==
                                                  0
                                          ? null
                                          : () async {
                                              logError(widget.employeeModel
                                                  .toJson());
                                              Get.to(() => InvoicePage(
                                                    invoiceId: invoiceId,
                                                    companyId: widget
                                                        .employeeModel
                                                        .company!
                                                        .id!,
                                                    employeeName: Get.locale ==
                                                            const Locale(
                                                                'en', 'US')
                                                        ? widget.employeeModel
                                                            .nameEn!
                                                        : widget.employeeModel
                                                            .nameAr!,
                                                    contractDuration: widget
                                                        .employeeModel
                                                        .contractDuration!,
                                                    contractAmount: widget
                                                        .employeeModel
                                                        .contractAmount!,
                                                    isOffer: widget
                                                        .employeeModel.isOffer!,
                                                    contractAmountAfterDiscount:
                                                        widget.employeeModel
                                                                    .isOffer ==
                                                                1
                                                            ? widget
                                                                .employeeModel
                                                                .amountAfterDiscount!
                                                            : -1,
                                                    userName: _globalController
                                                        .me.fullName!,
                                                  ));

                                              // Get.to(() => PayPage(),
                                              //     );

                                              // else {
                                              //   Get.to(() => const FillingDataPage(),
                                              //       );
                                              // }
                                            },
                                      text: coloredText(
                                          text: "invoice".tr,
                                          color: Colors.white,
                                          fontSize: 12.0.sp),
                                      color: widget.employeeModel.document ==
                                                  null ||
                                              widget.employeeModel.document!
                                                      .approve ==
                                                  null ||
                                              widget.employeeModel.document!
                                                      .approve ==
                                                  0
                                          ? Colors.grey
                                          : Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                      width: 40.0.w,
                                      height: 30.0.sp,
                                      radius: 20,
                                      alignment:
                                          AlignmentDirectional.centerStart,
                                    )
                              : widget.employeeModel.status != null &&
                                      widget.employeeModel.status!.status ==
                                          "pending"
                                  ? primaryButton(
                                      onTap: widget.employeeModel.document ==
                                                  null ||
                                              widget.employeeModel.document!
                                                      .approve ==
                                                  null ||
                                              widget.employeeModel.document!
                                                      .approve ==
                                                  0
                                          ? null
                                          : () async {
                                              Map<String, String>? x =
                                                  await _employeesController
                                                      .bookEmployee(
                                                          id: widget
                                                              .employeeModel
                                                              .document!
                                                              .id!);
                                              if (x != null) {
                                                invoiceId = x.keys.first;
                                                Uri url =
                                                    Uri.parse(x.values.first);
                                                logSuccess(x);
                                                await launchUrl(url,
                                                    mode: LaunchMode
                                                        .externalApplication);

                                                await Future.delayed(Duration(
                                                    milliseconds: 100));
                                                while (WidgetsBinding.instance
                                                        .lifecycleState !=
                                                    AppLifecycleState.resumed) {
                                                  await Future.delayed(Duration(
                                                      milliseconds: 100));
                                                }
                                                EmployeeModel? b =
                                                    await _employeesController
                                                        .showMyEmployee(
                                                            id: widget
                                                                .employeeModel
                                                                .id!,
                                                            indicator: false);
                                                if (b != null) {
                                                  Utils.doneDialog(
                                                      context: context);
                                                  widget.employeeModel = b;
                                                  setState(() {});
                                                }
                                                await _globalController.getMe();
                                              }

                                              // Get.to(() => PayPage(),
                                              //     );

                                              // else {
                                              //   Get.to(() => const FillingDataPage(),
                                              //       transition: Transition.downToUp);
                                              // }
                                            },
                                      text: coloredText(
                                          text: "pay".tr,
                                          color: Colors.white,
                                          fontSize: 12.0.sp),
                                      color: widget.employeeModel.document ==
                                                  null ||
                                              widget.employeeModel.document!
                                                      .approve ==
                                                  null ||
                                              widget.employeeModel.document!
                                                      .approve ==
                                                  0
                                          ? Colors.grey
                                          : Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                      width: 40.0.w,
                                      height: 30.0.sp,
                                      radius: 20,
                                      alignment:
                                          AlignmentDirectional.centerStart,
                                    )
                                  : primaryButton(
                                      onTap: () async {
                                        if (_globalController.guest) {
                                          Utils.loginFirstDialoge(
                                              context: context);
                                        } else {
                                          String? x = await _employeesController
                                              .pendingEmployee(
                                                  id: widget.employeeModel.id!);
                                          if (x != null) {
                                            Uri url = Uri.parse(x);
                                            logSuccess(x);
                                            await launchUrl(url,
                                                mode: LaunchMode
                                                    .externalApplication);

                                            await Future.delayed(
                                                Duration(milliseconds: 100));
                                            while (WidgetsBinding
                                                    .instance.lifecycleState !=
                                                AppLifecycleState.resumed) {
                                              await Future.delayed(
                                                  Duration(milliseconds: 100));
                                            }
                                            EmployeeModel? b =
                                                await _employeesController
                                                    .showMyEmployee(
                                                        id: widget
                                                            .employeeModel.id!,
                                                        indicator: false);
                                            if (b != null) {
                                              Utils.doneDialog(
                                                  context: context);
                                              widget.employeeModel = b;
                                              if (widget.employeeModel.status !=
                                                      null &&
                                                  widget.employeeModel.status!
                                                          .status ==
                                                      "pending") {
                                                contractFlag = true;
                                              }
                                              setState(() {});
                                            }
                                            _globalController.getMe();
                                            _globalController.getUserHomePage();
                                            Utils().rateDialoge(
                                                context: context,
                                                companyId: widget
                                                    .employeeModel.companyId!);
                                          }
                                        }
                                      },
                                      text: coloredText(
                                          text: "book".tr,
                                          color: Colors.white,
                                          fontSize: 12.0.sp),
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                      width: 40.0.w,
                                      height: 30.0.sp,
                                      radius: 20,
                                      alignment:
                                          AlignmentDirectional.centerStart,
                                    ),
                          // Container(
                          //   width: 40.0.w,
                          //   height: 40,
                          //   margin: EdgeInsets.symmetric(horizontal: 1.0.w),
                          //   decoration: BoxDecoration(
                          //       color: Theme.of(context).colorScheme.secondary,
                          //       borderRadius: BorderRadius.circular(20),
                          //       border: Border.all(
                          //         color: Colors.transparent,
                          //       )),
                          //   child: Center(
                          //     child: coloredText(
                          //         text: "Book",
                          //         color: Colors.white,
                          //         fontSize: 12.0.sp),
                          //   ),
                          // ),
                        ],
                      ),
                    )
                  ],
                ),
                !contractFlag ? Container() : spaceY(10.sp),
                !contractFlag
                    ? Container()
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          primaryButton(
                            onTap: () async {
                              await _prepareSaveDir();

                              await FlutterDownloader.enqueue(
                                url: widget.employeeModel.passportImege,
                                fileName:
                                    "${widget.employeeModel.nameEn!} passport",
                                savedDir: _localPath,
                                saveInPublicStorage: true,
                                showNotification:
                                    true, // show download progress in status bar (for Android)
                                openFileFromNotification:
                                    true, // click on notification to open downloaded file (for Android)
                              );
                            },
                            text: coloredText(
                                text: "passport".tr,
                                color: Colors.white,
                                fontSize: 12.0.sp),
                            color: Theme.of(context).colorScheme.secondary,
                            width: 40.0.w,
                            height: 30.0.sp,
                            radius: 20,
                            alignment: AlignmentDirectional.centerStart,
                          ),
                          primaryButton(
                            onTap: () async {
                              String? token = await Utils.readToken();
                              logSuccess(
                                  widget.employeeModel.residenceContract!);
                              logSuccess(token!);
                              Utils.circularIndicator();
                              var res = await Dio().get(
                                widget.employeeModel.residenceContract!,
                                options: Options(
                                  headers: {
                                    "Accept": "application/json",
                                    "Authorization": "Bearer $token"
                                  },
                                ),
                              );
                              Get.back();
                              await Printing.layoutPdf(
                                  format: PdfPageFormat.a3,
                                  name:
                                      "${widget.employeeModel.nameEn!} contract",
                                  onLayout: (PdfPageFormat format) async =>
                                      await Printing.convertHtml(
                                        format: format,
                                        html: res.data,
                                      ));
                            },
                            text: coloredText(
                                text: "contract".tr,
                                color: Colors.white,
                                fontSize: 12.0.sp),
                            color: Theme.of(context).colorScheme.secondary,
                            width: 40.0.w,
                            height: 30.0.sp,
                            radius: 20,
                            alignment: AlignmentDirectional.centerStart,
                          ),
                        ],
                      ),
              ],
            ),
          ),
        ),
        // spaceY(1.0.h),
        Expanded(
          child: ListView(
            primary: false,
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
            children: [
              coloredText(
                text:
                    "${Get.locale == const Locale('en', 'US') ? widget.employeeModel.nameEn! : widget.employeeModel.nameAr!}'s CV"
                        .tr,
                fontWeight: FontWeight.bold,
              ),
              const Divider(
                color: Color(0xffDBDBDB),
              ),
              spaceY(10.sp),
              Row(
                children: [
                  const Icon(EvaIcons.briefcaseOutline, color: Colors.grey),
                  spaceX(5.sp),
                  coloredText(
                      text: widget.employeeModel.previousWorkAbroad == 0
                          ? "did_not_work_abroad".tr
                          : "${"previous_work_abroad".tr} ${widget.employeeModel.durationOfEmployment} ${"years".tr}",
                      color: Colors.grey,
                      fontSize: 12.sp)
                ],
              ),
              spaceY(10.sp),
              Row(
                children: [
                  Icon(FontAwesomeIcons.graduationCap,
                      size: 15.sp, color: Colors.grey),
                  spaceX(5.sp),
                  coloredText(
                      text:
                          "${"educational_certificates".tr}: ${Get.locale == const Locale('en', 'US') ? _globalController.certificates.where((element) => element.id == widget.employeeModel.educationCertification!).first.nameEn! : _globalController.certificates.where((element) => element.id == widget.employeeModel.educationCertification!).first.nameAr!}",
                      color: Colors.grey,
                      fontSize: 12.sp)
                ],
              )
            ],
          ),
        )
      ],
    ));
  }

  late String _localPath;

  Future<void> _prepareSaveDir() async {
    _localPath = (await _getSavedDir())!;
    final savedDir = Directory(_localPath);
    if (!savedDir.existsSync()) {
      await savedDir.create();
    }
  }

  Future<String?> _getSavedDir() async {
    String? externalStorageDirPath;

    if (Platform.isAndroid) {
      try {
        externalStorageDirPath = await AndroidPathProvider.downloadsPath;
      } catch (err, st) {
        print('failed to get downloads path: $err, $st');

        final directory = await getExternalStorageDirectory();
        externalStorageDirPath = directory?.path;
      }
    } else if (Platform.isIOS) {
      // var dir = (await _dirsOnIOS)[0]; // temporary
      // var dir = (await _dirsOnIOS)[1]; // applicationSupport
      // var dir = (await _dirsOnIOS)[2]; // library
      var dir = (await _dirsOnIOS)[3]; // applicationDocuments
      // var dir = (await _dirsOnIOS)[4]; // downloads

      dir ??= await getApplicationDocumentsDirectory();
      externalStorageDirPath = dir.absolute.path;
    }

    return externalStorageDirPath;
  }

  Future<List<Directory?>> get _dirsOnIOS async {
    final temporary = await getTemporaryDirectory();
    final applicationSupport = await getApplicationSupportDirectory();
    final library = await getLibraryDirectory();
    final applicationDocuments = await getApplicationDocumentsDirectory();
    final downloads = await getDownloadsDirectory();

    final dirs = [
      temporary,
      applicationSupport,
      library,
      applicationDocuments,
      downloads
    ];

    return dirs;
  }
}
