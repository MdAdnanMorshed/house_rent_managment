import 'package:get/get.dart';

class LiveChatController extends GetxController {
  final count = 0.obs;
  String dropdownValue = 'Select';
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
