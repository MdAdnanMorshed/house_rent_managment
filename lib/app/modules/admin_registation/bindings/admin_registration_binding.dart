import 'package:get/get.dart';

import '../controllers/admin_registration_controller.dart';

class AdminRegistrationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminRegistrationController>(
      () => AdminRegistrationController(),
    );
  }
}
