// ignore_for_file: depend_on_referenced_packages

import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as d;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http_parser/http_parser.dart';
import 'package:khedma/Pages/HomePage/models/advertisment_model.dart';
import 'package:khedma/Utils/end_points.dart';
import 'package:khedma/Utils/utils.dart';
import 'package:sizer/sizer.dart';

class AdvertismentController extends GetxController {
  final Dio dio = Utils().dio;
  List<AdvertismentModel> ads = [];

  Future<bool> createAdvertisment(
      {required AdvertismentModel advertisment}) async {
    try {
      logSuccess(advertisment.toJson());
      Utils.circularIndicator();
      final body = d.FormData.fromMap(advertisment.toJson());
      PlatformFile? image = advertisment.image;
      String? token = await Utils.readToken();

      logSuccess(token!);
      if (image != null) {
        body.files.add(MapEntry(
          "image",
          await d.MultipartFile.fromFile(
            image.path!,
            filename: image.name,
            contentType: MediaType('image', '*'),
          ),
        ));
      }
      await dio.post(
        EndPoints.storeCompanyAdvertisment,
        data: body,
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            "Accept": "application/json",
          },
        ),
      );

      // await getAdvertisments();
      Get.back();
      return true;
    } on DioException catch (e) {
      BuildContext context = Get.context!;
      List<String> errorText = [];
      Map errors = e.response!.data["errors"];
      errors.forEach((key, value) {
        List l = List.from(value);
        errorText.add(l.join("\n"));
      });
      Get.back();
      Utils.customDialog(
          title: "Errors",
          titleStyle: coloredText(
            text: errorText.join("\n"),
            textAlign: TextAlign.left,
            fontSize: 17.sp,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ).style,
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
                text: errorText.join("\n"),
                textAlign: TextAlign.left,
                fontSize: 11.sp,
                fontWeight: FontWeight.w600,
                color: Colors.grey,
              ),
            ),
          ),
          context: context);

      return false;
    }
  }
}