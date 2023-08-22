// ignore_for_file: unused_catch_clause

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:khedma/Utils/end_points.dart';
import 'package:khedma/Utils/utils.dart';
import 'package:khedma/models/city.dart';
import 'package:khedma/models/country.dart';
import 'package:khedma/models/me.dart';
import 'package:khedma/models/region.dart';

class GlobalController extends GetxController {
  final Dio dio = Utils().dio;
  List<Country> countries = [];
  List<City> cities = [];
  List<Region> regions = [];

  bool getCountriesFlag = false;
  Future getCountries() async {
    try {
      getCountriesFlag = true;
      var res = await dio.get(EndPoints.getAllCountries);
      List<Country> tmp = [];
      for (var i in res.data['data']) {
        Country t = Country.fromJson(i);
        tmp.add(t);
      }
      countries = tmp;
      logSuccess("countries get done");
      getCountriesFlag = false;
      update();
    } on DioException catch (e) {
      getCountriesFlag = false;
      update();
      logError(e.response!.data);
      logError("countries failed");
    }
  }

  bool getCitiesFlag = false;
  Future getCities() async {
    try {
      getCitiesFlag = true;
      var res = await dio.get(EndPoints.getAllCities);
      List<City> tmp = [];
      for (var i in res.data['data']) {
        City t = City.fromJson(i);
        tmp.add(t);
      }
      cities = tmp;
      logSuccess("Cities get done");
      getCitiesFlag = false;
      update();
    } on DioException catch (e) {
      getCitiesFlag = false;
      update();
      logError("Cities failed");
    }
  }

  Me me = Me();
  bool getMeFlag = false;
  Future getMe() async {
    try {
      getMeFlag = true;
      String? token = await Utils.readToken();

      var res = await dio.get(
        EndPoints.me,
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );
      me = Me.fromJson(res.data);
      logSuccess(me.toJson());
      logSuccess("Me get done");
      getMeFlag = false;
      update();
    } on DioException catch (e) {
      getMeFlag = false;
      update();
      logError("Me failed");
    }
  }

  bool getRegionsFlag = false;
  Future getRegions() async {
    try {
      getRegionsFlag = true;
      var res = await dio.get(EndPoints.getAllRegions);
      List<Region> tmp = [];
      for (var i in res.data['data']) {
        Region t = Region.fromJson(i);
        tmp.add(t);
      }
      regions = tmp;
      logSuccess("Regions get done");
      getRegionsFlag = false;
      update();
    } on DioException catch (e) {
      getRegionsFlag = false;
      update();
      logError("Regions failed");
    }
  }
}
