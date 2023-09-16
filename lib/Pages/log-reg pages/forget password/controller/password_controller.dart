import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as d;
import 'package:get/get.dart';
import 'package:khedma/Utils/end_points.dart';
import 'package:khedma/Utils/utils.dart';

class PasswordController extends GetxController {
  final Dio dio = Utils().dio;

  // Dio dio = Dio();
  // sslProblem() async {
  //   String token = await AuthService().loadToken();
  //   dio.options.headers["authorization"] = "bearer  $token";
  //   dio.options.headers['content-Type'] = 'multipart/form-data';

  //   (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
  //       (HttpClient client) {
  //     client.badCertificateCallback =
  //         (X509Certificate cert, String host, int port) => true;
  //     return client;
  //   };
  // }

  Future<bool> forgetPassWord(
      {required String sender, required int type, String? code}) async {
    try {
      Utils.circularIndicator();
      final data = d.FormData();
      data.fields.add(MapEntry("sender", sender));
      data.fields.add(MapEntry("type", type.toString()));
      if (type == 1) {
        data.fields.add(MapEntry("phone_code", code!));
      }
      for (var i in data.fields) {
        logSuccess(i.key);
      }
      var res = await dio.post(EndPoints.forgetPassword, data: data);
      logSuccess(res.data);
      Get.back();
      return true;
    } on DioException catch (e) {
      logError(e.response!.data);
      Utils.showSnackBar(message: e.response!.data['message']);
      Get.back();
      return false;
    }
  }

  Future<bool> resetPassWord({
    required String sender,
    required String verrificationCode,
    required int type,
    String? code,
    required String password,
    required String passwordConfirm,
  }) async {
    try {
      Utils.circularIndicator();

      final data = d.FormData();
      data.fields.add(MapEntry("sender", sender));
      data.fields.add(MapEntry("verification_code", verrificationCode));
      data.fields.add(MapEntry("password", password));
      data.fields.add(MapEntry("password_confirmation", passwordConfirm));
      if (type == 1) {
        data.fields.add(MapEntry("phone_code", code!));
      }
      for (var i in data.fields) {
        logSuccess("${i.key}: ${i.value}");
        logSuccess("${i.key}: ${i.value}");
      }
      var res = await dio.post(EndPoints.resetPassword, data: data);
      logSuccess(res.data);
      Get.back();

      return true;
    } on DioException catch (e) {
      logError(e.response!.data);
      Utils.showSnackBar(message: e.response!.data['message']);
      Get.back();
      return false;
    }
  }

  // Future chagerPassWord(String old, String neww, String confirm) async {
  //   try {
  //     await sslProblem();
  //     Get.dialog(const Center(
  //       child: CircularProgressIndicator(),
  //     ));
  //     final data = d.FormData();
  //     data.fields.add(MapEntry("old_password", old));
  //     data.fields.add(MapEntry("new_password", neww));
  //     data.fields.add(MapEntry("new_password_confirmation", confirm));
  //     await AuthService().saveCredentials(await AuthService().loadEmail(), neww,
  //         await AuthService().loadRememberMe() ? "1" : "0");
  //     var res = await dio.post(EndPoints.changePassword, data: data);
  //     logSuccess(res.data);
  //     Get.back();
  //     MyDialogs.showSavedSuccessfullyDialoge(
  //       title: "pass_word_changed".tr,
  //       btnTXT: "close".tr,
  //       onTap: () {
  //         Get.back();
  //         Get.back();
  //       },
  //     );
  //   } on DioException catch (e) {
  //     logError(e.response!.data);
  //     Get.back();
  //     MyDialogs.showWarningDialoge2(
  //         onProceed: () {
  //           Get.back();
  //         },
  //         message: "old_pass_invalid".tr,
  //         yesBTN: "close".tr);
  //   }
  // }
}
