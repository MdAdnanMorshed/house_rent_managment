import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CreateFlatController extends GetxController {
  final count = 0.obs;
  String dropdownValue = 'Select';
  String dropdownFlatNoValue = 'A1';
  String dropdownFlatRoomValue = 'Select Flat Room';
  String dropdownFlatSizeValue = 'Select Flat Size';

  TextEditingController flatFloorController=TextEditingController();
  TextEditingController flatAmountController=TextEditingController();
  TextEditingController flatServiceController=TextEditingController();
  TextEditingController flatWaterBillController=TextEditingController();
  TextEditingController flatGasBillController=TextEditingController();

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
