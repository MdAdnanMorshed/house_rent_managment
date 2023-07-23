import 'package:get/get.dart';

import '../controllers/admin_flat_size_controller.dart';

class AdminFlatSizeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminFlatSizeController>(
      () => AdminFlatSizeController(),
    );
  }
}
