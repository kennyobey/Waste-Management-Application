import 'package:get/get.dart';
import 'package:halal_design/controllers/auth_reposiotry.dart';


class AppBinding extends Bindings {
  @override
  void dependencies() {
     Get.put(AuthRepository(), permanent: true);
    // Get.put(CurrencyController(), permanent: true);
  }
}