import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as d;
import 'package:get/get.dart';
import 'package:khedma/Pages/global_controller.dart';
import 'package:khedma/Utils/end_points.dart';
import 'package:khedma/Utils/utils.dart';
import 'package:khedma/models/city.dart';
import 'package:khedma/models/country.dart';
import 'package:khedma/models/region.dart';

class AddressessController extends GetxController {
  final Dio dio = Utils().dio;

  GlobalController _globalController = Get.find();
  Future createCity({required City city}) async {
    try {
      Utils.circularIndicator();
      final body = d.FormData.fromMap(city.toJson());

      await dio.post(EndPoints.storeCity, data: body);

      await _globalController.getCities();
      Get.back();
    } on DioException catch (e) {
      logError(e.message!);
      Get.back();
    }
  }

  Future deleteCity({required City city, required int id}) async {
    try {
      Utils.circularIndicator();
      final body = d.FormData.fromMap(city.toJson());
      body.fields.add(const MapEntry("_method", "DELETE"));
      await dio.post(EndPoints.deleteCity(id), data: body);

      await _globalController.getCities();
      Get.back();
    } on DioException catch (e) {
      logError(e.message!);
      Get.back();
    }
  }

  Future updateCity({required City city, required int id}) async {
    try {
      Utils.circularIndicator();
      final body = d.FormData.fromMap(city.toJson());
      body.fields.add(const MapEntry("_method", "PUT"));
      await dio.post(EndPoints.updateCity(id), data: body);

      await _globalController.getCities();
      Get.back();
    } on DioException catch (e) {
      logError(e.message!);
      Get.back();
    }
  }

  Future createRegion({required Region region}) async {
    try {
      Utils.circularIndicator();
      final body = d.FormData.fromMap(region.toJson());

      await dio.post(EndPoints.storeRegion, data: body);

      await _globalController.getRegions();
      Get.back();
    } on DioException catch (e) {
      logError(e.message!);
      Get.back();
    }
  }

  Future deleteRegion({required Region region, required int id}) async {
    try {
      Utils.circularIndicator();
      final body = d.FormData.fromMap(region.toJson());
      body.fields.add(const MapEntry("_method", "DELETE"));
      await dio.post(EndPoints.deleteRegion(id), data: body);

      await _globalController.getRegions();
      Get.back();
    } on DioException catch (e) {
      logError(e.message!);
      Get.back();
    }
  }

  Future updateRegion({required Region region, required int id}) async {
    try {
      Utils.circularIndicator();
      final body = d.FormData.fromMap(region.toJson());
      body.fields.add(const MapEntry("_method", "PUT"));
      await dio.post(EndPoints.updateRegion(id), data: body);

      await _globalController.getRegions();
      Get.back();
    } on DioException catch (e) {
      logError(e.message!);
      Get.back();
    }
  }

  Future createCountry({required Country country}) async {
    try {
      Utils.circularIndicator();
      final body = d.FormData.fromMap(country.toJson());

      await dio.post(EndPoints.storeCountry, data: body);

      await _globalController.getCountries();
      Get.back();
    } on DioException catch (e) {
      logError(e.message!);
      Get.back();
    }
  }

  Future deleteCountry({required Country country, required int id}) async {
    try {
      Utils.circularIndicator();
      final body = d.FormData.fromMap(country.toJson());
      body.fields.add(const MapEntry("_method", "DELETE"));
      await dio.post(EndPoints.deleteCountry(id), data: body);

      await _globalController.getCountries();
      Get.back();
    } on DioException catch (e) {
      logError(e.message!);
      Get.back();
    }
  }

  Future updateCountry({required Country country, required int id}) async {
    try {
      Utils.circularIndicator();
      final body = d.FormData.fromMap(country.toJson());
      body.fields.add(const MapEntry("_method", "PUT"));
      await dio.post(EndPoints.updateCountry(id), data: body);

      await _globalController.getCountries();
      Get.back();
    } on DioException catch (e) {
      logError(e.message!);
      Get.back();
    }
  }
}
