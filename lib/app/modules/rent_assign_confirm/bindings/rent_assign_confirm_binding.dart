import 'package:get/get.dart';

import '../controllers/rent_assign_confirm_controller.dart';

class RentAssignConfirmBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RentAssignConfirmController>(
      () => RentAssignConfirmController(),
    );
  }
}
