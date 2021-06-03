import 'package:get/get.dart';

import '../controllers/defaulthome_controller.dart';

class DefaulthomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DefaulthomeController>(
      () => DefaulthomeController(),
    );
  }
}
