import 'package:get/get.dart';

import '../controllers/admin_play_role_controller.dart';

class AdminPlayRoleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminPlayRoleController>(
      () => AdminPlayRoleController(),
    );
  }
}
