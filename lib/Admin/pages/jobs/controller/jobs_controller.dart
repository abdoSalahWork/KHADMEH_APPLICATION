import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as d;
import 'package:get/get.dart';
import 'package:khedma/Admin/pages/jobs/models/job_model.dart';
import 'package:khedma/Utils/end_points.dart';
import 'package:khedma/Utils/utils.dart';

class JobsController extends GetxController {
  final Dio dio = Utils().dio;
  List<JobModel> jobs = [];

  Future createJob({required JobModel job}) async {
    try {
      Utils.circularIndicator();
      final body = d.FormData.fromMap(job.toJson());

      await dio.post(EndPoints.storeJob, data: body);

      await getjobs();
      Get.back();
    } on DioException catch (e) {
      logError(e.message!);
      Get.back();
    }
  }

  Future deleteJob({required JobModel job, required int id}) async {
    try {
      Utils.circularIndicator();
      final body = d.FormData.fromMap(job.toJson());
      body.fields.add(const MapEntry("_method", "DELETE"));
      await dio.post(EndPoints.deleteJob(id), data: body);

      await getjobs();
      Get.back();
    } on DioException catch (e) {
      logError(e.message!);
      Get.back();
    }
  }

  Future updateJob({required JobModel job, required int id}) async {
    try {
      Utils.circularIndicator();
      final body = d.FormData.fromMap(job.toJson());
      body.fields.add(const MapEntry("_method", "PUT"));
      await dio.post(EndPoints.updateJob(id), data: body);

      await getjobs();
      Get.back();
    } on DioException catch (e) {
      logError(e.message!);
      Get.back();
    }
  }

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
}
