import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as d;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khedma/Admin/models/about_model.dart';
import 'package:khedma/Admin/models/account_statment.dart';
import 'package:khedma/Admin/models/admin_home_page.dart';
import 'package:khedma/Admin/models/contact_message_model.dart';
import 'package:khedma/Admin/models/contact_model.dart';
import 'package:khedma/Admin/models/my_chart_data.dart';
import 'package:khedma/Admin/models/setting_admin_model.dart';
import 'package:khedma/Utils/end_points.dart';
import 'package:khedma/Utils/utils.dart';
import 'package:khedma/models/me.dart';
import 'package:khedma/models/medicals_model.dart';

class AdminController extends GetxController {
  final Dio dio = Utils().dio;
  bool getAdminHomePageflag = false;
  AdminHomePageModel adminHomePageModel = AdminHomePageModel();
  List<Me> userProfiles = [];
  List<Me> userProfilesToShow = [];
  List<Me> companyProfiles = [];
  List<Me> companyProfilesToShow = [];
  List<MedicalsModel> medicalRequests = [];
  List<AccountStatmentModel> accountStatments = [];
  bool getUserProfilesFlag = false;
  bool getmedicalsRequestsFlag = false;
  bool getCompanyProfilesFlag = false;
  Future<bool> getMedicals() async {
    try {
      getmedicalsRequestsFlag = true;
      String? token = await Utils.readToken();

      var res = await dio.get(
        EndPoints.getMedicals,
        options: Options(
          headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $token"
          },
        ),
      );
      List<MedicalsModel> tmp = [];
      for (var i in res.data['message']) {
        MedicalsModel t = MedicalsModel.fromJson(i);
        tmp.add(t);
      }
      medicalRequests = tmp;

      logSuccess("Medicals get done");

      getmedicalsRequestsFlag = false;
      update();
      return true;
    } on DioException catch (e) {
      getmedicalsRequestsFlag = false;
      logError(e.response!.data);
      update();
      logError("Medicals failed");
      return false;
    }
  }

  handleUserProfilesSearch({required String name}) {
    List<Me> tmp = [];
    for (var i in userProfiles) {
      if (i.fullName!.contains(name)) {
        tmp.add(i);
      }
      if (name == "") {
        userProfilesToShow = userProfiles;
      } else {
        userProfilesToShow = tmp;
      }
      update();
    }
  }

  handleCompanyProfilesSearch({required String name}) {
    List<Me> tmp = [];
    for (var i in companyProfiles) {
      if (i.fullName!.contains(name)) {
        tmp.add(i);
      }
      if (name == "") {
        companyProfilesToShow = companyProfiles;
      } else {
        companyProfilesToShow = tmp;
      }
      update();
    }
  }

  Future<bool> getUserProfiles() async {
    try {
      getUserProfilesFlag = true;
      String? token = await Utils.readToken();

      var res = await dio.get(
        EndPoints.getAllAdminUserProfiles,
        options: Options(
          headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $token"
          },
        ),
      );
      List<Me> tmp = [];
      for (var i in res.data['data']) {
        Me t = Me.fromJson(i);
        tmp.add(t);
      }
      userProfiles = tmp;
      userProfilesToShow = tmp;

      logSuccess("UserProfiles get done");

      getUserProfilesFlag = false;
      update();
      return true;
    } on DioException catch (e) {
      getUserProfilesFlag = false;
      logError(e.response!.data);
      update();
      logError("UserProfiles failed");
      return false;
    }
  }

  Future<bool> getCompanyProfiles() async {
    try {
      getCompanyProfilesFlag = true;
      String? token = await Utils.readToken();

      var res = await dio.get(
        EndPoints.getAllAdminCompanyProfiles,
        options: Options(
          headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $token"
          },
        ),
      );
      List<Me> tmp = [];
      for (var i in res.data['data']) {
        Me t = Me.fromJson(i);
        tmp.add(t);
      }
      companyProfiles = tmp;
      companyProfilesToShow = tmp;

      logSuccess("CompanyProfiles get done");

      getCompanyProfilesFlag = false;
      update();
      return true;
    } on DioException catch (e) {
      getCompanyProfilesFlag = false;
      logError(e.response!.data);
      update();
      logError("CompanyProfiles failed");
      return false;
    }
  }

  bool accountStatmentFlag = true;
  Future<bool> getAccountStatments() async {
    try {
      accountStatmentFlag = true;
      String? token = await Utils.readToken();

      var res = await dio.get(
        EndPoints.getAllAccountStatments,
        options: Options(
          headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $token"
          },
        ),
      );
      List<AccountStatmentModel> tmp = [];
      for (var i in res.data['data']) {
        AccountStatmentModel t = AccountStatmentModel.fromJson(i);
        tmp.add(t);
      }
      accountStatments = tmp;

      logSuccess("account statments get done");

      accountStatmentFlag = false;
      update();
      return true;
    } on DioException catch (e) {
      accountStatmentFlag = false;
      logError(e.response!.data);
      update();
      logError("account statments failed");
      return false;
    }
  }

  showAdminUser({required int id, required bool indicator}) async {
    try {
      if (indicator) Utils.circularIndicator();
      String? token = await Utils.readToken();

      var res = await dio.get(
        EndPoints.showAdminUserProfile(id),
        options: Options(
          headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $token"
          },
        ),
      );

      if (indicator) Get.back();
      return Me.fromJson(res.data['data']);
    } on DioException catch (e) {
      logError(e.message!);
      if (indicator) Get.back();
    }
    return null;
  }

  showAdminCompany({required int id, required bool indicator}) async {
    try {
      if (indicator) Utils.circularIndicator();
      String? token = await Utils.readToken();

      var res = await dio.get(
        EndPoints.showAdminCompanyProfile(id),
        options: Options(
          headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $token"
          },
        ),
      );

      if (indicator) Get.back();
      return Me.fromJson(res.data['data']);
    } on DioException catch (e) {
      logError(e.message!);
      if (indicator) Get.back();
    }
    return null;
  }

  blockProfile(
      {required int id,
      required int block,
      required String userIndicator}) async {
    try {
      Utils.circularIndicator();
      String? token = await Utils.readToken();
      logSuccess(EndPoints.blockProfile(id));
      await dio.post(
        EndPoints.blockProfile(id),
        data: d.FormData.fromMap({"_method": "PUT", "block": block}),
        options: Options(
          headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $token"
          },
        ),
      );
      if (userIndicator == "user") {
        getUserProfiles();
      } else {
        getCompanyProfiles();
      }
      Get.back();
      return true;
    } on DioException catch (e) {
      logError(e.response!.data);
      Get.back();
    }
    return false;
  }

  Future getAdminHomePage() async {
    try {
      getAdminHomePageflag = true;
      update();
      String? token = await Utils.readToken();
      var res = await dio.get(
        EndPoints.getAdminHomePage,
        options: Options(
          headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $token"
          },
        ),
      );

      adminHomePageModel = AdminHomePageModel.fromJson(res.data);

      getBookingPaymentsGraph();
      logSuccess("Admin Home Page get done");
      getAdminHomePageflag = false;
      update();
    } on DioException catch (e) {
      logError(e.response!.data);
      getAdminHomePageflag = false;
      update();
      logError("Admin Home Page failed");
    }
  }

  void getBookingPaymentsGraph() {
    data = [];
    for (int i = 0; i < adminHomePageModel.bookingPaymentsGraph!.length; i++) {
      data.add(
        MyChartData(
          id: i,
          name: adminHomePageModel.bookingPaymentsGraph![i].month!,
          y: adminHomePageModel.bookingPaymentsGraph![i].bookingAmount!
                  .toDouble() /
              100,
          color: Colors.red,
        ),
      );
    }
    update();
  }

  void getBookingsCountGraph() {
    data = [];
    for (int i = 0; i < adminHomePageModel.bookingsCountGraph!.length; i++) {
      data.add(
        MyChartData(
          id: i,
          name: adminHomePageModel.bookingsCountGraph![i].month!,
          y: adminHomePageModel.bookingsCountGraph![i].bookingCount!
                  .toDouble() /
              100,
          color: Colors.red,
        ),
      );
    }
    update();
  }

  void getAdsPaymentsGraph() {
    data = [];
    for (int i = 0; i < adminHomePageModel.adsPaymentsGraph!.length; i++) {
      data.add(
        MyChartData(
          id: i,
          name: adminHomePageModel.adsPaymentsGraph![i].month!,
          y: adminHomePageModel.adsPaymentsGraph![i].adsAmount!.toDouble() /
              100,
          color: Colors.red,
        ),
      );
    }
    update();
  }

  List<MyChartData> data = [];
////////////messages/////////////////
  ContactModel? contactModel;
  AboutModel? aboutModel;
  List<ContactMessageModel> contactMessages = [];

  // Future createContact({required ContactModel Contact}) async {
  //   try {
  //     Utils.circularIndicator();
  //     final body = d.FormData.fromMap(Contact.toJson());

  //     await dio.post(EndPoints.storeContact, data: body);

  //     await getContacts();
  //     Get.back();
  //   } on DioException catch (e) {
  //     logError(e.message!);
  //     Get.back();
  //   }
  // }

  // Future deleteContact({required ContactModel Contact, required int id}) async {
  //   try {
  //     Utils.circularIndicator();
  //     final body = d.FormData.fromMap(Contact.toJson());
  //     body.fields.add(const MapEntry("_method", "DELETE"));
  //     await dio.post(EndPoints.deleteContact(id), data: body);

  //     await getContacts();
  //     Get.back();
  //   } on DioException catch (e) {
  //     logError(e.message!);
  //     Get.back();
  //   }
  // }

  bool getMessagesFlag = false;
  Future getMessages() async {
    try {
      getMessagesFlag = true;
      var res = await dio.get(EndPoints.getMessages);
      List<ContactMessageModel> tmp = [];
      for (var i in res.data['data']) {
        ContactMessageModel t = ContactMessageModel.fromJson(i);
        tmp.add(t);
      }
      contactMessages = tmp;
      logSuccess("Messages get done");
      getMessagesFlag = false;
      update();
    } on DioException {
      getMessagesFlag = false;
      update();
      logError("Messages failed");
    }
  }

  Future<bool> updateContact({
    required ContactModel contact,
  }) async {
    try {
      Utils.circularIndicator();
      final body = d.FormData.fromMap(contact.toJson());
      logSuccess(contact.toJson());
      if (contactModel != null) {
        body.fields.add(const MapEntry("_method", "PUT"));
      }
      logSuccess(body.fields);
      String? token = await Utils.readToken();
      await dio.post(
        contactModel == null
            ? EndPoints.storeContact
            : EndPoints.updateContact(1),
        data: body,
        options: Options(
          headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $token"
          },
        ),
      );

      await getContacts();
      Get.back();
      return true;
    } on DioException catch (e) {
      logError(e.response!.data);
      Get.back();
    }
    return false;
  }

  Future<bool> deleteMedical({required int id}) async {
    try {
      Utils.circularIndicator();
      var body = d.FormData();
      body.fields.add(MapEntry("_method", "DELETE"));
      String? token = await Utils.readToken();
      await dio.post(
        EndPoints.deleteMedical(id),
        data: body,
        options: Options(
          headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $token"
          },
        ),
      );

      await getMedicals();
      update();
      Get.back();
      return true;
    } on DioException catch (e) {
      logError(e.response!.data);
      Get.back();
    }
    return false;
  }

  bool getContactsFlag = false;
  Future getContacts() async {
    try {
      getContactsFlag = true;
      String? token = await Utils.readToken();
      var res = await dio.get(
        EndPoints.getContact,
        options: Options(
          headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $token"
          },
        ),
      );
      if (res.data['data'].isNotEmpty) {
        contactModel = ContactModel.fromJson(res.data['data'][0]);
      }
      logSuccess("Contacts get done");
      getContactsFlag = false;
      update();
    } on DioException {
      getContactsFlag = false;
      update();
      logError("Contacts failed");
    }
  }

  Future<bool> updateAbout({
    required AboutModel about,
  }) async {
    try {
      Utils.circularIndicator();
      final body = d.FormData.fromMap(about.toJson());
      logSuccess(about.toJson());
      if (aboutModel != null) {
        body.fields.add(const MapEntry("_method", "PUT"));
      }
      logSuccess(body.fields);
      String? token = await Utils.readToken();
      await dio.post(
        aboutModel == null ? EndPoints.storeAbout : EndPoints.updateAbout(1),
        data: body,
        options: Options(
          headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $token"
          },
        ),
      );

      await getAbouts();
      Get.back();
      return true;
    } on DioException catch (e) {
      logError(e.response!.data);
      Get.back();
    }
    return false;
  }

  bool getAboutsFlag = false;
  Future getAbouts() async {
    try {
      getAboutsFlag = true;
      String? token = await Utils.readToken();
      var res = await dio.get(
        EndPoints.getAbout,
        options: Options(
          headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $token"
          },
        ),
      );
      if (res.data['data'].isNotEmpty) {
        aboutModel = AboutModel.fromJson(res.data['data'][0]);
      }
      logSuccess("About get done");
      getAboutsFlag = false;
      update();
    } on DioException {
      getAboutsFlag = false;
      update();
      logError("About failed");
    }
  }

  SettingAdmin settingAdmin = SettingAdmin();
  Future getSettingAdmin() async {
    try {
      String? token = await Utils.readToken();
      var res = await dio.get(
        EndPoints.getSettingAdmin,
        options: Options(
          headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $token"
          },
        ),
      );
      settingAdmin = SettingAdmin.fromJson(res.data['data']);
      logSuccess("SettingAdmin get done");
    } on DioException catch (e) {
      logError(e.response!.data);
      logError("SettingAdmin failed");
    }
  }

  Future<bool> updateSettingAdmin({required SettingAdmin settingAdmin}) async {
    try {
      Utils.circularIndicator();
      final body = d.FormData.fromMap(settingAdmin.toJson());
      logSuccess(settingAdmin.toJson());

      body.fields.add(const MapEntry("_method", "PUT"));
      String? token = await Utils.readToken();
      await dio.post(
        EndPoints.updateSettingAdmin,
        data: body,
        options: Options(
          headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $token"
          },
        ),
      );

      await getSettingAdmin();
      Get.back();
      return true;
    } on DioException catch (e) {
      logError(e.response!.data);
      Get.back();
    }
    return false;
  }

  Future<bool> storeMessage({required String message}) async {
    try {
      Utils.circularIndicator();
      final body = d.FormData.fromMap({"message": message});
      String? token = await Utils.readToken();

      await dio.post(
        EndPoints.storeMessage,
        data: body,
        options: Options(
          headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $token",
          },
        ),
      );

      await getContacts();
      Get.back();
      return true;
    } on DioException catch (e) {
      logError(e.message!);
      Get.back();
    }
    return false;
  }
}
