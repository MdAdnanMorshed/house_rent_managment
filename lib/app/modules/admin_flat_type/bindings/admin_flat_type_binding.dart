import 'package:get/get.dart';

import '../controllers/admin_flat_type_controller.dart';

class AdminFlatTypeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminFlatTypeController>(
      () => AdminFlatTypeController(),
    );
  }
}
