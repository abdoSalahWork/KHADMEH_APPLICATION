import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as d;
import 'package:get/get.dart';
import 'package:khedma/Admin/pages/Company%20Types/controller/models/company_type.dart';
import 'package:khedma/Utils/end_points.dart';
import 'package:khedma/Utils/utils.dart';

class CompanyTypesController extends GetxController {
  final Dio dio = Utils().dio;
  List<CompanyType> companyTypes = [];

  Future createCompanyType({required CompanyType companyType}) async {
    try {
      Utils.circularIndicator();
      final body = d.FormData.fromMap(companyType.toJson());

      await dio.post(EndPoints.storeCompanyType, data: body);

      await getCompanyTypes();
      Get.back();
    } on DioException catch (e) {
      logError(e.message!);
      Get.back();
    }
  }

  Future deleteCompanyType(
      {required CompanyType companyType, required int id}) async {
    try {
      Utils.circularIndicator();
      final body = d.FormData.fromMap(companyType.toJson());
      body.fields.add(const MapEntry("_method", "DELETE"));
      await dio.post(EndPoints.deleteCompanyType(id), data: body);

      await getCompanyTypes();
      Get.back();
    } on DioException catch (e) {
      logError(e.message!);
      Get.back();
    }
  }

  Future updateCompanyType(
      {required CompanyType companyType, required int id}) async {
    try {
      String? token = await Utils.readToken();

      Utils.circularIndicator();
      final body = d.FormData.fromMap(companyType.toJson());
      body.fields.add(
        const MapEntry("_method", "PUT"),
      );
      await dio.post(
        EndPoints.updateCompanyType(id),
        data: body,
        options: Options(
          headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $token"
          },
        ),
      );

      await getCompanyTypes();
      Get.back();
    } on DioException catch (e) {
      logError(e.message!);
      Get.back();
    }
  }

  bool getCompanyTypesFlag = false;
  Future getCompanyTypes() async {
    try {
      getCompanyTypesFlag = true;
      String? token = await Utils.readToken();

      var res = await dio.get(
        EndPoints.getAllCompanyTypes,
        options: Options(
          headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $token"
          },
        ),
      );
      List<CompanyType> tmp = [];
      for (var i in res.data['data']) {
        CompanyType t = CompanyType.fromJson(i);
        tmp.add(t);
      }
      companyTypes = tmp;
      logSuccess("Company Types get done");
      getCompanyTypesFlag = false;
      update();
    } on DioException {
      getCompanyTypesFlag = false;
      update();
      logError("Company Types failed");
    }
  }
}
