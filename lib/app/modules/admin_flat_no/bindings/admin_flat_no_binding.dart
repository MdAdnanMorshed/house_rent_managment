import 'package:get/get.dart';

import '../controllers/admin_flat_no_controller.dart';

class AdminFlatNoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminFlatNoController>(
      () => AdminFlatNoController(),
    );
  }
}
