import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as d;
import 'package:get/get.dart';
import 'package:khedma/Admin/pages/languages/models/language_model.dart';
import 'package:khedma/Utils/end_points.dart';
import 'package:khedma/Utils/utils.dart';

class LanguagesController extends GetxController {
  final Dio dio = Utils().dio;
  List<LanguageModel> languages = [];

  Future<bool> createlanguage({required LanguageModel language}) async {
    try {
      Utils.circularIndicator();
      final body = d.FormData.fromMap(language.toJson());

      await dio.post(
        EndPoints.storeLanguage,
        data: body,
        options: Options(
          headers: {"Accept": "application/json"},
        ),
      );

      await getlanguages();
      Get.back();
      return true;
    } on DioException catch (e) {
      logError(e.message!);
      Get.back();
    }
    return false;
  }

  Future<bool> deletelanguage({
    required LanguageModel language,
  }) async {
    try {
      Utils.circularIndicator();
      final body = d.FormData.fromMap(language.toJson());
      body.fields.add(const MapEntry("_method", "DELETE"));
      await dio.post(
        EndPoints.deleteLanguage(language.id!),
        data: body,
        options: Options(
          headers: {"Accept": "application/json"},
        ),
      );

      await getlanguages();
      Get.back();
      return true;
    } on DioException catch (e) {
      logError(e.message!);
      Get.back();
    }
    return false;
  }

  Future<bool> updatelanguage({required LanguageModel language}) async {
    try {
      Utils.circularIndicator();
      final body = d.FormData.fromMap(language.toJson());
      body.fields.add(const MapEntry("_method", "PUT"));
      await dio.post(
        EndPoints.updateLanguage(language.id!),
        data: body,
        options: Options(
          headers: {"Accept": "application/json"},
        ),
      );

      await getlanguages();
      Get.back();
      return true;
    } on DioException catch (e) {
      logError(e.response!.data);
      Get.back();
    }
    return false;
  }

  bool getlanguagesFlag = false;
  Future getlanguages() async {
    try {
      getlanguagesFlag = true;
      var res = await dio.get(EndPoints.getAllLanguages);
      List<LanguageModel> tmp = [];
      for (var i in res.data['data']) {
        LanguageModel t = LanguageModel.fromJson(i);
        tmp.add(t);
      }
      languages = tmp;
      logSuccess("languages get done");
      getlanguagesFlag = false;
      update();
    } on DioException {
      getlanguagesFlag = false;
      update();
      logError("languages failed");
    }
  }
}
