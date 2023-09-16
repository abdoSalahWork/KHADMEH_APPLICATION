import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as d;
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:http_parser/http_parser.dart';
import 'package:khedma/Pages/HomePage/company%20home/models/employee_model.dart';
import 'package:khedma/Utils/end_points.dart';
import 'package:khedma/Utils/utils.dart';

class EmployeesController extends GetxController {
  final Dio dio = Utils().dio;
  List<EmployeeModel> employees = [];

  Future createEmployee({required EmployeeModel employee}) async {
    try {
      Utils.circularIndicator();
      final body = d.FormData.fromMap(employee.toJson());
      PlatformFile? image = employee.image;

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
        EndPoints.storeEmployee,
        data: body,
        options: Options(
          headers: {"Accept": "application/json"},
        ),
      );

      await getEmployees();
      Get.back();
      return true;
    } on DioException catch (e) {
      logError(e.response!.data);
      Get.back();
      return e.response!.data;
    }
  }

  Future deleteEmployee(
      {required EmployeeModel employee, required int id}) async {
    try {
      Utils.circularIndicator();
      final body = d.FormData.fromMap(employee.toJson());
      body.fields.add(const MapEntry("_method", "DELETE"));
      await dio.post(EndPoints.deleteEmployee(id), data: body);

      // await getEmployees();
      Get.back();
    } on DioException catch (e) {
      logError(e.message!);
      Get.back();
    }
  }

  Future updateEmployee(
      {required EmployeeModel employee, required int id}) async {
    try {
      Utils.circularIndicator();
      final body = d.FormData.fromMap(employee.toJson());
      body.fields.add(const MapEntry("_method", "PUT"));
      await dio.post(EndPoints.updateEmployee(id), data: body);

      await getEmployees();
      Get.back();
    } on DioException catch (e) {
      logError(e.message!);
      Get.back();
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
        tmp.add(t);
      }
      employees = tmp;
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
}
