import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RentAssignController extends GetxController {
  final count = 0.obs;
  String dropdownValue = 'Select';
  String dropdownFlatNoValue = 'A1';
  String dropdownFlatRoomValue = 'Select Flat Room';
  String dropdownRentTypeValue = 'Select Rent Type';
  String dropdownRentFlatValue = 'Select Flat';

  String? datePicker;
  String? timePicker;

  TextEditingController rentNameController=TextEditingController();
  TextEditingController rentPhoneController=TextEditingController();
  TextEditingController rentAddressController=TextEditingController();
  TextEditingController rentJobController=TextEditingController();
  TextEditingController rentJobInfoController=TextEditingController();
  TextEditingController rentAdvanceAmountController=TextEditingController();

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
