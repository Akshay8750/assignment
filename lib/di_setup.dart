import 'package:assignment/data/repository/home_repository.dart';
import 'package:assignment/features/home/home_controller.dart';
import 'package:get/get.dart';

class DISetup {
  static void setup() {
    ///Repositories
    Get.put(HomeRepository());

    ///Controllers
    Get.put(HomeController());
  }
}
