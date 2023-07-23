import 'package:get/get.dart';

import '../controllers/create_flat_controller.dart';

class CreateFlatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateFlatController>(
      () => CreateFlatController(),
    );
  }
}
