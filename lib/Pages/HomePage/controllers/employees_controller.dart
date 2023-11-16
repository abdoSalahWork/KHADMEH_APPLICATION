import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as d;
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:khedma/Pages/HomePage/company%20home/models/employee_model.dart';
import 'package:khedma/Pages/HomePage/employees/models/employees_filter.dart';
import 'package:khedma/Utils/end_points.dart';
import 'package:khedma/Utils/utils.dart';

class EmployeesController extends GetxController {
  final Dio dio = Utils().dio;
  List<EmployeeModel> employees = [];
  List<EmployeeModel> employeeToShow = [];
  List<EmployeeModel> companyEmployees = [];
  List<EmployeeModel> companyEmployeeToShow = [];
  EmployeesFilter employeesFilter = EmployeesFilter(filterActive: false);
  filterEmployeesByJobs({required List<String> jobs}) {
    List<EmployeeModel> tmp = [];
    for (var i in employees) {
      if (i.jobs!
          .map((e) =>
              Get.locale == const Locale('en', 'US') ? e.nameEn! : e.nameAr!)
          .toSet()
          .intersection(jobs.toSet())
          .isNotEmpty) {
        tmp.add(i);
      }
      if (jobs.isEmpty) {
        employeeToShow = employees;
      } else {
        employeeToShow = tmp;
      }
      update();
    }
  }

  handleEmployeesSearch({required String name}) {
    List<EmployeeModel> tmp = [];
    for (var i in employees) {
      if (i.nameEn!.toLowerCase().contains(name.toLowerCase()) ||
          i.nameAr!.toLowerCase().contains(name.toLowerCase())) {
        logSuccess(name);
        tmp.add(i);
      }
      if (name == "") {
        employeeToShow = employees;
      } else {
        employeeToShow = tmp;
      }
      update();
    }
  }

  handleCompanyEmployeesSearch({required String name}) {
    List<EmployeeModel> tmp = [];
    for (var i in companyEmployees) {
      if (i.nameEn!.toLowerCase().contains(name.toLowerCase()) ||
          i.nameAr!.toLowerCase().contains(name.toLowerCase())) {
        tmp.add(i);
      }
      if (name == "") {
        companyEmployeeToShow = companyEmployees;
      } else {
        companyEmployeeToShow = tmp;
      }
      update();
    }
  }

  applyFilter() {
    List<EmployeeModel> tmp1 = [];
    List<EmployeeModel> tmp2 = [];
    employeeToShow = employees;
    for (var i in employeeToShow) {
      if (employeesFilter.maritalStatus == i.maritalStatus) {
        tmp1.add(i);
      }
    }
    if (employeesFilter.nationalityId != null) {
      for (var i in tmp1) {
        if (i.nationalityId == employeesFilter.nationalityId) {
          tmp2.add(i);
        }
      }
    } else {
      tmp2.addAll(tmp1);
    }
    tmp1 = [];
    if (employeesFilter.minAge != null && employeesFilter.maxAge != null) {
      for (var i in tmp2) {
        if (Utils.age(DateTime.now(), DateTime.parse(i.dateOfBirth!)) <
                employeesFilter.maxAge! &&
            Utils.age(DateTime.now(), DateTime.parse(i.dateOfBirth!)) >=
                employeesFilter.minAge!) {
          tmp1.add(i);
        }
      }
    } else {
      tmp1.addAll(tmp2);
    }
    tmp2 = [];

    if (employeesFilter.langs!.isNotEmpty) {
      for (var i in tmp1) {
        var l = i.languages!
            .map((e) =>
                Get.locale == const Locale('en', 'US') ? e.nameEn! : e.nameAr!)
            .toSet();
        if (employeesFilter.langs!.toSet().intersection(l).isNotEmpty) {
          tmp2.add(i);
        }
      }
    } else {
      tmp2.addAll(tmp1);
    }
    tmp1 = [];
    employeeToShow = tmp2;

    employeesFilter.filterActive = true;

    update();
  }

  applyCompanyFilter() {
    List<EmployeeModel> tmp1 = [];
    List<EmployeeModel> tmp2 = [];
    companyEmployeeToShow = companyEmployees;
    // for (var i in companyEmployeeToShow) {
    //   if (employeesFilter.maritalStatus == i.maritalStatus) {
    //     tmp1.add(i);
    //   }
    // }

    if (employeesFilter.jobs!.isNotEmpty) {
      for (var i in companyEmployeeToShow) {
        var l = i.jobs!
            .map((e) =>
                Get.locale == const Locale('en', 'US') ? e.nameEn! : e.nameAr!)
            .toSet();
        if (employeesFilter.jobs!.toSet().intersection(l).isNotEmpty) {
          tmp2.add(i);
        }
      }
    } else {
      tmp2.addAll(companyEmployeeToShow);
    }
    if (employeesFilter.nationalityId != null) {
      for (var i in tmp2) {
        if (i.nationalityId == employeesFilter.nationalityId) {
          tmp1.add(i);
        }
      }
    } else {
      tmp1.addAll(tmp2);
    }
    tmp2 = [];

    if (employeesFilter.status != null) {
      for (var i in tmp1) {
        if (employeesFilter.status == "booked".tr &&
            i.status != null &&
            i.status!.status == "booked") {
          tmp2.add(i);
        } else if (employeesFilter.status == "pending".tr &&
            i.status != null &&
            i.status!.status == "pending") {
          tmp2.add(i);
        } else if (employeesFilter.status == "not_booked".tr &&
            i.status == null) {
          tmp2.add(i);
        }
      }
    } else {
      tmp2.addAll(tmp1);
    }
    tmp1 = [];
    companyEmployeeToShow = tmp2;

    employeesFilter.filterActive = true;

    update();
  }

  Future createEmployee({required EmployeeModel employee}) async {
    try {
      employee.salaryMonth = "0";
      Utils.circularIndicator();
      final body = d.FormData.fromMap(employee.toJson());
      XFile? image = employee.image;
      XFile? personalImage2 = employee.personalImege2;
      XFile? personalImage3 = employee.personalImege3;

      PlatformFile? passportImage = employee.passportImege;
      PlatformFile? drivingLicense = employee.drivingLicense;
      PlatformFile? scientificCertificate = employee.scientificCertificate;
      PlatformFile? expirementCertificate = employee.expirementCertificate;

      if (image != null) {
        body.files.add(MapEntry(
          "personal_image",
          await d.MultipartFile.fromFile(
            image.path,
            filename: image.name,
            contentType: MediaType('image', '*'),
          ),
        ));
      }
      if (personalImage2 != null) {
        body.files.add(MapEntry(
          "personal_image_2",
          await d.MultipartFile.fromFile(
            personalImage2.path,
            filename: personalImage2.name,
            contentType: MediaType('image', '*'),
          ),
        ));
      }
      if (personalImage3 != null) {
        body.files.add(MapEntry(
          "personal_image_3",
          await d.MultipartFile.fromFile(
            personalImage3.path,
            filename: personalImage3.name,
            contentType: MediaType('image', '*'),
          ),
        ));
      }
      if (passportImage != null) {
        body.files.add(MapEntry(
          "passport_image",
          await d.MultipartFile.fromFile(
            passportImage.path!,
            filename: passportImage.name,
            // contentType: MediaType('image', '*'),
          ),
        ));
      }
      if (drivingLicense != null) {
        body.files.add(MapEntry(
          "driving_license",
          await d.MultipartFile.fromFile(
            drivingLicense.path!,
            filename: drivingLicense.name,
            // contentType: MediaType('image', '*'),
          ),
        ));
      }
      if (expirementCertificate != null) {
        body.files.add(MapEntry(
          "expirement_certificate",
          await d.MultipartFile.fromFile(
            expirementCertificate.path!,
            filename: expirementCertificate.name,
            // contentType: MediaType('image', '*'),
          ),
        ));
      }
      if (scientificCertificate != null) {
        body.files.add(MapEntry(
          "scientific_certificate",
          await d.MultipartFile.fromFile(
            scientificCertificate.path!,
            filename: scientificCertificate.name,
            // contentType: MediaType('image', '*'),
          ),
        ));
      }
      String? token = await Utils.readToken();

      await dio.post(
        EndPoints.storeEmployee,
        data: body,
        options: Options(
          headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $token"
          },
        ),
        onSendProgress: (count, total) {
          logSuccess("${count}/${total}");
        },
      );

      await getCompanyEmployees();
      Get.back();
      return true;
    } on DioException catch (e) {
      logError(e.response!.data);
      Get.back();
      return e.response!.data;
    }
  }

  Future<EmployeeModel?> showEmployee(
      {required int id, required bool indicator}) async {
    try {
      if (indicator) Utils.circularIndicator();
      String? token = await Utils.readToken();

      var res = await dio.get(
        EndPoints.showEmployee(id),
        options: Options(
          headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $token"
          },
        ),
      );
      if (indicator) Get.back();
      return EmployeeModel.fromJson(res.data['data']);
    } on DioException catch (e) {
      logError(e.response!.data);
      if (indicator) Get.back();
    }
    return null;
  }

  Future<bool> deleteEmployee({required EmployeeModel employee}) async {
    try {
      Utils.circularIndicator();
      final body = d.FormData.fromMap(employee.toJson());
      body.fields.add(const MapEntry("_method", "DELETE"));
      String? token = await Utils.readToken();

      await dio.post(EndPoints.deleteEmployee(employee.id!),
          data: body,
          options: Options(headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $token"
          }));

      await getCompanyEmployees();
      Get.back();
      return true;
    } on DioException catch (e) {
      logError(e.response!.data);
      Get.back();
    }
    return false;
  }

  Future updateEmployee({required EmployeeModel employee}) async {
    try {
      Utils.circularIndicator();
      final body = d.FormData.fromMap(employee.toJson());
      body.fields.add(const MapEntry("_method", "PUT"));
      XFile? image;
      if (employee.image.runtimeType != String) {
        image = employee.image;

        if (image != null) {
          body.files.add(MapEntry(
            "personal_image",
            await d.MultipartFile.fromFile(
              image.path,
              filename: image.name,
              contentType: MediaType('image', '*'),
            ),
          ));
        }
      }
      XFile? personalImage2;
      if (employee.personalImege2.runtimeType != String) {
        image = employee.personalImege2;

        if (image != null) {
          body.files.add(MapEntry(
            "personal_image_2",
            await d.MultipartFile.fromFile(
              image.path,
              filename: image.name,
              contentType: MediaType('image', '*'),
            ),
          ));
        }
      }
      XFile? personalImage3;
      if (employee.personalImege3.runtimeType != String) {
        image = employee.personalImege3;

        if (personalImage3 != null) {
          body.files.add(MapEntry(
            "personal_image_3",
            await d.MultipartFile.fromFile(
              personalImage3.path,
              filename: personalImage3.name,
              contentType: MediaType('image', '*'),
            ),
          ));
        }
      }
      PlatformFile? passportImage;
      if (employee.passportImege.runtimeType != String) {
        passportImage = employee.passportImege;

        if (passportImage != null) {
          body.files.add(MapEntry(
            "passport_image",
            await d.MultipartFile.fromFile(
              passportImage.path!,
              filename: passportImage.name,
              // contentType: MediaType('image', '*'),
            ),
          ));
        }
      }
      PlatformFile? drivingLicense;
      if (employee.drivingLicense.runtimeType != String) {
        drivingLicense = employee.drivingLicense;

        if (drivingLicense != null) {
          body.files.add(MapEntry(
            "driving_license",
            await d.MultipartFile.fromFile(
              drivingLicense.path!,
              filename: drivingLicense.name,
              // contentType: MediaType('image', '*'),
            ),
          ));
        }
      }
      PlatformFile? expirementCertificate;
      if (employee.expirementCertificate.runtimeType != String) {
        expirementCertificate = employee.expirementCertificate;

        if (expirementCertificate != null) {
          body.files.add(MapEntry(
            "expirement_certificate",
            await d.MultipartFile.fromFile(
              expirementCertificate.path!,
              filename: expirementCertificate.name,
              // contentType: MediaType('image', '*'),
            ),
          ));
        }
      }
      PlatformFile? scientificCertificate;
      if (employee.scientificCertificate.runtimeType != String) {
        scientificCertificate = employee.scientificCertificate;

        if (scientificCertificate != null) {
          body.files.add(MapEntry(
            "scientific_certificate",
            await d.MultipartFile.fromFile(
              scientificCertificate.path!,
              filename: scientificCertificate.name,
              // contentType: MediaType('image', '*'),
            ),
          ));
        }
      }
      body.files.forEach((element) {
        logSuccess(element.key);
      });
      String? token = await Utils.readToken();
      logSuccess(employee.toJson());
      await dio.post(
        EndPoints.updateEmployee(employee.id!),
        data: body,
        options: Options(headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $token"
        }),
        onSendProgress: (count, total) {
          logWarning("${count}/${total}");
        },
        onReceiveProgress: (count, total) {
          logError("${count}/${total}");
        },
      );

      await getCompanyEmployees();
      Get.back();
      return true;
    } on DioException catch (e) {
      logError(e.response!.data);
      Get.back();
      return e.response!.data;
    }
  }

  bool getEmployeesFlag = false;
  Future getEmployees() async {
    try {
      getEmployeesFlag = true;
      String? token = await Utils.readToken();

      var res = await dio.get(EndPoints.getAllUserEmployees,
          options: Options(headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $token"
          }));
      List<EmployeeModel> tmp = [];
      for (var i in res.data['data']) {
        EmployeeModel t = EmployeeModel.fromJson(i);
        if (t.available == 1) tmp.add(t);
      }
      employees = tmp;
      employeeToShow = tmp;
      logSuccess("Employees get done");
      getEmployeesFlag = false;
      update();
      return true;
    } on DioException {
      getEmployeesFlag = false;
      update();
      logError("Employees failed");
      return false;
    }
  }

  bool getCompanyEmployeesFlag = false;
  Future getCompanyEmployees() async {
    try {
      getCompanyEmployeesFlag = true;
      String? token = await Utils.readToken();

      var res = await dio.get(EndPoints.getAllCompanyEmployees,
          options: Options(headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $token"
          }));
      List<EmployeeModel> tmp = [];
      for (var i in res.data['data']) {
        logSuccess(i);
        EmployeeModel t = EmployeeModel.fromJson(i);
        tmp.add(t);
      }
      companyEmployees = tmp;
      companyEmployeeToShow = tmp;
      logSuccess("Company Employees get done");
      getCompanyEmployeesFlag = false;
      update();
      return true;
    } on DioException catch (e) {
      getCompanyEmployeesFlag = false;
      logError(e.response!.data);
      update();
      logError("Company Employees failed");
      return false;
    }
  }

  Future<EmployeeModel?> showCompanyEmployee(
      {required int id, required bool indicator}) async {
    try {
      if (indicator) Utils.circularIndicator();
      String? token = await Utils.readToken();

      var res = await dio.get(
        EndPoints.showCompanyEmployee(id),
        options: Options(
          headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $token"
          },
        ),
      );
      logSuccess(res.data);

      if (indicator) Get.back();
      return EmployeeModel.fromJson(res.data['data']);
    } on DioException catch (e) {
      logError(e.response!.data);
      if (indicator) Get.back();
    }
    return null;
  }

  Future<EmployeeModel?> showMyEmployee(
      {required int id, required bool indicator}) async {
    try {
      if (indicator) Utils.circularIndicator();
      String? token = await Utils.readToken();

      var res = await dio.get(
        EndPoints.showMyEmployee(id),
        options: Options(
          headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $token"
          },
        ),
      );

      if (indicator) Get.back();
      return EmployeeModel.fromJson(res.data['data']);
    } on DioException catch (e) {
      logError(e.response!.data);
      if (indicator) Get.back();
      return null;
    }
  }

  Future<String?> pendingEmployee({required int id}) async {
    try {
      Utils.circularIndicator();
      String? token = await Utils.readToken();

      var res = await dio.post(
        EndPoints.pendingEmployee(id),
        options: Options(
          headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $token"
          },
        ),
      );

      Get.back();
      return res.data['InvoiceURL'];
    } on DioException catch (e) {
      logError(e.response!.data);
      Get.back();
    }
    return null;
  }

  Future<Map<String, String>?> bookEmployee({required int id}) async {
    try {
      Utils.circularIndicator();
      String? token = await Utils.readToken();

      var res = await dio.post(
        EndPoints.bookEmployee(id),
        options: Options(
          headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $token"
          },
        ),
      );

      Get.back();
      return {res.data['InvoiceId'].toString(): res.data['InvoiceURL']};
    } on DioException catch (e) {
      logError(e.response!.data);
      Get.back();
    }
    return null;
  }
}
