import 'package:get/get.dart';

import '../controllers/rent_assign_controller.dart';

class RentAssignBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RentAssignController>(
      () => RentAssignController(),
    );
  }
}
