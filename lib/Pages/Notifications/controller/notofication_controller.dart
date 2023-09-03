import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:khedma/Pages/Notifications/models/notification_model.dart';
import 'package:khedma/Utils/end_points.dart';
import 'package:khedma/Utils/utils.dart';

class NotificationController extends GetxController {
  final Dio dio = Utils().dio;
  List<NotificationModel> notifications = [];

  bool getNotificationsFlag = false;
  Future getNotifications() async {
    try {
      getNotificationsFlag = true;
      String? token = await Utils.readToken();
      var res = await dio.get(EndPoints.notifications,
          options: Options(headers: {"authorization": "Bearer $token"}));
      List<NotificationModel> tmp = [];
      for (var i in res.data['data']) {
        NotificationModel t = NotificationModel.fromJson(i);
        tmp.add(t);
      }
      notifications = tmp;
      logSuccess("Notifications get done");
      getNotificationsFlag = false;
      update();
    } on DioException catch (e) {
      getNotificationsFlag = false;
      update();
      logError(e.response!.data);
      logError("Notifications failed");
    }
  }
}
