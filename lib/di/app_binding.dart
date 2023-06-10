import 'package:get/get.dart';
import 'package:halal_design/controllers/auth_reposiotry.dart';
import 'package:halal_design/controllers/collector_repository.dart';


class AppBinding extends Bindings {
  @override
  void dependencies() {
   Get.put(AuthRepo(), permanent: true);
   Get.put(CollectorRepo(), permanent: true);
    // Get.lazyPut(() => AuthRepo());
    // Get.put(CurrencyController(), permanent: true);
  }
}
