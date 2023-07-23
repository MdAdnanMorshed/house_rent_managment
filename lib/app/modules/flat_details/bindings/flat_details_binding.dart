import 'package:get/get.dart';

import '../controllers/flat_details_controller.dart';

class FlatDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FlatDetailsController>(
      () => FlatDetailsController(),
    );
  }
}
