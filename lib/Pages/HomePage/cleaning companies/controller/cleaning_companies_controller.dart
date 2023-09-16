import 'package:get/get.dart';

class CleaningCompanyController extends GetxController {
  List<int> servicesBooked = [];

  void bookService(int i) {
    servicesBooked.add(i);
    update();
  }
}
