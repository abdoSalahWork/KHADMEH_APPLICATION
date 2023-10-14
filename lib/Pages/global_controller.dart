// ignore_for_file: unused_catch_clause

import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as d;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:khedma/Admin/pages/categories/models/categories_model.dart';
import 'package:khedma/Admin/pages/jobs/models/job_model.dart';
import 'package:khedma/Admin/pages/languages/models/language_model.dart';
import 'package:khedma/Pages/HomePage/company%20home/company_home_page.dart';
import 'package:khedma/Pages/HomePage/controllers/companies_controller.dart';
import 'package:khedma/Pages/HomePage/controllers/employees_controller.dart';
import 'package:khedma/Pages/HomePage/models/company_home_page_model.dart';
import 'package:khedma/Pages/HomePage/models/user_home_page_model.dart';
import 'package:khedma/Pages/personal%20page/submit_files_page.dart';
import 'package:khedma/Utils/end_points.dart';
import 'package:khedma/Utils/utils.dart';
import 'package:khedma/models/bank_model.dart';
import 'package:khedma/models/certificate_.dart';
import 'package:khedma/models/checkout_model.dart';
import 'package:khedma/models/city.dart';
import 'package:khedma/models/company_request_model.dart';
import 'package:khedma/models/company_service_model.dart';
import 'package:khedma/models/complexion.dart';
import 'package:khedma/models/country.dart';
import 'package:khedma/models/marital_status.dart';
import 'package:khedma/models/me.dart';
import 'package:khedma/models/me.dart' as m;
import 'package:khedma/models/region.dart';
import 'package:khedma/models/relegion.dart';
import 'package:khedma/models/reservation_model.dart';

class GlobalController extends GetxController {
  bool guest = false;
  void updateGuest({required bool g}) {
    guest = g;
  }

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
  List<CategoryModel> categories = [];
  UserHomePageModel userHomePage = UserHomePageModel();
  CompanyHomePageModel companyHomePage = CompanyHomePageModel();
  List<CleaningBooking> cleaningBookings = [];
  bool getUserHomePageFlag = false;
  List<OverView> overView = [];
  List<BankModel> banks = [];
  Future getBanks() async {
    try {
      String? token = await Utils.readToken();
      var res = await dio.get(
        EndPoints.getBanks,
        options: Options(
          headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $token"
          },
        ),
      );
      List<BankModel> tmp = [];
      for (var i in res.data['data']) {
        BankModel t = BankModel.fromJson(i);
        tmp.add(t);
      }
      banks = tmp;
      logSuccess("Banks get done");

      update();
    } on DioException catch (e) {
      update();
      logError(e.response!.data);
      logError("Banks failed");
    }
  }

  List<CheckoutModel> checkouts = [];
  bool getUserCheckoutsFlag = false;

  Future getUserCheckouts() async {
    try {
      getUserCheckoutsFlag = true;

      String? token = await Utils.readToken();
      var res = await dio.get(
        EndPoints.getCheckoutUser,
        options: Options(
          headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $token"
          },
        ),
      );
      List<CheckoutModel> tmp = [];
      for (var i in res.data['data']) {
        CheckoutModel t = CheckoutModel.fromJson(i);
        tmp.add(t);
      }
      checkouts = tmp;
      logSuccess("Checkouts get done");
      getUserCheckoutsFlag = false;

      update();
    } on DioException catch (e) {
      getUserCheckoutsFlag = false;

      update();
      logError(e.response!.data);
      logError("Checkouts failed");
    }
  }

  bool getCategoriesFlag = false;
  Future getCategories() async {
    try {
      getCategoriesFlag = true;
      String? token = await Utils.readToken();
      var res = await dio.get(
        EndPoints.getAllCategories,
        options: Options(
          headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $token"
          },
        ),
      );
      List<CategoryModel> tmp = [];
      for (var i in res.data['data']) {
        CategoryModel t = CategoryModel.fromJson(i);
        tmp.add(t);
      }
      categories = tmp;
      logSuccess("Categories get done");
      getCategoriesFlag = false;
      update();
    } on DioException catch (e) {
      getCategoriesFlag = false;
      update();
      logError(e.response!.data);
      logError("Categories failed");
    }
  }

  List<CompanyServiceModel> companyServices = [];
  bool getCompanyServicesFlag = false;
  Future getCompanyServices() async {
    try {
      getCompanyServicesFlag = true;
      String? token = await Utils.readToken();

      var res = await dio.get(
        EndPoints.getAllCompanyServices,
        options: Options(
          headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $token"
          },
        ),
      );
      List<CompanyServiceModel> tmp = [];
      for (var i in res.data['data']) {
        CompanyServiceModel t = CompanyServiceModel.fromJson(i);
        tmp.add(t);
      }
      companyServices = tmp;
      logSuccess("Services get done");
      getCompanyServicesFlag = false;
      update();
    } on DioException catch (e) {
      getCompanyServicesFlag = false;
      logError(e.response!.data);
      update();
      logError("Services failed");
    }
  }

  Future<bool> createCompanyService({
    required int id,
    required int price,
  }) async {
    try {
      Utils.circularIndicator();
      final body = d.FormData.fromMap({"service_id": id, "price": price});
      String? token = await Utils.readToken();
      await dio.post(
        EndPoints.storeCompanyService,
        data: body,
        options: Options(
          headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $token",
          },
        ),
      );

      await getCompanyServices();
      Get.back();
      return true;
    } on DioException catch (e) {
      logError(e.response!.data);
      Get.back();
    }
    return false;
  }

  Future<bool> deleteCompanyService({
    required int id,
  }) async {
    try {
      Utils.circularIndicator();
      final body = d.FormData();
      body.fields.add(const MapEntry("_method", "DELETE"));
      String? token = await Utils.readToken();
      await dio.post(
        EndPoints.deleteCompanyService(id),
        data: body,
        options: Options(
          headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $token",
          },
        ),
      );

      await getCompanyServices();
      Get.back();
      return true;
    } on DioException catch (e) {
      logError(e.message!);
      Get.back();
    }
    return false;
  }

  Future getUserHomePage() async {
    try {
      getUserHomePageFlag = true;
      String? token = await Utils.readToken();

      var res = await dio.get(
        EndPoints.getUserHomePage,
        options: Options(
          headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $token"
          },
        ),
      );
      userHomePage = UserHomePageModel.fromJson(res.data);
      logSuccess("UserHomePage get done");
      getUserHomePageFlag = false;
      userHomePage.employees!.forEach((element) {
        logSuccess("image" + element.image);
      });
      update();
    } on DioException catch (e) {
      getUserHomePageFlag = false;
      logError(e.response!.data);
      update();
      logError("UserHomePage failed");
    }
  }

  bool getCompanyHomePageFlag = true;
  Future getRecruitmentCompanyHomePage() async {
    try {
      getCompanyHomePageFlag = true;
      String? token = await Utils.readToken();

      var res = await dio.get(
        EndPoints.getRecruitmentCompanyHomePage,
        options: Options(
          headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $token"
          },
        ),
      );
      companyHomePage = CompanyHomePageModel.fromJson(res.data);
      logSuccess("CompanyHomePage get done");
      // logError(companyHomePage.toJson());
      overView = [
        OverView(companyHomePage.allEmplyeesCount!, "all_employees".tr),
        OverView(companyHomePage.availableEmployeesCount!, "available".tr),
        OverView(companyHomePage.pendingEmployeesCount!, "pending".tr),
        OverView(companyHomePage.bookedEmployeesCount!, "booked".tr),
      ];
      await getReservations();

      getCompanyHomePageFlag = false;
      update();
    } on DioException catch (e) {
      getCompanyHomePageFlag = false;
      logError(e.response!.data);
      update();
      logError("CompanyHomePage failed");
    }
  }

  Future getCleanCompanyHomePage() async {
    try {
      getCompanyHomePageFlag = true;
      String? token = await Utils.readToken();

      var res = await dio.get(
        EndPoints.getCleanCompanyHomePage,
        options: Options(
          headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $token"
          },
        ),
      );
      List<CleaningBooking> tmp = [];
      for (var i in res.data['bookings']) {
        CleaningBooking t = CleaningBooking.fromJson(i);
        tmp.add(t);
      }
      cleaningBookings = tmp;
      getCompanyHomePageFlag = false;
      update();
    } on DioException catch (e) {
      getCompanyHomePageFlag = false;
      logError(e.response!.data);
      update();
      logError("CompanyHomePage failed");
    }
  }

  bool getjobsFlag = false;
  Future getjobs() async {
    try {
      getjobsFlag = true;
      String? token = await Utils.readToken();
      var res = await dio.get(
        EndPoints.getAllJobs,
        options: Options(
          headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $token"
          },
        ),
      );
      List<JobModel> tmp = [];
      for (var i in res.data['data']) {
        JobModel t = JobModel.fromJson(i);

        tmp.add(t);
      }
      jobs = tmp;
      logSuccess(jobs);
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
      String? token = await Utils.readToken();
      var res = await dio.get(
        EndPoints.getAllLanguages,
        options: Options(
          headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $token"
          },
        ),
      );
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
      String? token = await Utils.readToken();
      var res = await dio.get(
        EndPoints.getAllCertificate,
        options: Options(
          headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $token"
          },
        ),
      );
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
      String? token = await Utils.readToken();
      var res = await dio.get(
        EndPoints.getAllMaritalStatus,
        options: Options(
          headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $token"
          },
        ),
      );
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
      String? token = await Utils.readToken();
      var res = await dio.get(
        EndPoints.getAllRelegions,
        options: Options(
          headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $token"
          },
        ),
      );
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
      String? token = await Utils.readToken();
      var res = await dio.get(
        EndPoints.getAllComplexions,
        options: Options(
          headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $token"
          },
        ),
      );
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
      String? token = await Utils.readToken();
      var res = await dio.get(
        EndPoints.getAllCountries,
        options: Options(
          headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $token"
          },
        ),
      );
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
      String? token = await Utils.readToken();
      var res = await dio.get(
        EndPoints.getAllCities,
        options: Options(
          headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $token"
          },
        ),
      );
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
            "Accept": "application/json",
            "Authorization": "Bearer $token"
          },
        ),
      );

      logError(res.data);
      if (res.data == "") {
        return false;
      } else if (res.data != "" && res.data['data'] == null) {
        me = Me.fromJson(res.data);
      } else {
        me = Me.fromJson(res.data['data']);
      }

      if (me.userInformation != null) {
        if (me.userInformation!.nationalityId == null) {
          me.userInformation!.nationalityId = 2;
        }
        if (me.userInformation!.cityId == null) {
          me.userInformation!.cityId = 1;
        }
        if (me.userInformation!.regionId == null) {
          me.userInformation!.regionId = 1;
        }
      }
      if (me.companyInformation != null) {
        if (me.companyInformation!.nationalityId == null) {
          me.companyInformation!.nationalityId = 2;
        }
        if (me.companyInformation!.cityId == null) {
          me.companyInformation!.cityId = 1;
        }
        if (me.companyInformation!.regionId == null) {
          me.companyInformation!.regionId = 1;
        }
      }
      await getFavourites();
      logSuccess("Me get done" + allFavourites.length.toString());

      getMeFlag = false;
      update();
      return true;
    } on DioException catch (e) {
      getMeFlag = false;
      logError(e.response!.data);
      update();
      logError("Me failed");
      return false;
    }
  }

  bool getRegionsFlag = false;
  Future getRegions() async {
    try {
      getRegionsFlag = true;
      String? token = await Utils.readToken();
      var res = await dio.get(
        EndPoints.getAllRegions,
        options: Options(
          headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $token"
          },
        ),
      );
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

  Future updateUserProfile(
      {required UserInformation userInfo, XFile? personaPhoto}) async {
    try {
      Get.dialog(const Center(
        child: CircularProgressIndicator(),
      ));

      final body = d.FormData.fromMap(userInfo.toJson());
      body.fields.add(const MapEntry("_method", "PUT"));
      // XFile? idPhotoNationality = userInfo.idPhotoNationality;

      // if (idPhotoNationality != null) {
      //   body.files.add(MapEntry(
      //     "id_photo_nationality",
      //     await d.MultipartFile.fromFile(
      //       idPhotoNationality.path,
      //       filename: idPhotoNationality.name,
      //       contentType: MediaType('image', '*'),
      //     ),
      //   ));
      // }
      if (personaPhoto != null) {
        body.files.add(MapEntry(
          "personal_photo",
          await d.MultipartFile.fromFile(
            personaPhoto.path,
            filename: personaPhoto.name,
            contentType: MediaType('image', '*'),
          ),
        ));
      }
      logSuccess(body.files);
      String? token = await Utils.readToken();

      await dio.post(
        EndPoints.updateProfileUser,
        data: body,
        options: Options(
          headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $token",
          },
        ),
      );
      await getMe();
      update();
      Get.back();
      return true;
    } on DioException catch (error) {
      Get.back();
      logError(error.response!.data);

      // Utils.showSnackBar(message: error.response!.data["message"]);
      return error.response!.data;
    }
  }

  Future updateCompanyProfile(
      {required m.CompanyInformation companyInformation, XFile? logo}) async {
    try {
      Get.dialog(const Center(
        child: CircularProgressIndicator(),
      ));

      final body = d.FormData.fromMap(companyInformation.toJson());
      body.fields.add(const MapEntry("_method", "PUT"));

      // XFile? personaPhoto = userInfo.personalPhoto;

      if (logo != null) {
        body.files.add(MapEntry(
          "company_logo",
          await d.MultipartFile.fromFile(
            logo.path,
            filename: logo.name,
            contentType: MediaType('image', '*'),
          ),
        ));
      }

      // if (personaPhoto != null) {
      //   body.files.add(MapEntry(
      //     "personal_photo",
      //     await d.MultipartFile.fromFile(
      //       personaPhoto.path,
      //       filename: personaPhoto.name,
      //       contentType: MediaType('image', '*'),
      //     ),
      //   ));
      // }
      String? token = await Utils.readToken();
      await dio.post(
        EndPoints.updateProfileCompany,
        data: body,
        options: Options(
          headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $token"
          },
        ),
      );
      await getMe();
      Get.back();
      return true;
    } on DioException catch (error) {
      Get.back();
      logError(error.response!.data);

      // Utils.showSnackBar(message: error.response!.data["message"]);
      return error.response!.data;
    }
  }

  Future storeReview({
    required int companyId,
    required int reviewValue,
    required String review,
  }) async {
    try {
      Get.dialog(const Center(
        child: CircularProgressIndicator(),
      ));

      final body = d.FormData.fromMap({
        "company_id": companyId,
        "review_value": reviewValue,
        "review": review,
      });
      String? token = await Utils.readToken();
      var res = await dio.post(
        EndPoints.storeReview,
        data: body,
        options: Options(
          headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $token"
          },
        ),
      );
      logSuccess(res.data);
      Get.back();
      return true;
    } on DioException catch (error) {
      Get.back();
      logError(error.response!.data);

      return null;
    }
  }

  Future storeFavourite({
    required int typeId,
    required int type,
  }) async {
    try {
      Utils.circularIndicator();

      final body = d.FormData.fromMap({
        "type_id": typeId,
        "type": type,
      });
      logSuccess("typeId: $typeId");
      logSuccess("typeId: $type");
      String? token = await Utils.readToken();
      await dio.post(
        EndPoints.storeFavourite,
        data: body,
        options: Options(
          headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $token",
          },
        ),
      );

      Get.back();
      EmployeesController _employeesController = Get.find();
      CompaniesController _companiesController = Get.find();
      if (type == 0) {
        await _employeesController.getEmployees();
        // _employeesController.employeeToShow
        //     .where((element) => element.id == typeId)
        //     .first
        //     .favourite = Favourite();update();
      } else {
        await _companiesController.getRecruitmentCompanies(indicator: false);
        await _companiesController.getCleaningCompanies(indicator: false);
      }
      await getMe();
      update();
      return true;
    } on DioException catch (error) {
      Get.back();
      logError(error.response!.data);

      return error.response!.data;
    }
  }

  Future deleteFavourite({required int id, required int detect}) async {
    try {
      Utils.circularIndicator();
      String? token = await Utils.readToken();
      await dio.post(
        EndPoints.deleteFavourite(id),
        data: d.FormData.fromMap({"_method": "DELETE"}),
        options: Options(
          headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $token",
          },
        ),
      );

      Get.back();
      // employeeToShow.where((element) => element.id == typeId).first.favourite =
      //     Favourite();
      EmployeesController _employeesController = Get.find();
      CompaniesController _companiesController = Get.find();
      if (detect == 0) await _employeesController.getEmployees();
      if (detect == 1) await _companiesController.getRecruitmentCompanies();
      if (detect == 1) await _companiesController.getCleaningCompanies();

      allFavourites.removeWhere(
        (element) => element.id == id,
      );
      update();
      return true;
    } on DioException catch (error) {
      Get.back();
      logError(error.response!.data);

      return error.response!.data;
    }
  }

  List<Favourite> allFavourites = [];
  getFavourites() async {
    allFavourites = [];
    if (me.favouriteEmployee != null && me.favouriteEmployee!.isNotEmpty) {
      allFavourites.addAll(me.favouriteEmployee!);
    }
    if (me.favouriteCompany != null && me.favouriteCompany!.isNotEmpty) {
      allFavourites.addAll(me.favouriteCompany!);
    }
  }

  Future<Map<String, String>?> requestMedicalExamination(
      {required int id}) async {
    try {
      Utils.circularIndicator();
      // final body = d.FormData.fromMap(employee.toJson());
      // body.fields.add(const MapEntry("_method", "DELETE"));
      String? token = await Utils.readToken();

      var res = await dio.get(EndPoints.requestMedicalExamination(id),
          // data: body,
          options: Options(headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $token"
          }));

      // await getCompanyEmployees();
      Get.back();
      return {res.data['InvoiceId'].toString(): res.data['InvoiceURL']};
    } on DioException catch (e) {
      logError(e.response!.data);
      Get.back();
    }
    return null;
  }

  Future<bool> requestReservationExtension(
      {required ReservationExtintionModel reservationExtintionModel}) async {
    try {
      Utils.circularIndicator();
      final body = d.FormData.fromMap(reservationExtintionModel.toJson());
      logSuccess(reservationExtintionModel.toJson());
      XFile? tmp;
      if (reservationExtintionModel.file.runtimeType != String) {
        tmp = reservationExtintionModel.file;
        if (tmp != null) {
          body.files.add(MapEntry(
            "file",
            await d.MultipartFile.fromFile(
              tmp.path,
              filename: tmp.name,
              contentType: MediaType('image', '*'),
            ),
          ));
        }
      }
      String? token = await Utils.readToken();

      await dio.post(EndPoints.requestReservationExtension,
          data: body,
          options: Options(headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $token"
          }));

      // await getCompanyEmployees();
      Get.back();
      return true;
    } on DioException catch (e) {
      logError(e.response!.data);
      Get.back();
    }
    return false;
  }

  Future<bool> submitDocs(
      {required List<DesFile> files, required int id}) async {
    try {
      final body = d.FormData();
      for (var i = 0; i < files.length; i++) {
        body.fields.add(MapEntry("documents[$i][name]", files[i].description));
        XFile? tmp = files[i].file;

        body.files.add(MapEntry(
          "documents[$i][file]",
          await d.MultipartFile.fromFile(
            tmp.path,
            filename: tmp.name,
            contentType: MediaType('image', '*'),
          ),
        ));
      }

      Utils.circularIndicator();
      // // body.fields.add(const MapEntry("_method", "DELETE"));
      String? token = await Utils.readToken();

      await dio.post(EndPoints.storeDocs(id),
          data: body,
          options: Options(headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $token"
          }));

      // await getCompanyEmployees();
      Get.back();
      return true;
    } on DioException catch (e) {
      logError(e.response!.data);
      Get.back();
    }
    return false;
  }

  Future<DocumentModel?> showDocs({
    required int employeeId,
    required int docsId,
  }) async {
    try {
      Utils.circularIndicator();
      // // body.fields.add(const MapEntry("_method", "DELETE"));
      String? token = await Utils.readToken();
      logSuccess(
        EndPoints.showDocs(docsId),
      );
      var res = await dio.get(EndPoints.showDocs(docsId),
          options: Options(headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $token"
          }));
      // logSuccess(res.data);
      // await getCompanyEmployees();
      Get.back();
      return DocumentModel.fromJson(res.data['data']);
    } on DioException catch (e) {
      logError(e.response!.data);
      Get.back();
    }
    return null;
  }

  List<ReservationExtintionModel> reservationRequests = [];

  bool getReservationRequestFlag = false;
  Future getReservations() async {
    try {
      getReservationRequestFlag = true;
      String? token = await Utils.readToken();
      var res = await dio.get(EndPoints.getReservationExtension,
          options: Options(headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $token"
          }));
      List<ReservationExtintionModel> tmp = [];
      for (var i in res.data['data']) {
        ReservationExtintionModel t = ReservationExtintionModel.fromJson(i);
        if (t.employee != null) tmp.add(t);
      }
      reservationRequests = tmp;
      logSuccess("Reservation get done");
      getReservationRequestFlag = false;
      update();
    } on DioException catch (e) {
      getReservationRequestFlag = false;
      update();
      logError("Reservation failed:\t" + e.message!);
    }
  }

  Future<bool> approveReservationExtension(
      {required int approve, required int id, String? desc}) async {
    try {
      Utils.circularIndicator();
      final body = d.FormData.fromMap({
        "_method": "PUT",
        "admin_approve": approve,
        if (desc != null) "desc": desc,
      });
      logSuccess(approve);
      String? token = await Utils.readToken();

      await dio.post(EndPoints.updateReservationExtension(id),
          data: body,
          options: Options(headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $token"
          }));

      await getReservations();
      Get.back();
      return true;
    } on DioException catch (e) {
      logError(e.response!.data);
      Get.back();
    }
    return false;
  }

  Future<bool> approveCheckOut({
    required int approve,
    required int id,
  }) async {
    try {
      Utils.circularIndicator();
      String? token = await Utils.readToken();
      d.FormData body = d.FormData.fromMap(
          {"approve": approve, if (approve == 0) "desc": ""});
      logSuccess(token!);

      logSuccess(EndPoints.approveCheckout(id));
      var res = await dio.post(
        EndPoints.approveCheckout(id),
        data: body,
        options: Options(
          headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $token"
          },
        ),
      );

      Get.back();
      Get.offAll(() => CompanyHomePage());
      logSuccess(res.data);
      return true;
    } on DioException catch (e) {
      logError(e.response!.data);
      Get.back();
    }
    return false;
  }

  Future<Map<String, String>?> payCheckOut({
    required int id,
  }) async {
    try {
      Utils.circularIndicator();
      String? token = await Utils.readToken();

      var res = await dio.post(
        EndPoints.payCheckout(id),
        options: Options(
          headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $token"
          },
        ),
      );

      Get.back();

      update();
      logSuccess(res.data);
      return {res.data['InvoiceId'].toString(): res.data['InvoiceURL']};
    } on DioException catch (e) {
      logError(e.response!.data);
      Get.back();
    }
    return null;
  }

  Future<bool> approveDocs(
      {required int approve, required int id, String? desc}) async {
    try {
      Utils.circularIndicator();
      final body = d.FormData.fromMap({
        "approve": approve,
        if (desc != null) "desc": desc,
      });

      String? token = await Utils.readToken();

      var res = await dio.post(EndPoints.approveDocs(id),
          data: body,
          options: Options(headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $token"
          }));
      logSuccess(res.data);
      await getRecruitmentCompanyHomePage();
      Get.back();
      return true;
    } on DioException catch (e) {
      logWarning(e.response!.data);
      Get.back();
    }
    return false;
  }
}
