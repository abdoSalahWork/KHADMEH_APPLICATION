// ignore_for_file: unused_catch_clause

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khedma/Admin/pages/jobs/models/job_model.dart';
import 'package:khedma/Admin/pages/languages/models/language_model.dart';
import 'package:khedma/Utils/end_points.dart';
import 'package:khedma/Utils/utils.dart';
import 'package:khedma/models/certificate_.dart';
import 'package:khedma/models/city.dart';
import 'package:khedma/models/complexion.dart';
import 'package:khedma/models/country.dart';
import 'package:khedma/models/marital_status.dart';
import 'package:khedma/models/me.dart';
import 'package:khedma/models/region.dart';
import 'package:khedma/models/relegion.dart';

class GlobalController extends GetxController {
  final Dio dio = Utils().dio;
  List<Country> countries = [];
  List<City> cities = [];
  List<Region> regions = [];
  List<LanguageModel> languages = [];
  List<ComplexionModel> complexionList = [];
  List<RelegionModel> relegions = [];
  List<MaritalStatusModel> maritalStatusList = [];
  List<CertificateModel> certificates = [];
  List<JobModel> jobs = [];

  bool getjobsFlag = false;
  Future getjobs() async {
    try {
      getjobsFlag = true;
      var res = await dio.get(EndPoints.getAllJobs);
      List<JobModel> tmp = [];
      for (var i in res.data['data']) {
        JobModel t = JobModel.fromJson(i);
        tmp.add(t);
      }
      jobs = tmp;
      logSuccess("Jobs get done");
      getjobsFlag = false;
      update();
    } on DioException {
      getjobsFlag = false;
      update();
      logError("Jobs failed");
    }
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

  bool getCertificatesFlag = false;
  Future getCertificates() async {
    try {
      getCertificatesFlag = true;
      var res = await dio.get(EndPoints.getAllCertificate);
      List<CertificateModel> tmp = [];
      for (var i in res.data['data']) {
        CertificateModel t = CertificateModel.fromJson(i);
        tmp.add(t);
      }
      certificates = tmp;
      logSuccess("Certificates get done");
      getCertificatesFlag = false;
      update();
    } on DioException {
      getCertificatesFlag = false;
      update();
      logError("Certificates failed");
    }
  }

  bool getMaritalStatusFlag = false;
  Future getMaritalStatuss() async {
    try {
      getMaritalStatusFlag = true;
      var res = await dio.get(EndPoints.getAllMaritalStatus);
      List<MaritalStatusModel> tmp = [];
      for (var i in res.data['data']) {
        MaritalStatusModel t = MaritalStatusModel.fromJson(i);
        tmp.add(t);
      }
      maritalStatusList = tmp;
      logSuccess("MaritalStatuss get done");
      getMaritalStatusFlag = false;
      update();
    } on DioException {
      getMaritalStatusFlag = false;
      update();
      logError("MaritalStatuss failed");
    }
  }

  bool getRelegionsFlag = false;
  Future getRelegions() async {
    try {
      getRelegionsFlag = true;
      var res = await dio.get(EndPoints.getAllRelegions);
      List<RelegionModel> tmp = [];
      for (var i in res.data['data']) {
        RelegionModel t = RelegionModel.fromJson(i);
        tmp.add(t);
      }
      relegions = tmp;
      logSuccess("Relegions get done");
      getRelegionsFlag = false;
      update();
    } on DioException {
      getRelegionsFlag = false;
      update();
      logError("Relegions failed");
    }
  }

  bool getComplexionFlag = false;
  Future getComplexion() async {
    try {
      getComplexionFlag = true;
      var res = await dio.get(EndPoints.getAllComplexions);
      List<ComplexionModel> tmp = [];
      for (var i in res.data['data']) {
        ComplexionModel t = ComplexionModel.fromJson(i);
        tmp.add(t);
      }
      complexionList = tmp;
      logSuccess("Complexion get done");
      getComplexionFlag = false;
      update();
    } on DioException {
      getComplexionFlag = false;
      update();
      logError("languages failed");
    }
  }

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
  Future<bool> getMe() async {
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
      logSuccess("Me get done");
      getMeFlag = false;
      update();
      return true;
    } on DioException catch (e) {
      getMeFlag = false;
      update();
      logError("Me failed");
      return false;
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

  Locale fallbackLocale = const Locale('en', 'US');
  Future setLocale() async {
    String? lang = await Utils.readLanguage();
    if (lang != null) {
      if (lang == "ar") {
        fallbackLocale = const Locale('ar', 'SYR');
      } else {
        fallbackLocale = const Locale('en', 'US');
      }
    } else {
      fallbackLocale = const Locale('en', 'US');
    }
    Get.updateLocale(fallbackLocale);
    // update();
  }

  Future<String> getAppLanguage() async {
    String? lang = await Utils.readLanguage();
    if (lang != null) {
      return lang;
    } else {
      return "en";
    }
  }
}
