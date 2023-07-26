import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:house_management/app/models/create_flat_model.dart';
import 'package:house_management/app/models/flat_floor_model.dart';
import 'package:house_management/app/models/flat_no_model.dart';
import 'package:house_management/app/models/flat_size_model.dart';

import '../../../routes/app_pages.dart';

class CreateFlatController extends GetxController {
  final count = 0.obs;

  TextEditingController flatFloorController = TextEditingController();
  TextEditingController flatAmountController = TextEditingController();
  TextEditingController flatServiceController = TextEditingController();
  TextEditingController flatWaterBillController = TextEditingController();
  TextEditingController flatGasBillController = TextEditingController();

  var mailOrPhoneController = TextEditingController();
  var passwordController = TextEditingController();

  final _flats = <CreateFlatModel>[].obs;
  List<CreateFlatModel> get playRoleList => _flats;

  /// flat No
  final dropdownFlatNoValue = 'A1'.obs;
  final flatNoID = ''.obs;
  final flatNoValue = ''.obs;
  final _flatNos = <FlatNoModel>[].obs;
  List<FlatNoModel> get flatNoList => _flatNos;

  /// Flat Floor
  final dropdownFlatFloorValue = '2nd floor'.obs;
  final flatFloorID = ''.obs;
  final flatFloorValue = ''.obs;
  final _flatFloors = <FlatFloorModel>[].obs;
  List<FlatFloorModel> get flatFloorList => _flatFloors;

  /// Flat Size
  final dropdownFlatSizeValue = '1400 sq fit'.obs;
  final flatSizeID = ''.obs;
  final flatSizeValue = ''.obs;
  final _flatSizes = <FlatSizeModel>[].obs;
  List<FlatSizeModel> get flatSizeList => _flatSizes;

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
  flatNo(List<FlatNoModel> data) {
    _flatNos.value = data;
  }

  flatFloor(List<FlatFloorModel> data) {
    _flatFloors.value = data;
  }

  flatSize(List<FlatSizeModel> data) {
    _flatSizes.value = data;
  }
  createFlat() async {
    final db = FirebaseFirestore.instance;
    final refKey = db.collection('RentOwner_CreateFlat').doc();

    if (flatFloorID.toString() == '' &&
        flatSizeID.toString() == '' &&
        flatNoID.toString() == '') {
      Get.snackbar('Alert', 'Please Select your drop down ');
    } else {
      if (flatAmountController.text == '' &&
          flatServiceController.text == '' &&
          flatGasBillController.text == '' &&
          flatWaterBillController.text == '') {
        print('AdminPlayRoleController.createPlayRole Empty Data');
      } else {
        CreateFlatModel createFlatModel = CreateFlatModel(
          createFlatID: refKey.id,
          roleID:
              '0EjaCfFCHxsLBupU6eMh', // Login er por theke pabo aikon static value set korchi
          flatFloorId: flatFloorID.toString(),
          flatFloor: flatFloorValue.toString(),
          flatSizeId: flatSizeID.toString(),
          flatSize: flatSizeValue.toString(),
          flatNoId: flatNoID.toString(),
          flatNo: flatNoValue.toString(),
          flatAmount: flatAmountController.text,
          flatServiceBill: flatServiceController.text,
          flatGasBill: flatGasBillController.text,
          flatWaterBill: flatWaterBillController.text,
          createdAT: DateTime.now(),
          updateAt: DateTime.now(),
        );
        await refKey.set(createFlatModel.toJson()).then((value) {
          flatAmountController.clear();
          flatServiceController.clear();
          flatGasBillController.clear();
          flatWaterBillController.clear();
          Get.back();
          log("creating flat  has successfully!");
        }, onError: (e) => log("Error booking appointment: $e"));
      }
    }
  }

  getFlat(List<CreateFlatModel> data) {
    _flats.value = data;
  }
}
