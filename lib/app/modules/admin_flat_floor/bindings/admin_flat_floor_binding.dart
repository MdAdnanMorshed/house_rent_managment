import 'package:get/get.dart';

import '../controllers/admin_flat_floor_controller.dart';

class AdminFlatFloorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminFlatFloorController>(
      () => AdminFlatFloorController(),
    );
  }
}
